   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 174                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 174                     ; 136 {
 176                     	switch	.text
 177  0000               _ADC_DeInit:
 181                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 183  0000 7f            	clr	(x)
 184                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 186  0001 6f01          	clr	(1,x)
 187                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 189  0003 a61f          	ld	a,#31
 190  0005 e702          	ld	(2,x),a
 191                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 193  0007 a6ff          	ld	a,#255
 194  0009 e703          	ld	(3,x),a
 195                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 197  000b a60f          	ld	a,#15
 198  000d e706          	ld	(6,x),a
 199                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 201  000f a6ff          	ld	a,#255
 202  0011 e707          	ld	(7,x),a
 203                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 205  0013 6f08          	clr	(8,x)
 206                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 208  0015 6f09          	clr	(9,x)
 209                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 211  0017 6f0a          	clr	(10,x)
 212                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 214  0019 6f0b          	clr	(11,x)
 215                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 217  001b 6f0c          	clr	(12,x)
 218                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 220  001d 6f0d          	clr	(13,x)
 221                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 223  001f 6f0e          	clr	(14,x)
 224                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 226  0021 6f0f          	clr	(15,x)
 227                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 229  0023 6f10          	clr	(16,x)
 230                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 232  0025 6f11          	clr	(17,x)
 233                     ; 164 }
 236  0027 81            	ret
 383                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 383                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 383                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 383                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 383                     ; 190 {
 384                     	switch	.text
 385  0028               _ADC_Init:
 387  0028 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 393                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 395                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 397                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 399  0029 f6            	ld	a,(x)
 400  002a a49b          	and	a,#155
 401  002c f7            	ld	(x),a
 402                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 404  002d 7b05          	ld	a,(OFST+5,sp)
 405  002f 1a06          	or	a,(OFST+6,sp)
 406  0031 fa            	or	a,(x)
 407  0032 f7            	ld	(x),a
 408                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 410  0033 e601          	ld	a,(1,x)
 411  0035 a47f          	and	a,#127
 412  0037 e701          	ld	(1,x),a
 413                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 415  0039 e601          	ld	a,(1,x)
 416  003b 1a07          	or	a,(OFST+7,sp)
 417  003d e701          	ld	(1,x),a
 418                     ; 207 }
 421  003f 85            	popw	x
 422  0040 81            	ret
 489                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 489                     ; 217              FunctionalState NewState)
 489                     ; 218 {
 490                     	switch	.text
 491  0041               _ADC_Cmd:
 493  0041 89            	pushw	x
 494       00000000      OFST:	set	0
 497                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 499                     ; 222   if (NewState != DISABLE)
 501  0042 0d05          	tnz	(OFST+5,sp)
 502  0044 2706          	jreq	L142
 503                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 505  0046 f6            	ld	a,(x)
 506  0047 aa01          	or	a,#1
 507  0049 f7            	ld	(x),a
 509  004a 2006          	jra	L342
 510  004c               L142:
 511                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 513  004c 1e01          	ldw	x,(OFST+1,sp)
 514  004e f6            	ld	a,(x)
 515  004f a4fe          	and	a,#254
 516  0051 f7            	ld	(x),a
 517  0052               L342:
 518                     ; 232 }
 521  0052 85            	popw	x
 522  0053 81            	ret
 560                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 560                     ; 240 {
 561                     	switch	.text
 562  0054               _ADC_SoftwareStartConv:
 566                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 568  0054 f6            	ld	a,(x)
 569  0055 aa02          	or	a,#2
 570  0057 f7            	ld	(x),a
 571                     ; 243 }
 574  0058 81            	ret
 702                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 702                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 702                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 702                     ; 264 {
 703                     	switch	.text
 704  0059               _ADC_ExternalTrigConfig:
 706  0059 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 712                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 714                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 716  005a e601          	ld	a,(1,x)
 717  005c a487          	and	a,#135
 718  005e e701          	ld	(1,x),a
 719                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 719                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 721  0060 7b06          	ld	a,(OFST+6,sp)
 722  0062 1a05          	or	a,(OFST+5,sp)
 723  0064 ea01          	or	a,(1,x)
 724  0066 e701          	ld	(1,x),a
 725                     ; 276 }
 728  0068 85            	popw	x
 729  0069 81            	ret
1043                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1043                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1043                     ; 341 {
1044                     	switch	.text
1045  006a               _ADC_AnalogWatchdogChannelSelect:
1047  006a 89            	pushw	x
1048       00000000      OFST:	set	0
1051                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1053                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1055  006b e602          	ld	a,(2,x)
1056  006d a4e0          	and	a,#224
1057  006f e702          	ld	(2,x),a
1058                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1060  0071 e602          	ld	a,(2,x)
1061  0073 1a05          	or	a,(OFST+5,sp)
1062  0075 e702          	ld	(2,x),a
1063                     ; 350 }
1066  0077 85            	popw	x
1067  0078 81            	ret
1123                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1123                     ; 362 {
1124                     	switch	.text
1125  0079               _ADC_AnalogWatchdogThresholdsConfig:
1127  0079 89            	pushw	x
1128       00000000      OFST:	set	0
1131                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1133                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1135                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1137  007a 7b05          	ld	a,(OFST+5,sp)
1138  007c 1e01          	ldw	x,(OFST+1,sp)
1139  007e e706          	ld	(6,x),a
1140                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1142  0080 7b06          	ld	a,(OFST+6,sp)
1143  0082 1e01          	ldw	x,(OFST+1,sp)
1144  0084 e707          	ld	(7,x),a
1145                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1147  0086 7b07          	ld	a,(OFST+7,sp)
1148  0088 1e01          	ldw	x,(OFST+1,sp)
1149  008a e708          	ld	(8,x),a
1150                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  008c 7b08          	ld	a,(OFST+8,sp)
1153  008e 1e01          	ldw	x,(OFST+1,sp)
1154  0090 e709          	ld	(9,x),a
1155                     ; 374 }
1158  0092 85            	popw	x
1159  0093 81            	ret
1226                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1226                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1226                     ; 414                               uint16_t HighThreshold,
1226                     ; 415                               uint16_t LowThreshold)
1226                     ; 416 {
1227                     	switch	.text
1228  0094               _ADC_AnalogWatchdogConfig:
1230  0094 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1236                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1238                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1240                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1242  0095 e602          	ld	a,(2,x)
1243  0097 a4e0          	and	a,#224
1244  0099 e702          	ld	(2,x),a
1245                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1247  009b e602          	ld	a,(2,x)
1248  009d 1a05          	or	a,(OFST+5,sp)
1249  009f e702          	ld	(2,x),a
1250                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1252  00a1 7b06          	ld	a,(OFST+6,sp)
1253  00a3 1e01          	ldw	x,(OFST+1,sp)
1254  00a5 e706          	ld	(6,x),a
1255                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1257  00a7 7b07          	ld	a,(OFST+7,sp)
1258  00a9 1e01          	ldw	x,(OFST+1,sp)
1259  00ab e707          	ld	(7,x),a
1260                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1262  00ad 7b08          	ld	a,(OFST+8,sp)
1263  00af 1e01          	ldw	x,(OFST+1,sp)
1264  00b1 e708          	ld	(8,x),a
1265                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1267  00b3 7b09          	ld	a,(OFST+9,sp)
1268  00b5 1e01          	ldw	x,(OFST+1,sp)
1269  00b7 e709          	ld	(9,x),a
1270                     ; 435 }
1273  00b9 85            	popw	x
1274  00ba 81            	ret
1309                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1309                     ; 475 {
1310                     	switch	.text
1311  00bb               _ADC_TempSensorCmd:
1315                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1317                     ; 479   if (NewState != DISABLE)
1319  00bb 4d            	tnz	a
1320  00bc 2706          	jreq	L175
1321                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1323  00be 721a534e      	bset	21326,#5
1325  00c2 2004          	jra	L375
1326  00c4               L175:
1327                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1329  00c4 721b534e      	bres	21326,#5
1330  00c8               L375:
1331                     ; 489 }
1334  00c8 81            	ret
1369                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1369                     ; 498 {
1370                     	switch	.text
1371  00c9               _ADC_VrefintCmd:
1375                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1377                     ; 502   if (NewState != DISABLE)
1379  00c9 4d            	tnz	a
1380  00ca 2706          	jreq	L316
1381                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1383  00cc 7218534e      	bset	21326,#4
1385  00d0 2004          	jra	L516
1386  00d2               L316:
1387                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1389  00d2 7219534e      	bres	21326,#4
1390  00d6               L516:
1391                     ; 512 }
1394  00d6 81            	ret
1706                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1706                     ; 584 {
1707                     	switch	.text
1708  00d7               _ADC_ChannelCmd:
1710  00d7 89            	pushw	x
1711  00d8 88            	push	a
1712       00000001      OFST:	set	1
1715                     ; 585   uint8_t regindex = 0;
1717                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1719                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1721  00d9 7b06          	ld	a,(OFST+5,sp)
1722  00db 6b01          	ld	(OFST+0,sp),a
1724                     ; 591   if (NewState != DISABLE)
1726  00dd 0d08          	tnz	(OFST+7,sp)
1727  00df 270f          	jreq	L367
1728                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1730  00e1 01            	rrwa	x,a
1731  00e2 1b01          	add	a,(OFST+0,sp)
1732  00e4 2401          	jrnc	L23
1733  00e6 5c            	incw	x
1734  00e7               L23:
1735  00e7 02            	rlwa	x,a
1736  00e8 e60a          	ld	a,(10,x)
1737  00ea 1a07          	or	a,(OFST+6,sp)
1738  00ec e70a          	ld	(10,x),a
1740  00ee 200e          	jra	L567
1741  00f0               L367:
1742                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1744  00f0 7b01          	ld	a,(OFST+0,sp)
1745  00f2 5f            	clrw	x
1746  00f3 97            	ld	xl,a
1747  00f4 72fb02        	addw	x,(OFST+1,sp)
1748  00f7 7b07          	ld	a,(OFST+6,sp)
1749  00f9 43            	cpl	a
1750  00fa e40a          	and	a,(10,x)
1751  00fc e70a          	ld	(10,x),a
1752  00fe               L567:
1753                     ; 601 }
1756  00fe 5b03          	addw	sp,#3
1757  0100 81            	ret
1907                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1907                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1907                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1907                     ; 628 {
1908                     	switch	.text
1909  0101               _ADC_SamplingTimeConfig:
1911  0101 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1917                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1919                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1921  0102 0d05          	tnz	(OFST+5,sp)
1922  0104 2712          	jreq	L3501
1923                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1925  0106 e602          	ld	a,(2,x)
1926  0108 a41f          	and	a,#31
1927  010a e702          	ld	(2,x),a
1928                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1930  010c 7b06          	ld	a,(OFST+6,sp)
1931  010e 4e            	swap	a
1932  010f 48            	sll	a
1933  0110 a4e0          	and	a,#224
1934  0112 ea02          	or	a,(2,x)
1935  0114 e702          	ld	(2,x),a
1937  0116 2010          	jra	L5501
1938  0118               L3501:
1939                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1941  0118 1e01          	ldw	x,(OFST+1,sp)
1942  011a e601          	ld	a,(1,x)
1943  011c a4f8          	and	a,#248
1944  011e e701          	ld	(1,x),a
1945                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1947  0120 1e01          	ldw	x,(OFST+1,sp)
1948  0122 e601          	ld	a,(1,x)
1949  0124 1a06          	or	a,(OFST+6,sp)
1950  0126 e701          	ld	(1,x),a
1951  0128               L5501:
1952                     ; 645 }
1955  0128 85            	popw	x
1956  0129 81            	ret
2023                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2023                     ; 692                               FunctionalState NewState)
2023                     ; 693 {
2024                     	switch	.text
2025  012a               _ADC_SchmittTriggerConfig:
2027  012a 89            	pushw	x
2028  012b 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 694   uint8_t regindex = 0;
2034                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2036                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2038  012c 7b06          	ld	a,(OFST+5,sp)
2039  012e 6b01          	ld	(OFST+0,sp),a
2041                     ; 700   if (NewState != DISABLE)
2043  0130 0d08          	tnz	(OFST+7,sp)
2044  0132 2710          	jreq	L3111
2045                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2047  0134 01            	rrwa	x,a
2048  0135 1b01          	add	a,(OFST+0,sp)
2049  0137 2401          	jrnc	L04
2050  0139 5c            	incw	x
2051  013a               L04:
2052  013a 02            	rlwa	x,a
2053  013b 7b07          	ld	a,(OFST+6,sp)
2054  013d 43            	cpl	a
2055  013e e40e          	and	a,(14,x)
2056  0140 e70e          	ld	(14,x),a
2058  0142 200d          	jra	L5111
2059  0144               L3111:
2060                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2062  0144 7b01          	ld	a,(OFST+0,sp)
2063  0146 5f            	clrw	x
2064  0147 97            	ld	xl,a
2065  0148 72fb02        	addw	x,(OFST+1,sp)
2066  014b e60e          	ld	a,(14,x)
2067  014d 1a07          	or	a,(OFST+6,sp)
2068  014f e70e          	ld	(14,x),a
2069  0151               L5111:
2070                     ; 710 }
2073  0151 5b03          	addw	sp,#3
2074  0153 81            	ret
2121                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2121                     ; 718 {
2122                     	switch	.text
2123  0154               _ADC_GetConversionValue:
2125  0154 89            	pushw	x
2126  0155 89            	pushw	x
2127       00000002      OFST:	set	2
2130                     ; 719   uint16_t tmpreg = 0;
2132                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2134  0156 e604          	ld	a,(4,x)
2135  0158 5f            	clrw	x
2136  0159 97            	ld	xl,a
2137  015a 1f01          	ldw	(OFST-1,sp),x
2139                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2141  015c 1e01          	ldw	x,(OFST-1,sp)
2142  015e 1603          	ldw	y,(OFST+1,sp)
2143  0160 90e605        	ld	a,(5,y)
2144  0163 02            	rlwa	x,a
2145  0164 1f01          	ldw	(OFST-1,sp),x
2147                     ; 726   return (uint16_t)(tmpreg) ;
2149  0166 1e01          	ldw	x,(OFST-1,sp)
2152  0168 5b04          	addw	sp,#4
2153  016a 81            	ret
2200                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2200                     ; 761 {
2201                     	switch	.text
2202  016b               _ADC_DMACmd:
2204  016b 89            	pushw	x
2205       00000000      OFST:	set	0
2208                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2210                     ; 765   if (NewState != DISABLE)
2212  016c 0d05          	tnz	(OFST+5,sp)
2213  016e 2708          	jreq	L7611
2214                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2216  0170 e60a          	ld	a,(10,x)
2217  0172 a47f          	and	a,#127
2218  0174 e70a          	ld	(10,x),a
2220  0176 2008          	jra	L1711
2221  0178               L7611:
2222                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2224  0178 1e01          	ldw	x,(OFST+1,sp)
2225  017a e60a          	ld	a,(10,x)
2226  017c aa80          	or	a,#128
2227  017e e70a          	ld	(10,x),a
2228  0180               L1711:
2229                     ; 775 }
2232  0180 85            	popw	x
2233  0181 81            	ret
2317                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2317                     ; 832 {
2318                     	switch	.text
2319  0182               _ADC_ITConfig:
2321  0182 89            	pushw	x
2322       00000000      OFST:	set	0
2325                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2327                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2329                     ; 837   if (NewState != DISABLE)
2331  0183 0d06          	tnz	(OFST+6,sp)
2332  0185 2706          	jreq	L5321
2333                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2335  0187 f6            	ld	a,(x)
2336  0188 1a05          	or	a,(OFST+5,sp)
2337  018a f7            	ld	(x),a
2339  018b 2007          	jra	L7321
2340  018d               L5321:
2341                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2343  018d 1e01          	ldw	x,(OFST+1,sp)
2344  018f 7b05          	ld	a,(OFST+5,sp)
2345  0191 43            	cpl	a
2346  0192 f4            	and	a,(x)
2347  0193 f7            	ld	(x),a
2348  0194               L7321:
2349                     ; 847 }
2352  0194 85            	popw	x
2353  0195 81            	ret
2458                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2458                     ; 860 {
2459                     	switch	.text
2460  0196               _ADC_GetFlagStatus:
2462  0196 89            	pushw	x
2463  0197 88            	push	a
2464       00000001      OFST:	set	1
2467                     ; 861   FlagStatus flagstatus = RESET;
2469                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2471                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2473  0198 e603          	ld	a,(3,x)
2474  019a 1506          	bcp	a,(OFST+5,sp)
2475  019c 2706          	jreq	L3131
2476                     ; 870     flagstatus = SET;
2478  019e a601          	ld	a,#1
2479  01a0 6b01          	ld	(OFST+0,sp),a
2482  01a2 2002          	jra	L5131
2483  01a4               L3131:
2484                     ; 875     flagstatus = RESET;
2486  01a4 0f01          	clr	(OFST+0,sp)
2488  01a6               L5131:
2489                     ; 879   return  flagstatus;
2491  01a6 7b01          	ld	a,(OFST+0,sp)
2494  01a8 5b03          	addw	sp,#3
2495  01aa 81            	ret
2542                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2542                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2542                     ; 894 {
2543                     	switch	.text
2544  01ab               _ADC_ClearFlag:
2546  01ab 89            	pushw	x
2547       00000000      OFST:	set	0
2550                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2552                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2554  01ac 7b05          	ld	a,(OFST+5,sp)
2555  01ae 43            	cpl	a
2556  01af 1e01          	ldw	x,(OFST+1,sp)
2557  01b1 e703          	ld	(3,x),a
2558                     ; 900 }
2561  01b3 85            	popw	x
2562  01b4 81            	ret
2638                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2638                     ; 913                          ADC_IT_TypeDef ADC_IT)
2638                     ; 914 {
2639                     	switch	.text
2640  01b5               _ADC_GetITStatus:
2642  01b5 89            	pushw	x
2643  01b6 5203          	subw	sp,#3
2644       00000003      OFST:	set	3
2647                     ; 915   ITStatus itstatus = RESET;
2649                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2653                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2655                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2657  01b8 7b08          	ld	a,(OFST+5,sp)
2658  01ba 44            	srl	a
2659  01bb 44            	srl	a
2660  01bc 44            	srl	a
2661  01bd 6b03          	ld	(OFST+0,sp),a
2663                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2663                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2665  01bf 7b03          	ld	a,(OFST+0,sp)
2666  01c1 a403          	and	a,#3
2667  01c3 6b01          	ld	(OFST-2,sp),a
2669  01c5 7b03          	ld	a,(OFST+0,sp)
2670  01c7 a410          	and	a,#16
2671  01c9 44            	srl	a
2672  01ca 44            	srl	a
2673  01cb 1a01          	or	a,(OFST-2,sp)
2674  01cd 6b03          	ld	(OFST+0,sp),a
2676                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2678  01cf f6            	ld	a,(x)
2679  01d0 1408          	and	a,(OFST+5,sp)
2680  01d2 6b02          	ld	(OFST-1,sp),a
2682                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2684  01d4 e603          	ld	a,(3,x)
2685  01d6 1503          	bcp	a,(OFST+0,sp)
2686  01d8 270a          	jreq	L3041
2688  01da 0d02          	tnz	(OFST-1,sp)
2689  01dc 2706          	jreq	L3041
2690                     ; 933     itstatus = SET;
2692  01de a601          	ld	a,#1
2693  01e0 6b03          	ld	(OFST+0,sp),a
2696  01e2 2002          	jra	L5041
2697  01e4               L3041:
2698                     ; 938     itstatus = RESET;
2700  01e4 0f03          	clr	(OFST+0,sp)
2702  01e6               L5041:
2703                     ; 942   return  itstatus;
2705  01e6 7b03          	ld	a,(OFST+0,sp)
2708  01e8 5b05          	addw	sp,#5
2709  01ea 81            	ret
2766                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2766                     ; 956                            ADC_IT_TypeDef ADC_IT)
2766                     ; 957 {
2767                     	switch	.text
2768  01eb               _ADC_ClearITPendingBit:
2770  01eb 89            	pushw	x
2771  01ec 89            	pushw	x
2772       00000002      OFST:	set	2
2775                     ; 958   uint8_t itmask = 0;
2777                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2779                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2781  01ed 7b07          	ld	a,(OFST+5,sp)
2782  01ef 44            	srl	a
2783  01f0 44            	srl	a
2784  01f1 44            	srl	a
2785  01f2 6b02          	ld	(OFST+0,sp),a
2787                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2787                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2789  01f4 7b02          	ld	a,(OFST+0,sp)
2790  01f6 a403          	and	a,#3
2791  01f8 6b01          	ld	(OFST-1,sp),a
2793  01fa 7b02          	ld	a,(OFST+0,sp)
2794  01fc a410          	and	a,#16
2795  01fe 44            	srl	a
2796  01ff 44            	srl	a
2797  0200 1a01          	or	a,(OFST-1,sp)
2798  0202 6b02          	ld	(OFST+0,sp),a
2800                     ; 969   ADCx->SR = (uint8_t)~itmask;
2802  0204 7b02          	ld	a,(OFST+0,sp)
2803  0206 43            	cpl	a
2804  0207 1e03          	ldw	x,(OFST+1,sp)
2805  0209 e703          	ld	(3,x),a
2806                     ; 970 }
2809  020b 5b04          	addw	sp,#4
2810  020d 81            	ret
2823                     	xdef	_ADC_ClearITPendingBit
2824                     	xdef	_ADC_GetITStatus
2825                     	xdef	_ADC_ClearFlag
2826                     	xdef	_ADC_GetFlagStatus
2827                     	xdef	_ADC_ITConfig
2828                     	xdef	_ADC_DMACmd
2829                     	xdef	_ADC_GetConversionValue
2830                     	xdef	_ADC_SchmittTriggerConfig
2831                     	xdef	_ADC_SamplingTimeConfig
2832                     	xdef	_ADC_ChannelCmd
2833                     	xdef	_ADC_VrefintCmd
2834                     	xdef	_ADC_TempSensorCmd
2835                     	xdef	_ADC_AnalogWatchdogConfig
2836                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2837                     	xdef	_ADC_AnalogWatchdogChannelSelect
2838                     	xdef	_ADC_ExternalTrigConfig
2839                     	xdef	_ADC_SoftwareStartConv
2840                     	xdef	_ADC_Cmd
2841                     	xdef	_ADC_Init
2842                     	xdef	_ADC_DeInit
2861                     	end
