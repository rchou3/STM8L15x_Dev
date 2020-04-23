   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  54                     ; 121 void LCD_DeInit(void)
  54                     ; 122 {
  56                     	switch	.text
  57  0000               _LCD_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 123   uint8_t counter = 0;
  65                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  67  0001 725f5400      	clr	21504
  68                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  70  0005 725f5401      	clr	21505
  71                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  73  0009 725f5402      	clr	21506
  74                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  76  000d 725f5403      	clr	21507
  77                     ; 130   for (counter = 0;counter < 0x05; counter++)
  79  0011 0f01          	clr	(OFST+0,sp)
  81  0013               L72:
  82                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  84  0013 7b01          	ld	a,(OFST+0,sp)
  85  0015 5f            	clrw	x
  86  0016 97            	ld	xl,a
  87  0017 724f5404      	clr	(21508,x)
  88                     ; 130   for (counter = 0;counter < 0x05; counter++)
  90  001b 0c01          	inc	(OFST+0,sp)
  94  001d 7b01          	ld	a,(OFST+0,sp)
  95  001f a105          	cp	a,#5
  96  0021 25f0          	jrult	L72
  97                     ; 135   for (counter = 0;counter < 0x16; counter++)
  99  0023 0f01          	clr	(OFST+0,sp)
 101  0025               L53:
 102                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 104  0025 7b01          	ld	a,(OFST+0,sp)
 105  0027 5f            	clrw	x
 106  0028 97            	ld	xl,a
 107  0029 724f540c      	clr	(21516,x)
 108                     ; 135   for (counter = 0;counter < 0x16; counter++)
 110  002d 0c01          	inc	(OFST+0,sp)
 114  002f 7b01          	ld	a,(OFST+0,sp)
 115  0031 a116          	cp	a,#22
 116  0033 25f0          	jrult	L53
 117                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 119  0035 725f542f      	clr	21551
 120                     ; 142 }
 123  0039 84            	pop	a
 124  003a 81            	ret
 527                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 527                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 527                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 527                     ; 203 {
 528                     	switch	.text
 529  003b               _LCD_Init:
 531  003b 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 537                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 539                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 541                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 543                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 545                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 547  003c c65403        	ld	a,21507
 548  003f a40f          	and	a,#15
 549  0041 c75403        	ld	21507,a
 550                     ; 212   LCD->FRQ |= LCD_Prescaler;
 552  0044 9e            	ld	a,xh
 553  0045 ca5403        	or	a,21507
 554  0048 c75403        	ld	21507,a
 555                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 557  004b c65403        	ld	a,21507
 558  004e a4f0          	and	a,#240
 559  0050 c75403        	ld	21507,a
 560                     ; 215   LCD->FRQ |= LCD_Divider;
 562  0053 9f            	ld	a,xl
 563  0054 ca5403        	or	a,21507
 564  0057 c75403        	ld	21507,a
 565                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 567  005a c65400        	ld	a,21504
 568  005d a4f9          	and	a,#249
 569  005f c75400        	ld	21504,a
 570                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 572  0062 7213542f      	bres	21551,#1
 573                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 575  0066 7b05          	ld	a,(OFST+5,sp)
 576  0068 a120          	cp	a,#32
 577  006a 260f          	jrne	L152
 578                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 580  006c 7b05          	ld	a,(OFST+5,sp)
 581  006e a4f0          	and	a,#240
 582  0070 4e            	swap	a
 583  0071 a40f          	and	a,#15
 584  0073 ca542f        	or	a,21551
 585  0076 c7542f        	ld	21551,a
 587  0079 200a          	jra	L352
 588  007b               L152:
 589                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 591  007b 7b05          	ld	a,(OFST+5,sp)
 592  007d a40f          	and	a,#15
 593  007f ca5400        	or	a,21504
 594  0082 c75400        	ld	21504,a
 595  0085               L352:
 596                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 598  0085 72115400      	bres	21504,#0
 599                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 601  0089 7211542f      	bres	21551,#0
 602                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 604  008d 7b06          	ld	a,(OFST+6,sp)
 605  008f a110          	cp	a,#16
 606  0091 2619          	jrne	L552
 607                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 609  0093 7b06          	ld	a,(OFST+6,sp)
 610  0095 a40f          	and	a,#15
 611  0097 ca5400        	or	a,21504
 612  009a c75400        	ld	21504,a
 613                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 615  009d 7b06          	ld	a,(OFST+6,sp)
 616  009f a4f0          	and	a,#240
 617  00a1 4e            	swap	a
 618  00a2 a40f          	and	a,#15
 619  00a4 ca542f        	or	a,21551
 620  00a7 c7542f        	ld	21551,a
 622  00aa 200a          	jra	L752
 623  00ac               L552:
 624                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 626  00ac 7b06          	ld	a,(OFST+6,sp)
 627  00ae a40f          	and	a,#15
 628  00b0 ca5400        	or	a,21504
 629  00b3 c75400        	ld	21504,a
 630  00b6               L752:
 631                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 633  00b6 72115401      	bres	21505,#0
 634                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 636  00ba c65401        	ld	a,21505
 637  00bd 1a07          	or	a,(OFST+7,sp)
 638  00bf c75401        	ld	21505,a
 639                     ; 247 }
 642  00c2 85            	popw	x
 643  00c3 81            	ret
 742                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 742                     ; 263 {
 743                     	switch	.text
 744  00c4               _LCD_PortMaskConfig:
 746  00c4 89            	pushw	x
 747       00000000      OFST:	set	0
 750                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 752                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 754  00c5 9e            	ld	a,xh
 755  00c6 5f            	clrw	x
 756  00c7 97            	ld	xl,a
 757  00c8 7b02          	ld	a,(OFST+2,sp)
 758  00ca d75404        	ld	(21508,x),a
 759                     ; 270 }
 762  00cd 85            	popw	x
 763  00ce 81            	ret
 818                     ; 279 void LCD_Cmd(FunctionalState NewState)
 818                     ; 280 {
 819                     	switch	.text
 820  00cf               _LCD_Cmd:
 824                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 826                     ; 284   if (NewState != DISABLE)
 828  00cf 4d            	tnz	a
 829  00d0 2706          	jreq	L153
 830                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 832  00d2 721c5402      	bset	21506,#6
 834  00d6 2004          	jra	L353
 835  00d8               L153:
 836                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 838  00d8 721d5402      	bres	21506,#6
 839  00dc               L353:
 840                     ; 292 }
 843  00dc 81            	ret
 878                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 878                     ; 306 {
 879                     	switch	.text
 880  00dd               _LCD_HighDriveCmd:
 884                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 886                     ; 310   if (NewState != DISABLE)
 888  00dd 4d            	tnz	a
 889  00de 2706          	jreq	L373
 890                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 892  00e0 72185401      	bset	21505,#4
 894  00e4 2004          	jra	L573
 895  00e6               L373:
 896                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 898  00e6 72195401      	bres	21505,#4
 899  00ea               L573:
 900                     ; 318 }
 903  00ea 81            	ret
1010                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1010                     ; 336 {
1011                     	switch	.text
1012  00eb               _LCD_PulseOnDurationConfig:
1014  00eb 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1020                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1022  00ec c65401        	ld	a,21505
1023  00ef a41f          	and	a,#31
1024  00f1 c75401        	ld	21505,a
1025                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1027  00f4 c65401        	ld	a,21505
1028  00f7 1a01          	or	a,(OFST+1,sp)
1029  00f9 c75401        	ld	21505,a
1030                     ; 342 }
1033  00fc 84            	pop	a
1034  00fd 81            	ret
1131                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1131                     ; 359 {
1132                     	switch	.text
1133  00fe               _LCD_DeadTimeConfig:
1135  00fe 88            	push	a
1136       00000000      OFST:	set	0
1139                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1141                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1143  00ff c65402        	ld	a,21506
1144  0102 a4f8          	and	a,#248
1145  0104 c75402        	ld	21506,a
1146                     ; 365   LCD->CR3 |= LCD_DeadTime;
1148  0107 c65402        	ld	a,21506
1149  010a 1a01          	or	a,(OFST+1,sp)
1150  010c c75402        	ld	21506,a
1151                     ; 367 }
1154  010f 84            	pop	a
1155  0110 81            	ret
1307                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1307                     ; 392 {
1308                     	switch	.text
1309  0111               _LCD_BlinkConfig:
1313                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1315                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1317                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1319  0111 c65400        	ld	a,21504
1320  0114 a43f          	and	a,#63
1321  0116 c75400        	ld	21504,a
1322                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1324  0119 9e            	ld	a,xh
1325  011a ca5400        	or	a,21504
1326  011d c75400        	ld	21504,a
1327                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1329  0120 c65400        	ld	a,21504
1330  0123 a4c7          	and	a,#199
1331  0125 c75400        	ld	21504,a
1332                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1334  0128 9f            	ld	a,xl
1335  0129 ca5400        	or	a,21504
1336  012c c75400        	ld	21504,a
1337                     ; 403 }
1340  012f 81            	ret
1445                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1445                     ; 420 {
1446                     	switch	.text
1447  0130               _LCD_ContrastConfig:
1449  0130 88            	push	a
1450       00000000      OFST:	set	0
1453                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1455                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1457  0131 c65401        	ld	a,21505
1458  0134 a4f1          	and	a,#241
1459  0136 c75401        	ld	21505,a
1460                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1462  0139 c65401        	ld	a,21505
1463  013c 1a01          	or	a,(OFST+1,sp)
1464  013e c75401        	ld	21505,a
1465                     ; 427 }
1468  0141 84            	pop	a
1469  0142 81            	ret
1673                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1673                     ; 475 {
1674                     	switch	.text
1675  0143               _LCD_WriteRAM:
1677  0143 89            	pushw	x
1678       00000000      OFST:	set	0
1681                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1683                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1685  0144 9e            	ld	a,xh
1686  0145 5f            	clrw	x
1687  0146 97            	ld	xl,a
1688  0147 7b02          	ld	a,(OFST+2,sp)
1689  0149 d7540c        	ld	(21516,x),a
1690                     ; 482 }
1693  014c 85            	popw	x
1694  014d 81            	ret
1751                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1751                     ; 493 {
1752                     	switch	.text
1753  014e               _LCD_PageSelect:
1757                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1759                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1761  014e 7215542f      	bres	21551,#2
1762                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1764  0152 ca542f        	or	a,21551
1765  0155 c7542f        	ld	21551,a
1766                     ; 500 }
1769  0158 81            	ret
1804                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1804                     ; 526 {
1805                     	switch	.text
1806  0159               _LCD_ITConfig:
1810                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1812                     ; 530   if (NewState != DISABLE)
1814  0159 4d            	tnz	a
1815  015a 2706          	jreq	L577
1816                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1818  015c 721a5402      	bset	21506,#5
1820  0160 2004          	jra	L777
1821  0162               L577:
1822                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1824  0162 721b5402      	bres	21506,#5
1825  0166               L777:
1826                     ; 539 }
1829  0166 81            	ret
1885                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1885                     ; 547 {
1886                     	switch	.text
1887  0167               _LCD_GetFlagStatus:
1889  0167 88            	push	a
1890       00000001      OFST:	set	1
1893                     ; 548   FlagStatus status = RESET;
1895                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1897  0168 c65402        	ld	a,21506
1898  016b a510          	bcp	a,#16
1899  016d 2706          	jreq	L7201
1900                     ; 553     status = SET; /* Flag is set */
1902  016f a601          	ld	a,#1
1903  0171 6b01          	ld	(OFST+0,sp),a
1906  0173 2002          	jra	L1301
1907  0175               L7201:
1908                     ; 557     status = RESET; /* Flag is reset*/
1910  0175 0f01          	clr	(OFST+0,sp)
1912  0177               L1301:
1913                     ; 560   return status;
1915  0177 7b01          	ld	a,(OFST+0,sp)
1918  0179 5b01          	addw	sp,#1
1919  017b 81            	ret
1942                     ; 569 void LCD_ClearFlag(void)
1942                     ; 570 {
1943                     	switch	.text
1944  017c               _LCD_ClearFlag:
1948                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1950  017c 72165402      	bset	21506,#3
1951                     ; 574 }
1954  0180 81            	ret
1999                     ; 582 ITStatus LCD_GetITStatus(void)
1999                     ; 583 {
2000                     	switch	.text
2001  0181               _LCD_GetITStatus:
2003  0181 88            	push	a
2004       00000001      OFST:	set	1
2007                     ; 584   ITStatus pendingbitstatus = RESET;
2009                     ; 585   uint8_t enablestatus = 0;
2011                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2013  0182 c65402        	ld	a,21506
2014  0185 a420          	and	a,#32
2015  0187 6b01          	ld	(OFST+0,sp),a
2017                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2019  0189 c65402        	ld	a,21506
2020  018c a510          	bcp	a,#16
2021  018e 270a          	jreq	L5601
2023  0190 0d01          	tnz	(OFST+0,sp)
2024  0192 2706          	jreq	L5601
2025                     ; 592     pendingbitstatus = SET;
2027  0194 a601          	ld	a,#1
2028  0196 6b01          	ld	(OFST+0,sp),a
2031  0198 2002          	jra	L7601
2032  019a               L5601:
2033                     ; 597     pendingbitstatus = RESET;
2035  019a 0f01          	clr	(OFST+0,sp)
2037  019c               L7601:
2038                     ; 600   return  pendingbitstatus;
2040  019c 7b01          	ld	a,(OFST+0,sp)
2043  019e 5b01          	addw	sp,#1
2044  01a0 81            	ret
2068                     ; 609 void LCD_ClearITPendingBit(void)
2068                     ; 610 {
2069                     	switch	.text
2070  01a1               _LCD_ClearITPendingBit:
2074                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2076  01a1 72165402      	bset	21506,#3
2077                     ; 614 }
2080  01a5 81            	ret
2093                     	xdef	_LCD_ClearITPendingBit
2094                     	xdef	_LCD_GetITStatus
2095                     	xdef	_LCD_ClearFlag
2096                     	xdef	_LCD_GetFlagStatus
2097                     	xdef	_LCD_ITConfig
2098                     	xdef	_LCD_PageSelect
2099                     	xdef	_LCD_WriteRAM
2100                     	xdef	_LCD_ContrastConfig
2101                     	xdef	_LCD_BlinkConfig
2102                     	xdef	_LCD_DeadTimeConfig
2103                     	xdef	_LCD_PulseOnDurationConfig
2104                     	xdef	_LCD_HighDriveCmd
2105                     	xdef	_LCD_Cmd
2106                     	xdef	_LCD_PortMaskConfig
2107                     	xdef	_LCD_Init
2108                     	xdef	_LCD_DeInit
2127                     	end
