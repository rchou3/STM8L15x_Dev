/**
  ******************************************************************************
  * @file    STM8L_nucleo.h
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    12-January-2018
  * @brief   This file contains all the functions prototypes for the
  *          STM8L_nucleo.c driver.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2018 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8L_NUCLEO_H
#define __STM8L_NUCLEO_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_spi.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_adc.h"
#include "stm8l15x_tim4.h"
#include "stm8l15x_exti.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup STM8L_NUCLEO
  * @{
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL
  * @brief This file provides set of firmware functions to manage Leds and push-button
  *        available on STM32NUCLEO Kit from STMicroelectronics.
  * @{
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Exported_Types
  * @{
  */
typedef enum
{
  LED2 = 0

} Led_TypeDef;

typedef enum
{
  BUTTON_USER = 0
} Button_TypeDef;

typedef enum
{
  BUTTON_MODE_GPIO = 0,
  BUTTON_MODE_EXTI = 1
} ButtonMode_TypeDef;

/* The Joystick is available on adafruit 1.8" TFT shield */
typedef enum
{
  JOY_NONE = 0,
  JOY_SEL = 1,
  JOY_DOWN = 2,
  JOY_LEFT = 3,
  JOY_RIGHT = 4,
  JOY_UP = 5
} JOYState_TypeDef;

/**
  * @}
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Exported_Macros
  * @{
  */
/**
  * @brief LCD control lines (CS and DC) management
  */
#define LCD_CS_HIGH() GPIO_SetBits(LCD_CS_GPIO_PORT, LCD_CS_PIN)
#define LCD_CS_LOW()  GPIO_ResetBits(LCD_CS_GPIO_PORT, LCD_CS_PIN)

#define LCD_DC_HIGH() GPIO_SetBits(LCD_DC_GPIO_PORT, LCD_DC_PIN)
#define LCD_DC_LOW()  GPIO_ResetBits(LCD_DC_GPIO_PORT, LCD_DC_PIN)
/**
  * @brief SD CS line management
  */
#define SD_CS_HIGH()  GPIO_SetBits(SD_CS_GPIO_PORT, SD_CS_PIN)
#define SD_CS_LOW()   GPIO_ResetBits(SD_CS_GPIO_PORT, SD_CS_PIN)


/**
  * @}
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Exported_Constants
  * @{
  */
/** @addtogroup STM8L_NUCLEO_LOW_LEVEL_LED
  * @{
  */
#define LEDn                             1

#define LED_GPIO_PORT                  GPIOB
#define LED_GPIO_PIN                   GPIO_Pin_5
/**
  * @}
  */
/** @addtogroup STM8L_NUCLEO_LOW_LEVEL_BUTTON
  * @{
  */
#define BUTTONn                          1

/**
 * @brief Wakeup push-button
 */
#define USER_BUTTON_GPIO_PORT          GPIOG
#define USER_BUTTON_PIN                GPIO_Pin_4
#define USER_BUTTON_EXTI_PORT          EXTI_Port_G
#define USER_BUTTON_EXTI_PIN           EXTI_Pin_4

/**
  * @}
  */

/** @addtogroup STM8L_NUCLEO_LOW_LEVEL_SPI
  * @{
  */
/**
  * @brief  SPI Interface pins
  */
/* The LCD and uSD card are available on adafruit 1.8" TFT shield */

#define LCD_SD_SPI                    SPI1
#define LCD_SD_SPI_CLK                CLK_Peripheral_SPI1

#define SPI_SCK_PIN                   GPIO_Pin_5                  /* PB.05 */
#define SPI_SCK_GPIO_PORT             GPIOB                       /* GPIOB */

#define SPI_MOSI_PIN                  GPIO_Pin_6                  /* PB.06 */
#define SPI_MOSI_GPIO_PORT            GPIOB                       /* GPIOB */

#define SPI_MISO_PIN                  GPIO_Pin_7                  /* PB.07 */
#define SPI_MISO_GPIO_PORT            GPIOB                       /* GPIOB */

/**
  * @}
  */

/**
  * @brief  SD Chip Select pin
  */
#define SD_CS_PIN                     GPIO_Pin_2                  /* PE.2 */
#define SD_CS_GPIO_PORT               GPIOE                       /* GPIOE */

/**
  * @brief  LCD Data/Command pin
  */
#define LCD_DC_PIN                    GPIO_Pin_3                  /* PD.3 */
#define LCD_DC_GPIO_PORT              GPIOD                       /* GPIOD */


/**
  * @brief  LCD Chip Select pin
  */
#define LCD_CS_PIN                    GPIO_Pin_4                  /* PB.4*/
#define LCD_CS_GPIO_PORT              GPIOB                       /* GPIOB */

/**
  * @brief  ADC Interface pins
  */
/* The ADC is used to detect motion of Joystick available on adafruit 1.8" TFT shield */

#define ADCx                          ADC1
#define ADCx_CLK                      CLK_Peripheral_ADC1

#define ADC_GPIO_PIN                  GPIO_Pin_2                  /* PB.2  */
#define ADC_GPIO_PORT                 GPIOB                       /* GPIOB */

#define ADCx_Channel                  ADC_Channel_16

/**
  * @}
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Exported_Functions
  * @{
  */
void STM_NUCLEO_LEDInit(Led_TypeDef Led);
void STM_NUCLEO_LEDOn(Led_TypeDef Led);
void STM_NUCLEO_LEDOff(Led_TypeDef Led);
void STM_NUCLEO_LEDToggle(Led_TypeDef Led);
void STM_NUCLEO_PBInit(Button_TypeDef Button, ButtonMode_TypeDef Button_Mode);
uint8_t STM_NUCLEO_PBGetState(Button_TypeDef Button);

/* Functions to configure and manage the STM8L resources (SPI and ADC) used to drive
   LCD, uSD card and Joystick available in adafruit 1.8" TFT shield */
void STM_SPI_Init(void);
uint8_t STM_SPI_WriteRead(uint8_t Data);
void LCD_CtrlLines_Config(void);
void SD_CtrlLines_Config(void);
void STM_ADC_Config(void);
JOYState_TypeDef STM_Get_JOYState(void);

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif /* __STM8L_NUCLEO_H */
/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
