#pragma once

#include <atomic>
#include <cassert>
#include <functional>
#include <map>
#include <thread>
#include <type_traits>

#include "concurrent_queue.hpp"
#include "jthread/jthread.hpp"
#include "rofi_hal.hpp"

#include <rofiResp.pb.h>


namespace rofi::hal
{
class WaitCallbacks
{
public:
    using Callback = std::function< void() >;

    WaitCallbacks() = default;

    WaitCallbacks( const WaitCallbacks & ) = delete;
    WaitCallbacks & operator=( const WaitCallbacks & ) = delete;
    WaitCallbacks & operator=( WaitCallbacks && ) = delete;

    WaitCallbacks( WaitCallbacks && other )
    {
        std::lock_guard< std::mutex > lock( other._mutex );
        _callbacks = std::move( other._callbacks );
    }


    void registerCallback( int waitId, Callback && callback )
    {
        assert( callback );
        std::lock_guard< std::mutex > lock( _mutex );
        _callbacks.try_emplace( waitId, std::move( callback ) );
    }
    void registerCallback( int waitId, const Callback & callback )
    {
        assert( callback );
        std::lock_guard< std::mutex > lock( _mutex );
        _callbacks.try_emplace( waitId, callback );
    }

    Callback getAndEraseCallback( int waitId )
    {
        Callback oldCallback;

        {
            std::lock_guard< std::mutex > lock( _mutex );
            oldCallback = std::move( _callbacks[ waitId ] );
            _callbacks.erase( waitId );
        }

        return oldCallback;
    }

private:
    mutable std::mutex _mutex;
    std::map< int, Callback > _callbacks;
};


class WaitWorker
{
    using Message = rofi::messages::RofiResp;
    using WaitCallback = WaitCallbacks::Callback;

public:
    WaitWorker()
    {
        _workerThread = std20::jthread(
                [ this ]( std20::stop_token stoken ) { this->run( std::move( stoken ) ); } );
    }

    WaitWorker( const WaitWorker & ) = delete;
    WaitWorker & operator=( const WaitWorker & ) = delete;

    ~WaitWorker()
    {
        // End thread before destructor ends
        if ( _workerThread.joinable() )
        {
            _workerThread.request_stop();
            _workerThread.join();
        }
    }


    void processMessage( int waitId )
    {
        _waitIdsQueue.push( waitId );
    }

    // Returns the wait Id
    int registerWaitCallback( WaitCallback && callback )
    {
        assert( callback );

        auto waitId = _nextWaitId.fetch_add( 1 );

        _callbacks.registerCallback( waitId, std::move( callback ) );

        return waitId;
    }

private:
    void callCallback( int waitId )
    {
        auto callback = _callbacks.getAndEraseCallback( waitId );
        if ( callback )
        {
            callback();
        }
        else
        {
            std::cerr << "Got wait response without a callback waiting (ID: " << waitId
                      << "). Ignoring...\n";
        }
    }

    void run( std20::stop_token stoken )
    {
        while ( true )
        {
            auto waitId = _waitIdsQueue.pop( stoken );
            if ( !waitId )
            {
                return;
            }
            callCallback( *waitId );
        }
    }


    WaitCallbacks _callbacks;
    ConcurrentQueue< int > _waitIdsQueue;
    std::atomic_int _nextWaitId = 1;

    std20::jthread _workerThread; // Change to std::jthread with C++20
};

} // namespace rofi::hal
