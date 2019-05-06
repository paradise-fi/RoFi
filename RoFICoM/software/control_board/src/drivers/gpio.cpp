#include "gpio.hpp"
#include <system/dbg.hpp>

Gpio::Handler Gpio::_lines[ 16 ];

Gpio GpioA( GPIOA );
Gpio GpioB( GPIOB );

extern "C" void EXTI0_1_IRQHandler() {
    Gpio::_handleIrq( 1 );
}

extern "C" void EXTI2_3_IRQHandler() {
    Gpio::_handleIrq( 2 );
    Gpio::_handleIrq( 3 );
}

extern "C" void EXTI4_15_IRQHandler() {
    for ( int i = 4; i != 16; i++ ) {
        Gpio::_handleIrq( i );
    }
}