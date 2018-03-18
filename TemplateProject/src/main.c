#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_exti.h"
#include "stm32f0xx_ll_utils.c"

#define DIG1 LL_GPIO_PIN_8
#define DIG2 LL_GPIO_PIN_9
#define DIG3 LL_GPIO_PIN_10
#define DIG4 LL_GPIO_PIN_11
#define BUT1 0b01
#define BUT2 0b10
#define BELLPIN LL_GPIO_PIN_2

void SystemClock_Config(void);
void Ports_Config(void);
void Exti_Config(void);
void TurnOn(uint16_t digNum, uint8_t number);
void Set_Time(uint8_t alarm_flag);

uint64_t min = 0, hour = 0;
int dynamic_tick;
uint8_t button1_flag = 0;
uint8_t button2_flag = 0;
uint8_t button2_long_flag = 0;
uint8_t point_flag = 0;

uint8_t codes[10] = {
    0b0111111, 
    0b0000110,
    0b1011011,
    0b1001111,
    0b1100110,
    0b1101101,
    0b1111101,
    0b0000111,
    0b1111111,
    0b1101111
};

uint16_t digit[4] = {
    (DIG2 | DIG3 | DIG4),
    (DIG1 | DIG3 | DIG4),
    (DIG1 | DIG2 | DIG4),
    (DIG1 | DIG2 | DIG3)
};

uint8_t time[4] = {1, 2, 0, 0};
uint8_t alarm[4] = {0, 0, 0, 0};

main(void) {
        SystemClock_Config();
        Ports_Config(); 
        Exti_Config();

        uint8_t no_alarm_flag = 0;
        
        while(1) {
            
            for(uint8_t i = 0; i < 4; i ++) { //see_real_time
                TurnOn(i, time[i]);
            }
           

            if((time[0] == alarm[0] && time[1] == alarm[1] && 
                time[2] == alarm[2] && time[3] == alarm[3]) && no_alarm_flag) {
                LL_GPIO_SetOutputPin(GPIOA, BELLPIN);
                LL_mDelay(3);
                LL_GPIO_ResetOutputPin(GPIOA, BELLPIN);
                if(button1_flag) {
                    button1_flag = 0;
                    no_alarm_flag = 0;
                }
            }
            
            while(button1_flag) {     //set_clock
                button1_flag = 0;
                Set_Time(0);
            }
            
            while(button2_flag) {     //set_alarm
                button2_flag = 0;
                no_alarm_flag = 1;
                Set_Time(1);
            }
            
            while(button2_long_flag) { //see_alarm_time
                for(uint8_t i = 0; i < 4; i ++) {
                    TurnOn(i, alarm[i]);
                }
            }
        }
}

void Set_Time(uint8_t alarm_flag) {
    for(uint8_t i = 0; i < 4; i++) {
        uint64_t a = 0;
        LL_GPIO_SetOutputPin(GPIOB, codes[a] | digit[i]);
        while(1) {
            while(button2_flag) {
                button2_flag = 0;
                LL_GPIO_ResetOutputPin(GPIOB, codes[a] | digit[i]);
                a++;
                switch(i) {
                    case 0: if(a == 3) a = 0; break;
                    case 1: if(time[0] == 2 && a == 4) a = 0; break; 
                    case 2: if(a == 6) a = 0; break;
                }
                if(a == 10) a = 0;
                LL_GPIO_SetOutputPin(GPIOB, codes[a] | digit[i]);
            }
            while(button1_flag) {
                button1_flag = 0;
                if(alarm_flag == 0) time[i] = a;
                if(alarm_flag == 1) alarm[i] = a;
                goto label;
            }
        }
label:
        LL_GPIO_ResetOutputPin(GPIOB, codes[a] | digit[i]);
    }
    hour = time[0] * 10 + time[1];
    min = time[2] * 10 + time[3];
}

void TurnOn(uint16_t digNum, uint8_t number) {
    int point_code = 0;
    if(digNum == 1 && point_flag && !button2_long_flag) point_code = 0b10000000;
    LL_GPIO_SetOutputPin(GPIOB, codes[number] | digit[digNum] | point_code);
    LL_mDelay(2);
    LL_GPIO_ResetOutputPin(GPIOB, codes[number] | digit[digNum] | point_code);
}


/*
  * Sysm Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */

void
SystemClock_Config() {
        /* Set FLASH latency */
        LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

        /* Enable HSI and wait for activation*/
        LL_RCC_HSI_Enable();
        while (LL_RCC_HSI_IsReady() != 1);

        /* Main PLL configuration and activation */
        LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                    LL_RCC_PLL_MUL_12);

        LL_RCC_PLL_Enable();
        while (LL_RCC_PLL_IsReady() != 1);

        /* Sysclk activation on the main PLL */
        LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
        LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
        while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

        /* Set APB1 prescaler */
        LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

        /* Set systick to 1ms */
        SysTick_Config(48000000/1000);

        /* Update CMSIS variable (which can be updated also
         * through SystemCoreClockUpdate function) */
        SystemCoreClock = 48000000;
}

void Ports_Config() {
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);

        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_5, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_10, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_11, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_12, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_13, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_14, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_15, LL_GPIO_MODE_OUTPUT);

        LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_1, LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
}

void Exti_Config(void) {
    LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE0 | LL_SYSCFG_EXTI_LINE1);
    
    LL_EXTI_EnableRisingTrig_0_31(LL_EXTI_LINE_0 | LL_EXTI_LINE_1);
    
    LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_0 | LL_EXTI_LINE_1);
 
    NVIC_SetPriority(EXTI0_1_IRQn, 1);
    NVIC_EnableIRQ(EXTI0_1_IRQn);
}

void EXTI0_1_IRQHandler(void) {
    if (LL_EXTI_IsActiveFlag_0_31(LL_EXTI_LINE_0)) { 
        LL_mDelay(100);
        if(LL_GPIO_IsInputPinSet(GPIOA, BUT1)) {
            button1_flag = 1;
        }
        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0); 
    } 
    
    if (LL_EXTI_IsActiveFlag_0_31(LL_EXTI_LINE_1)) { 
        LL_mDelay(100);
        if(LL_GPIO_IsInputPinSet(GPIOA, BUT2)) {
            LL_mDelay(500);
            if(LL_GPIO_IsInputPinSet(GPIOA, BUT2)) {
                button2_long_flag = !button2_long_flag;
            }
            else button2_flag = 1;
        }
        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_1); 
    } 
}

void
NMI_Handler(void) {
}

void
HardFault_Handler(void) {
        while (1);
}

void
SVC_Handler(void) {
}

void
PendSV_Handler(void) {
}

int tick;
void
SysTick_Handler(void) {
    dynamic_tick++;
    tick++;
    if(tick % 1000 == 0) {
        point_flag = !point_flag;
    }
    if (tick % 60000 == 0) {
        min++;
        if(min == 60) {
            min = 0;
            hour++;
            if(hour == 24) {
                hour = 0;
            }
        }
        time[0] = hour / 10;
        time[1] = hour % 10;
        time[2] = min / 10;
        time[3] = min % 10;
    }
}
