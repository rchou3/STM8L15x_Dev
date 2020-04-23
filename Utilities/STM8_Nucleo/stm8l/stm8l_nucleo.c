/**
  ******************************************************************************
  * @file    STM8L_nucleo.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    12-January-2018
  * @brief   This file provides set of firmware functions to manage Leds and
  *          push-button available on STM8NUCLEO Kit from STMicroelectronics.
  *          It provides also functions to configure and manage the STM8L
  *          resources (SPI and ADC) used to drive LCD, uSD card and Joystick
  *          available on adafruit 1.8" TFT shield.
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

/* Includes ------------------------------------------------------------------*/
#include "stm8l_nucleo.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup STM8L_NUCLEO
  * @{
  */

/** @defgroup STM8L_NUCLEO_LOW_LEVEL
  * @brief This file provides set of firmware functions to manage Leds and push-button
  *        available on STM8NUCLEO Kit from STMicroelectronics.
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define SD_DUMMY_BYTE            0xFF
/* Private macro -------------------------------------------------------------*/

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Private_Variables
  * @{
  */
GPIO_TypeDef* LED_PORT[LEDn] = {LED_GPIO_PORT};

const GPIO_Pin_TypeDef LED_PIN[LEDn] =  {LED_GPIO_PIN};

GPIO_TypeDef* BUTTON_PORT[BUTTONn] = {USER_BUTTON_GPIO_PORT};

const GPIO_Pin_TypeDef BUTTON_PIN[BUTTONn] ={USER_BUTTON_PIN};

const EXTI_Pin_TypeDef BUTTON_EXTI[BUTTONn] = {USER_BUTTON_EXTI_PIN};


/**
  * @}
  */

/* Private function prototypes -----------------------------------------------*/

/** @defgroup STM8L_NUCLEO_LOW_LEVEL_Private_Functions
  * @{
  */

/**
  * @brief  Configures LED GPIO.
  * @param  Led: Specifies the Led to be configured.
  *         This parameter must be: LED2
  * @retval None
  */
void STM_NUCLEO_LEDInit(Led_TypeDef Led)
{
  GPIO_Init(LED_PORT[Led], LED_PIN[Led], GPIO_Mode_Out_PP_High_Fast);
}

/**
  * @brief  Turns selected LED On.
  * @param  Led: Specifies the Led to be set on.
  *         This parameter must be: LED2
  * @retval None
  */
void STM_NUCLEO_LEDOn(Led_TypeDef Led)
{
  GPIO_SetBits(LED_PORT[Led], LED_PIN[Led]);
}

/**
  * @brief  Turns selected LED Off.
  * @param  Led: Specifies the Led to be set off.
  *         This parameter must be: LED2
  * @retval None
  */
void STM_NUCLEO_LEDOff(Led_TypeDef Led)
{
  GPIO_ResetBits(LED_PORT[Led], LED_PIN[Led]);
}

/**
  * @brief  Toggles the selected LED.
  * @param  Led: Specifies the Led to be toggled.
  *         This parameter must be: LED2
  * @retval None
  */
void STM_NUCLEO_LEDToggle(Led_TypeDef Led)
{
  GPIO_ToggleBits(LED_PORT[Led], LED_PIN[Led]);
}

/**
  * @brief  Configures Button GPIO and associated EXTI Line.
  * @param  Button: Specifies the Button to be configured.
  *   This parameter must be: BUTTON_USER
  * @param  Button_Mode: Specifies Button mode.
  *   This parameter can be one of following parameters:
  *     @arg BUTTON_MODE_GPIO: Button will be used as simple IO
  *     @arg BUTTON_MODE_EXTI: Button will be connected to EXTI line with interrupt
  *                            generation capability
  * @retval None
  */
void STM_NUCLEO_PBInit(Button_TypeDef Button, ButtonMode_TypeDef Button_Mode)
{
  if (Button_Mode == BUTTON_MODE_EXTI)
  {/* Pin configured in input floating mode with interrupt enabled
    --> connected to EXTIx Interrupt, where x:0..7 */
    GPIO_Init(BUTTON_PORT[Button], (GPIO_Pin_TypeDef)BUTTON_PIN[Button], GPIO_Mode_In_FL_IT);
    EXTI_SetPinSensitivity((EXTI_Pin_TypeDef)BUTTON_EXTI[Button], EXTI_Trigger_Falling);
  }
  else
  {/* Pin configured in input floating mode with interrupt disabled */
    GPIO_Init(BUTTON_PORT[Button], (GPIO_Pin_TypeDef)BUTTON_PIN[Button], GPIO_Mode_In_FL_No_IT);
  }
}

/**
  * @brief  Returns the selected Button state.
  * @param  Button: Specifies the Button to be checked.
  *   This parameter must be: BUTTON_USER
  * @retval The Button GPIO pin value.
  */
uint8_t STM_NUCLEO_PBGetState(Button_TypeDef Button)
{
  return GPIO_ReadInputDataBit(BUTTON_PORT[Button], (GPIO_Pin_TypeDef)BUTTON_PIN[Button]);
}
/**
  * @brief  Initializes the SPI Interface used to drive the LCD and uSD card
  *         available on adafruit 1.8" TFT shield.
  * @note   This function must by called by the application code before to initialize
  *         the LCD and uSD card.
  * @param  None
  * @retval None
  */
void STM_SPI_Init(void)
{
  /* Enable SPI clock */
  CLK_PeripheralClockConfig(LCD_SD_SPI_CLK, ENABLE);

  /* Set the SCK at high level */
  GPIO_Init(SPI_SCK_GPIO_PORT,SPI_SCK_PIN, GPIO_Mode_Out_PP_High_Fast);

  /* Set the MOSI at high level */
  GPIO_Init(SPI_MOSI_GPIO_PORT, SPI_MOSI_PIN, GPIO_Mode_Out_PP_High_Fast);

  /* Set the MISO at high level */
  GPIO_Init(SPI_MISO_GPIO_PORT, SPI_MISO_PIN, GPIO_Mode_In_FL_No_IT);

  /* SPI Config */
  SPI_Init(LCD_SD_SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master,
           SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
           SPI_NSS_Soft, 0x07);

  /* SPI baudrate is set to 8 MHz maximum (HSI/SPI_BaudRatePrescaler = 16/2 = 8 MHz)
  to verify these constraints:
  - ST7735R LCD SPI interface max baudrate is 15MHz for write and 6.66MHz for read
  Since the provided driver doesn't use read capability from LCD, only constraint
  on write baudrate is considered.
  - SD card SPI interface max baudrate is 25MHz for write/read
  */

  /* SPI enable */
  SPI_Cmd(LCD_SD_SPI, ENABLE);
}

/**
  * @brief  Configures LCD control lines (CS and DC) in Output Push-Pull mode.
  * @param  None
  * @retval None
  */
void LCD_CtrlLines_Config(void)
{
  /* Configure CS in Output Push-Pull mode */
  GPIO_Init(LCD_CS_GPIO_PORT, LCD_CS_PIN, GPIO_Mode_Out_PP_High_Fast);

  /* Configure DC in Output Push-Pull mode */
  GPIO_Init(LCD_DC_GPIO_PORT, LCD_DC_PIN, GPIO_Mode_Out_PP_High_Fast);

  /* Set chip select pin high */
  LCD_CS_HIGH();
}

/**
  * @brief  Configures uSD control line (CS) in Output Push-Pull mode.
  * @param  None
  * @retval None
  */
void SD_CtrlLines_Config(void)
{
  /* Configure CS in Output Push-Pull mode */
  GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_ExternalPullUpConfig(SD_CS_GPIO_PORT, SD_CS_PIN, ENABLE);

  /* Set chip select pin high */
  SD_CS_HIGH();
}

/**
  * @brief  Sends a byte through the SPI interface and return the byte received
  *         from the SPI bus.
  * @param  Data: byte send.
  * @retval The received byte value
  * @retval None
  */
uint8_t STM_SPI_WriteRead(uint8_t Data)
{
  uint8_t tmp = 0x00;

  /* Wait until the transmit buffer is empty */
  while(SPI_GetFlagStatus(LCD_SD_SPI, SPI_FLAG_TXE) != SET)
  {
  }
  /* Send the byte */
  SPI_SendData(LCD_SD_SPI, Data);

  /* Wait to receive a byte */
  while(SPI_GetFlagStatus(LCD_SD_SPI, SPI_FLAG_RXNE) != SET)
  {
  }
  /* Return the byte read from the SPI bus */
  tmp = SPI_ReceiveData(LCD_SD_SPI);

  /* Wait until the BSY flags are set */
  while(SPI_GetFlagStatus(LCD_SD_SPI, SPI_FLAG_BSY) != RESET)
  {
  }

  /* Return read Data */
  return tmp;
}

/**
  * @brief  Initializes ADC, used to detect motion of Joystick available on
  *         adafruit 1.8" TFT shield.
  * @param  None
  * @retval None
  */
void STM_ADC_Config(void)
{
  /* Activate the ADC Clock */
  CLK_PeripheralClockConfig(ADCx_CLK, ENABLE);

  /* Reset ADC Registers */
  ADC_DeInit(ADCx);

  /* Initialize and configure ADC */
  ADC_Init(ADCx, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_1);
  ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);

  /* Enable ADC */
  ADC_Cmd(ADCx, ENABLE);

  /* Enable ADC Channel */
  ADC_ChannelCmd(ADCx, ADCx_Channel, ENABLE);
}

/**
  * @brief  Returns the Joystick key pressed.
  * @note   To know which Joystick key is pressed we need to detect the voltage
  *         level on each key output
  *           - SEL   : 1.055 V / 1282
  *           - RIGHT : 0.595 V / 665
  *           - LEFT  : 3.0 V / 3626
  *           - UP    : 1.65 V / 2278
  *           - DOWN  : 0.71 V / 97
  *           - None  : 3.3 V / 4095
  * @retval Code of the Joystick key pressed.
  *          This code can be one of the following values:
  *            @arg  JOY_NONE
  *            @arg  JOY_SEL
  *            @arg  JOY_DOWN
  *            @arg  JOY_LEFT
  *            @arg  JOY_RIGHT
  *            @arg  JOY_UP
  */
JOYState_TypeDef STM_Get_JOYState(void)
{
  JOYState_TypeDef state = JOY_NONE;
  uint16_t  KeyConvertedValue = 0;

  /* Start ADC1 Conversion using Software trigger*/
  ADC_SoftwareStartConv(ADCx);

  /* wait for end of conversion */
  while (!(ADC_GetFlagStatus(ADCx, ADC_FLAG_EOC)));

  /* Get converted value */
  KeyConvertedValue = ADC_GetConversionValue(ADCx);

  if (KeyConvertedValue < 150)
  {
    state = JOY_DOWN;
  }
  else if((KeyConvertedValue > 600) && (KeyConvertedValue < 780))
  {
    state = JOY_RIGHT;
  }
  else if((KeyConvertedValue > 1200) && (KeyConvertedValue < 1350))
  {
    state = JOY_SEL;
  }
  else if((KeyConvertedValue > 2000) && (KeyConvertedValue < 2300))
  {
    state = JOY_UP;
  }
  else if((KeyConvertedValue > 3400) && (KeyConvertedValue < 3800))
  {
    state = JOY_LEFT;
  }
  else
  {
    state = JOY_NONE;
  }
  /* Loop while a key is pressed */
  if(state != JOY_NONE)
  {
    while(KeyConvertedValue < 4000)
    {
      /* Start ADC1 Conversion using Software trigger*/
      ADC_SoftwareStartConv(ADCx);

      /* wait for end of conversion */
      while (!(ADC_GetFlagStatus(ADCx, ADC_FLAG_EOC)));

      KeyConvertedValue = ADC_GetConversionValue(ADCx);
    }
  }
  /* Return the code of the Joystick key pressed*/
  return state;
}

/**
  * @}
  */

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
