#include <catch2/catch.hpp>

#include <joints.hpp>

const Angle A_PI_2     = Angle::rad( pi / 2 );
const Angle A_PI       = Angle::rad( pi );
const Angle A_PI_2_neg = Angle::rad( - pi / 2 );
const Angle A_PI_neg   = Angle::rad( - pi );

TEST_CASE( "Base RigidJoint" ) {
    auto j = rofi::RigidJoint( translate( { 42, 42, 42 } ) );
    CHECK( equals( j.sourceToDest(), translate( { 42, 42, 42 } ) ) );
    CHECK( equals( j.destToSource(), translate( { -42, -42, -42 } ) ) );

    j = rofi::RigidJoint( rotate( M_PI_2, { 1, 0, 0 } ) * translate( { 20, 0, 0 } ) );
    CHECK( equals( j.sourceToDest(), { { 1, 0,  0, 20 }
                                     , { 0, 0, -1,  0 }
                                     , { 0, 1,  0,  0 }
                                     , { 0, 0,  0,  1 } } ) );
    CHECK( equals( j.sourceToDest() * j.destToSource(), identity ) );
    CHECK( equals( j.sourceToDest(), rotate( M_PI_2, { 1, 0, 0 } ) * translate( { 20, 0, 0 } ) ) );
}

TEST_CASE( "Base RotationJoint" ) {
    SECTION( "basic creation at one point" ) {
        // Vector sourceOrigin, Vector sourceAxis, Vector destOrigin, Vector desAxis, double min, double max
        auto j = rofi::RotationJoint( { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }, A_PI_2_neg, A_PI_2 );
        j.positions = { Angle::rad( 0 * M_PI ) }; // set the angle of the rotation
        CHECK( equals( j.sourceToDest(), identity ) );
        CHECK( equals( j.destToSource(), identity ) );
    }

    SECTION( "rotation by 0" ) {
        auto j = rofi::RotationJoint( { 0, 0, 0 }, { 0, 0, 0 }, { 42, 42, 42 }, { 1, 0, 0 }, A_PI_neg, A_PI );
        j.positions = { Angle::rad( 0 ) };
        CHECK( equals( j.sourceToDest(), translate( { 42, 42, 42 } ) ) );
        CHECK( equals( j.destToSource(), translate( { -42, -42, -42 } ) ) );
        CHECK( equals( j.sourceToDest() * j.destToSource(), identity ) );
        j = rofi::RotationJoint( identity, { 1, 0, 0 }, translate( { 42, 42, 42 } ), A_PI_2_neg, A_PI_2 );
        j.positions = { Angle::deg( 0 ) };
        CHECK( equals( j.sourceToDest(), translate( { 42, 42, 42 } ) ) );
        CHECK( equals( j.destToSource(), translate( { -42, -42, -42 } ) ) );
        CHECK( equals( j.sourceToDest() * j.destToSource(), identity ) );
    }

    SECTION( "sourceToDest on a ptr of type Joint" ) {
        auto j = rofi::RotationJoint( identity, { 1, 0, 0 }, translate( { 42, 42, 42 } ), A_PI_2_neg, A_PI_2 );
        REQUIRE( j.positions.size() == 0 );
        auto* jj = static_cast< rofi::Joint* >( &j );
        jj->sourceToDest( { A_PI } );
        REQUIRE( j.positions.size() == 1 );
        CHECK( j.positions[ 0 ] == A_PI );
    }
}

TEST_CASE( "sourceToDest and destToSource" ) {
    SECTION( "Unit size" ) {
        auto j = rofi::RotationJoint( { 0, 0, 0 }, { 0, 0, 0 }, { 1, 0, 0 }, { 1, 0, 0 }, A_PI_2_neg, A_PI_2 );
        j.positions = { Angle::deg( 0 ) };
        CHECK( equals( j.sourceToDest(), translate( {  1, 0, 0 } ) ) );
        CHECK( equals( j.destToSource(), translate( { -1, 0, 0 } ) ) );
        j.positions = { Angle::rad( 2 * M_PI ) };
        CHECK( equals( j.sourceToDest(), translate( { 1, 0, 0 } ) ) );
        j.positions = { A_PI_2 };
        CHECK( equals( j.sourceToDest(), rotate( M_PI_2, { 1, 0, 0 } ) * translate( { 1, 0, 0 } ) ) );
        CHECK( equals( j.sourceToDest() * j.destToSource(), identity ) );
        CHECK_FALSE( equals( j.destToSource(), j.sourceToDest() ) );
    }

    SECTION( "Bigger size" ) {
        auto j = rofi::RotationJoint( { 0, 0, 0 }, { 0, 0, 0 }, { 5, 0, 0 }, { 0, 1, 0 }, A_PI_2_neg, A_PI_2 );
        j.positions = { Angle::deg( 0 ) };
        CHECK( equals( j.sourceToDest(), translate( { 5, 0, 0 } ) ) );
        j.positions = { A_PI };
        CHECK( equals( j.sourceToDest(), rotate( M_PI, { 0, 1, 0 } ) * translate( { 5, 0, 0 } ) ) );
        CHECK( equals( center( j.sourceToDest() ), { -5, 0, 0, 1 } ) );
        j.positions = { A_PI_2 };
        CHECK( equals( j.sourceToDest(), rotate( M_PI_2, { 0, 1, 0 } ) * translate( { 5, 0, 0 } ) ) );
        CHECK( equals( center( j.sourceToDest() ), { 0, 0, -5, 1 } ) );
        j.positions = { A_PI_2_neg };
        CHECK( equals( j.sourceToDest(), rotate( -M_PI_2, { 0, 1, 0 } ) * translate( { 5, 0, 0 } ) ) );
        CHECK( equals( center( j.sourceToDest() ), { 0, 0, 5, 1 } ) );
        CHECK( equals( j.sourceToDest() * j.destToSource(), identity ) );
    }
}

TEST_CASE( "joint limits" ) {
    SECTION( "RigidJoint" ) {
        auto j = rofi::RigidJoint( identity );
        CHECK( j.paramCount() == 0 );
        CHECK_THROWS( j.jointLimits( 10 ) );
    }

    SECTION( "RotationJoint" ) {
        auto j = rofi::RotationJoint( identity, { 0, 2, 1 }, identity, A_PI_neg, A_PI );
        CHECK( j.paramCount() == 1 );
        CHECK_THROWS( j.jointLimits( 1 ) );
        CHECK_NOTHROW( j.jointLimits( 0 ) );
    }
}
