#include "roficomPlugin.hpp"

#include <cassert>
#include <cmath>

namespace gazebo
{
std::recursive_mutex RoFICoMPlugin::positionMutex;
std::map< const physics::Model *, RoFICoMPlugin::Position > RoFICoMPlugin::positionsMap;

void RoFICoMPlugin::Load( physics::ModelPtr model, sdf::ElementPtr /*sdf*/ )
{
    _model = std::move( model );
    assert( _model );
    gzmsg << "The RoFICoM plugin is attached to model [" << _model->GetScopedName() << "]\n";

    if ( !hasAttacherPlugin( _model->GetWorld() ) )
    {
        gzerr << "Could not find the attacher world plugin. "
              << "Connecting roficoms will probably not work properly.\n";
    }

    loadJoint();
    assert( extendJoint && *extendJoint );

    updatePosition( Position::Retracted );

    initCommunication();
    assert( _node );
    roficomConnection.load( *this, _model, _node );

    gzmsg << "RoFICoM plugin ready\n";
}

void RoFICoMPlugin::jointPositionReachedCallback( double desiredPosition )
{
    assert( extendJoint );
    assert( *extendJoint );

    if ( desiredPosition <= extendJoint->getMinPosition() + extendJoint->positionPrecision )
    {
        updatePosition( Position::Retracted );
    }
    else if ( desiredPosition >= extendJoint->getMaxPosition() - extendJoint->positionPrecision )
    {
        std::lock_guard< std::recursive_mutex > lock( positionMutex );
        updatePosition( Position::Extended );
        roficomConnection.connectToNearbyRequest();
    }
    else
    {
        gzerr << "Position of extend joint reached, but is not a limit\n";
    }
}

void RoFICoMPlugin::loadJoint()
{
    auto pluginSdf = getPluginSdf( _model->GetSDF(), "libroficomPlugin.so" );
    auto pidValuesVector = PIDLoader::loadControllerValues( pluginSdf );
    assert( pidValuesVector.size() == 1 && "expected 1 controlled joint" );
    auto & pidValue = pidValuesVector.at( 0 );

    auto joint = _model->GetJoint( pidValue.jointName );
    assert( joint && "no joint with specified name found" );

    extendJoint = std::make_unique< JointData< PIDController > >(
            std::move( joint ),
            std::move( pidValue ),
            [ this ]( double pos ) { this->jointPositionReachedCallback( pos ); } );

    assert( extendJoint );
    assert( extendJoint->joint );
    assert( extendJoint->joint->GetMsgType() == msgs::Joint::PRISMATIC );
}

void RoFICoMPlugin::connect()
{
    gzmsg << "Extending connector " << connectorNumber << " (" << _model->GetScopedName() << ")\n";

    std::lock_guard< std::recursive_mutex > lock( positionMutex );

    switch ( getPosition() )
    {
        case Position::Extended:
        case Position::Extending:
        {
            gzwarn << "Already extending (" << _model->GetScopedName() << ")\n";
            return;
        }
        default:
            break;
    }

    updatePosition( Position::Extending );
    extend();
}

void RoFICoMPlugin::disconnect()
{
    gzmsg << "Retracting connector " << connectorNumber << " (" << _model->GetScopedName() << ")\n";

    std::lock_guard< std::recursive_mutex > lock( positionMutex );

    switch ( getPosition() )
    {
        case Position::Retracted:
        case Position::Retracting:
        {
            gzwarn << "Already retracting (" << _model->GetScopedName() << ")\n";
            return;
        }
        default:
            break;
    }

    updatePosition( Position::Retracting );
    roficomConnection.disconnectRequest();
    retract();
}

void RoFICoMPlugin::sendPacket( const rofi::messages::Packet & packet )
{
    gzmsg << "Sending packet (" << _model->GetScopedName() << ")\n";

    roficomConnection.sendPacket( packet );
}

void RoFICoMPlugin::onPacket( const rofi::messages::Packet & packet )
{
    gzmsg << "Received packet (" << _model->GetScopedName() << ")\n";

    auto msg = getConnectorResp( rofi::messages::ConnectorCmd::PACKET );
    *msg.mutable_packet() = packet;
    _pubRofi->Publish( std::move( msg ), true );
}

bool RoFICoMPlugin::isConnected() const
{
    bool connected = roficomConnection.isConnected();
    assert( !connected || getPosition() == Position::Extended );
    return connected;
}

void RoFICoMPlugin::initCommunication()
{
    assert( _model );

    if ( _node )
    {
        _node->Fini();
    }

    _node = boost::make_shared< transport::Node >();
    assert( _node );
    _node->Init( getElemPath( _model ) );

    _pubRofi = _node->Advertise< rofi::messages::ConnectorResp >( "~/response" );
    _subRofi = _node->Subscribe( "~/control", &RoFICoMPlugin::onConnectorCmd, this );
    assert( _pubRofi );
    assert( _subRofi );
}

void RoFICoMPlugin::extend()
{
    assert( extendJoint );
    extendJoint->pid.setTargetPositionWithSpeed( extendJoint->getMaxPosition(),
                                                 extendJoint->getMaxVelocity() );
}

void RoFICoMPlugin::retract()
{
    assert( extendJoint );
    extendJoint->pid.setTargetPositionWithSpeed( extendJoint->getMinPosition(),
                                                 extendJoint->getMaxVelocity() );
}
std::optional< RoFICoMPlugin::Orientation > RoFICoMPlugin::getOrientation() const
{
    auto orientation = roficomConnection.getOrientation();
    assert( orientation.has_value() == isConnected() );
    return orientation;
}

void RoFICoMPlugin::updatePosition( Position newPosition )
{
    assert( _model );

    std::lock_guard< std::recursive_mutex > lock( positionMutex );

    positionsMap[ _model.get() ] = newPosition;
}

RoFICoMPlugin::Position RoFICoMPlugin::getPosition() const
{
    assert( _model );

    return getOtherPosition( _model );
}

RoFICoMPlugin::Position RoFICoMPlugin::getOtherPosition( physics::ModelPtr roficom )
{
    assert( roficom );
    assert( isRoFICoM( roficom ) );

    std::lock_guard< std::recursive_mutex > lock( positionMutex );

    return positionsMap[ roficom.get() ];
}

void RoFICoMPlugin::removePosition()
{
    assert( _model );

    std::lock_guard< std::recursive_mutex > lock( positionMutex );

    positionsMap.erase( _model.get() );
}

void RoFICoMPlugin::onConnectorCmd( const ConnectorCmdPtr & msg )
{
    using rofi::messages::ConnectorCmd;
    using rofi::messages::ConnectorState;

    connectorNumber = msg->connector();

    switch ( msg->cmdtype() )
    {
        case ConnectorCmd::NO_CMD:
        {
            _pubRofi->Publish( getConnectorResp( ConnectorCmd::NO_CMD ), true );
            gzmsg << "Sending response to NO_CMD message (" << _model->GetScopedName() << ")\n";
            break;
        }
        case ConnectorCmd::GET_STATE:
        {
            auto msg = getConnectorResp( ConnectorCmd::GET_STATE );
            auto & state = *msg.mutable_state();

            {
                switch ( getPosition() )
                {
                    case Position::Extended:
                    case Position::Extending:
                    {
                        state.set_position( true );

                        auto orientation = getOrientation();
                        assert( orientation.has_value() == isConnected() );

                        if ( orientation )
                        {
                            state.set_connected( true );
                            state.set_orientation( *orientation );
                        }
                        else
                        {
                            state.set_connected( false );
                        }
                        break;
                    }
                    case Position::Retracting:
                    case Position::Retracted:
                    {
                        state.set_position( false );
                        state.set_connected( false );
                        break;
                    }
                }
            }
            _pubRofi->Publish( std::move( msg ), true );
            gzmsg << "Returning state (" << _model->GetScopedName() << ")\n";
            break;
        }
        case ConnectorCmd::CONNECT:
        {
            connect();
            break;
        }
        case ConnectorCmd::DISCONNECT:
        {
            disconnect();
            break;
        }
        case ConnectorCmd::PACKET:
        {
            sendPacket( msg->packet() );
            break;
        }
        case ConnectorCmd::CONNECT_POWER:
        {
            gzerr << "Connecting power line is not implemented\n";
            break;
        }
        case ConnectorCmd::DISCONNECT_POWER:
        {
            gzerr << "Disconnecting power line is not implemented\n";
            break;
        }
        default:
            gzerr << "Unknown command type: " << msg->cmdtype() << " (" << _model->GetScopedName()
                  << ")\n";
            break;
    }
}

rofi::messages::ConnectorResp RoFICoMPlugin::getConnectorResp(
        rofi::messages::ConnectorCmd::Type cmdtype ) const
{
    rofi::messages::ConnectorResp resp;
    resp.set_connector( connectorNumber );
    resp.set_cmdtype( cmdtype );
    return resp;
}

GZ_REGISTER_MODEL_PLUGIN( RoFICoMPlugin )

} // namespace gazebo
