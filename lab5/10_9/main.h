// main.h
// Josh Brake
// jbrake@hmc.edu
// 10/31/22 

#ifndef MAIN_H
#define MAIN_H

#include "STM32L432KC.h"
#include <stm32l432xx.h>

///////////////////////////////////////////////////////////////////////////////
// Custom defines
///////////////////////////////////////////////////////////////////////////////
    
#define encoderA PA6
#define encoderB PA8
#define DELAY_TIM TIM2

// void configureClock(void);

// void configureFlash(void);

// void gpioEnable(uint8_t port);

// void pinMode(uint8_t pin, uint8_t mode);

void initTIM(TIM_TypeDef *TIMx);

void delay_millis(TIM_TypeDef *TIMx, uint32_t ms);

void EXTI9_5_IRQHandler(void);

int _write(int file, char *ptr, int len);

int main(void);
// int digitalRead(uint8_t pin);

// uint8_t gpioPinOffset(uint8_t pin);


#endif // MAIN_H