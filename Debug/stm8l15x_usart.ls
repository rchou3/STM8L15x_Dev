   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 163                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 163                     ; 149 {
 165                     	switch	.text
 166  0000               _USART_DeInit:
 170                     ; 153   (void) USARTx->SR;
 172  0000 f6            	ld	a,(x)
 173                     ; 154   (void) USARTx->DR;
 175  0001 e601          	ld	a,(1,x)
 176                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 178  0003 6f03          	clr	(3,x)
 179                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 181  0005 6f02          	clr	(2,x)
 182                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 184  0007 6f04          	clr	(4,x)
 185                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 187  0009 6f05          	clr	(5,x)
 188                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 190  000b 6f06          	clr	(6,x)
 191                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 193  000d 6f07          	clr	(7,x)
 194                     ; 163 }
 197  000f 81            	ret
 389                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 389                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 389                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 389                     ; 195 {
 390                     	switch	.text
 391  0010               _USART_Init:
 393  0010 89            	pushw	x
 394  0011 5204          	subw	sp,#4
 395       00000004      OFST:	set	4
 398                     ; 196   uint32_t BaudRate_Mantissa = 0;
 400                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 402                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 404                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 406                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 408                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 410                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 412  0013 e604          	ld	a,(4,x)
 413  0015 a4e9          	and	a,#233
 414  0017 e704          	ld	(4,x),a
 415                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 417  0019 7b0d          	ld	a,(OFST+9,sp)
 418  001b 1a0f          	or	a,(OFST+11,sp)
 419  001d ea04          	or	a,(4,x)
 420  001f e704          	ld	(4,x),a
 421                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 423  0021 e606          	ld	a,(6,x)
 424  0023 a4cf          	and	a,#207
 425  0025 e706          	ld	(6,x),a
 426                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 428  0027 e606          	ld	a,(6,x)
 429  0029 1a0e          	or	a,(OFST+10,sp)
 430  002b e706          	ld	(6,x),a
 431                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 433  002d 6f02          	clr	(2,x)
 434                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 436  002f e603          	ld	a,(3,x)
 437  0031 a40f          	and	a,#15
 438  0033 e703          	ld	(3,x),a
 439                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 441  0035 e603          	ld	a,(3,x)
 442  0037 a4f0          	and	a,#240
 443  0039 e703          	ld	(3,x),a
 444                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 446  003b cd0000        	call	_CLK_GetClockFreq
 448  003e 96            	ldw	x,sp
 449  003f 1c0009        	addw	x,#OFST+5
 450  0042 cd0000        	call	c_ludv
 452  0045 96            	ldw	x,sp
 453  0046 1c0001        	addw	x,#OFST-3
 454  0049 cd0000        	call	c_rtol
 457                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 459  004c 7b03          	ld	a,(OFST-1,sp)
 460  004e a4f0          	and	a,#240
 461  0050 1e05          	ldw	x,(OFST+1,sp)
 462  0052 e703          	ld	(3,x),a
 463                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 465  0054 1e05          	ldw	x,(OFST+1,sp)
 466  0056 7b04          	ld	a,(OFST+0,sp)
 467  0058 a40f          	and	a,#15
 468  005a ea03          	or	a,(3,x)
 469  005c e703          	ld	(3,x),a
 470                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  005e 96            	ldw	x,sp
 473  005f 1c0001        	addw	x,#OFST-3
 474  0062 cd0000        	call	c_ltor
 476  0065 a604          	ld	a,#4
 477  0067 cd0000        	call	c_lursh
 479  006a b603          	ld	a,c_lreg+3
 480  006c 1e05          	ldw	x,(OFST+1,sp)
 481  006e e702          	ld	(2,x),a
 482                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  0070 1e05          	ldw	x,(OFST+1,sp)
 485  0072 e605          	ld	a,(5,x)
 486  0074 a4f3          	and	a,#243
 487  0076 e705          	ld	(5,x),a
 488                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 490  0078 1e05          	ldw	x,(OFST+1,sp)
 491  007a e605          	ld	a,(5,x)
 492  007c 1a10          	or	a,(OFST+12,sp)
 493  007e e705          	ld	(5,x),a
 494                     ; 239 }
 497  0080 5b06          	addw	sp,#6
 498  0082 81            	ret
 658                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 658                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 658                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 658                     ; 267 {
 659                     	switch	.text
 660  0083               _USART_ClockInit:
 662  0083 89            	pushw	x
 663       00000000      OFST:	set	0
 666                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 668                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 670                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 672                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 674                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 676  0084 e606          	ld	a,(6,x)
 677  0086 a4f8          	and	a,#248
 678  0088 e706          	ld	(6,x),a
 679                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 681  008a 7b06          	ld	a,(OFST+6,sp)
 682  008c 1a07          	or	a,(OFST+7,sp)
 683  008e 1a08          	or	a,(OFST+8,sp)
 684  0090 ea06          	or	a,(6,x)
 685  0092 e706          	ld	(6,x),a
 686                     ; 279   if (USART_Clock != USART_Clock_Disable)
 688  0094 0d05          	tnz	(OFST+5,sp)
 689  0096 2708          	jreq	L523
 690                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 692  0098 e606          	ld	a,(6,x)
 693  009a aa08          	or	a,#8
 694  009c e706          	ld	(6,x),a
 696  009e 2008          	jra	L723
 697  00a0               L523:
 698                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 700  00a0 1e01          	ldw	x,(OFST+1,sp)
 701  00a2 e606          	ld	a,(6,x)
 702  00a4 a4f7          	and	a,#247
 703  00a6 e706          	ld	(6,x),a
 704  00a8               L723:
 705                     ; 287 }
 708  00a8 85            	popw	x
 709  00a9 81            	ret
 776                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 776                     ; 297 {
 777                     	switch	.text
 778  00aa               _USART_Cmd:
 780  00aa 89            	pushw	x
 781       00000000      OFST:	set	0
 784                     ; 298   if (NewState != DISABLE)
 786  00ab 0d05          	tnz	(OFST+5,sp)
 787  00ad 2708          	jreq	L563
 788                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 790  00af e604          	ld	a,(4,x)
 791  00b1 a4df          	and	a,#223
 792  00b3 e704          	ld	(4,x),a
 794  00b5 2008          	jra	L763
 795  00b7               L563:
 796                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 798  00b7 1e01          	ldw	x,(OFST+1,sp)
 799  00b9 e604          	ld	a,(4,x)
 800  00bb aa20          	or	a,#32
 801  00bd e704          	ld	(4,x),a
 802  00bf               L763:
 803                     ; 306 }
 806  00bf 85            	popw	x
 807  00c0 81            	ret
 853                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 853                     ; 330 {
 854                     	switch	.text
 855  00c1               _USART_SetPrescaler:
 857  00c1 89            	pushw	x
 858       00000000      OFST:	set	0
 861                     ; 332   USARTx->PSCR = USART_Prescaler;
 863  00c2 7b05          	ld	a,(OFST+5,sp)
 864  00c4 1e01          	ldw	x,(OFST+1,sp)
 865  00c6 e70a          	ld	(10,x),a
 866                     ; 333 }
 869  00c8 85            	popw	x
 870  00c9 81            	ret
 907                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 907                     ; 341 {
 908                     	switch	.text
 909  00ca               _USART_SendBreak:
 913                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 915  00ca e605          	ld	a,(5,x)
 916  00cc aa01          	or	a,#1
 917  00ce e705          	ld	(5,x),a
 918                     ; 343 }
 921  00d0 81            	ret
 958                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 958                     ; 383 {
 959                     	switch	.text
 960  00d1               _USART_ReceiveData8:
 964                     ; 384   return USARTx->DR;
 966  00d1 e601          	ld	a,(1,x)
 969  00d3 81            	ret
1015                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1015                     ; 393 {
1016                     	switch	.text
1017  00d4               _USART_ReceiveData9:
1019  00d4 89            	pushw	x
1020  00d5 89            	pushw	x
1021       00000002      OFST:	set	2
1024                     ; 394   uint16_t temp = 0;
1026                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1028  00d6 e604          	ld	a,(4,x)
1029  00d8 5f            	clrw	x
1030  00d9 a480          	and	a,#128
1031  00db 5f            	clrw	x
1032  00dc 02            	rlwa	x,a
1033  00dd 58            	sllw	x
1034  00de 1f01          	ldw	(OFST-1,sp),x
1036                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1038  00e0 1e03          	ldw	x,(OFST+1,sp)
1039  00e2 e601          	ld	a,(1,x)
1040  00e4 5f            	clrw	x
1041  00e5 97            	ld	xl,a
1042  00e6 01            	rrwa	x,a
1043  00e7 1a02          	or	a,(OFST+0,sp)
1044  00e9 01            	rrwa	x,a
1045  00ea 1a01          	or	a,(OFST-1,sp)
1046  00ec 01            	rrwa	x,a
1047  00ed 01            	rrwa	x,a
1048  00ee a4ff          	and	a,#255
1049  00f0 01            	rrwa	x,a
1050  00f1 a401          	and	a,#1
1051  00f3 01            	rrwa	x,a
1054  00f4 5b04          	addw	sp,#4
1055  00f6 81            	ret
1101                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1101                     ; 406 {
1102                     	switch	.text
1103  00f7               _USART_SendData8:
1105  00f7 89            	pushw	x
1106       00000000      OFST:	set	0
1109                     ; 408   USARTx->DR = Data;
1111  00f8 7b05          	ld	a,(OFST+5,sp)
1112  00fa 1e01          	ldw	x,(OFST+1,sp)
1113  00fc e701          	ld	(1,x),a
1114                     ; 409 }
1117  00fe 85            	popw	x
1118  00ff 81            	ret
1164                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1164                     ; 419 {
1165                     	switch	.text
1166  0100               _USART_SendData9:
1168  0100 89            	pushw	x
1169       00000000      OFST:	set	0
1172                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1174                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1176  0101 e604          	ld	a,(4,x)
1177  0103 a4bf          	and	a,#191
1178  0105 e704          	ld	(4,x),a
1179                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1181  0107 1605          	ldw	y,(OFST+5,sp)
1182  0109 9054          	srlw	y
1183  010b 9054          	srlw	y
1184  010d 909f          	ld	a,yl
1185  010f a440          	and	a,#64
1186  0111 ea04          	or	a,(4,x)
1187  0113 e704          	ld	(4,x),a
1188                     ; 429   USARTx->DR   = (uint8_t)(Data);
1190  0115 7b06          	ld	a,(OFST+6,sp)
1191  0117 1e01          	ldw	x,(OFST+1,sp)
1192  0119 e701          	ld	(1,x),a
1193                     ; 430 }
1196  011b 85            	popw	x
1197  011c 81            	ret
1245                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1245                     ; 474 {
1246                     	switch	.text
1247  011d               _USART_ReceiverWakeUpCmd:
1249  011d 89            	pushw	x
1250       00000000      OFST:	set	0
1253                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1255                     ; 477   if (NewState != DISABLE)
1257  011e 0d05          	tnz	(OFST+5,sp)
1258  0120 2708          	jreq	L575
1259                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1261  0122 e605          	ld	a,(5,x)
1262  0124 aa02          	or	a,#2
1263  0126 e705          	ld	(5,x),a
1265  0128 2008          	jra	L775
1266  012a               L575:
1267                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1269  012a 1e01          	ldw	x,(OFST+1,sp)
1270  012c e605          	ld	a,(5,x)
1271  012e a4fd          	and	a,#253
1272  0130 e705          	ld	(5,x),a
1273  0132               L775:
1274                     ; 487 }
1277  0132 85            	popw	x
1278  0133 81            	ret
1324                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1324                     ; 497 {
1325                     	switch	.text
1326  0134               _USART_SetAddress:
1328  0134 89            	pushw	x
1329       00000000      OFST:	set	0
1332                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1334                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1336  0135 e607          	ld	a,(7,x)
1337  0137 a4f0          	and	a,#240
1338  0139 e707          	ld	(7,x),a
1339                     ; 504   USARTx->CR4 |= USART_Address;
1341  013b e607          	ld	a,(7,x)
1342  013d 1a05          	or	a,(OFST+5,sp)
1343  013f e707          	ld	(7,x),a
1344                     ; 505 }
1347  0141 85            	popw	x
1348  0142 81            	ret
1417                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1417                     ; 516 {
1418                     	switch	.text
1419  0143               _USART_WakeUpConfig:
1421  0143 89            	pushw	x
1422       00000000      OFST:	set	0
1425                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1427                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1429  0144 e604          	ld	a,(4,x)
1430  0146 a4f7          	and	a,#247
1431  0148 e704          	ld	(4,x),a
1432                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1434  014a e604          	ld	a,(4,x)
1435  014c 1a05          	or	a,(OFST+5,sp)
1436  014e e704          	ld	(4,x),a
1437                     ; 521 }
1440  0150 85            	popw	x
1441  0151 81            	ret
1489                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1489                     ; 567 {
1490                     	switch	.text
1491  0152               _USART_HalfDuplexCmd:
1493  0152 89            	pushw	x
1494       00000000      OFST:	set	0
1497                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1499                     ; 570   if (NewState != DISABLE)
1501  0153 0d05          	tnz	(OFST+5,sp)
1502  0155 2708          	jreq	L507
1503                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1505  0157 e608          	ld	a,(8,x)
1506  0159 aa08          	or	a,#8
1507  015b e708          	ld	(8,x),a
1509  015d 2008          	jra	L707
1510  015f               L507:
1511                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1513  015f 1e01          	ldw	x,(OFST+1,sp)
1514  0161 e608          	ld	a,(8,x)
1515  0163 a4f7          	and	a,#247
1516  0165 e708          	ld	(8,x),a
1517  0167               L707:
1518                     ; 578 }
1521  0167 85            	popw	x
1522  0168 81            	ret
1569                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1569                     ; 645 {
1570                     	switch	.text
1571  0169               _USART_SmartCardCmd:
1573  0169 89            	pushw	x
1574       00000000      OFST:	set	0
1577                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1579                     ; 648   if (NewState != DISABLE)
1581  016a 0d05          	tnz	(OFST+5,sp)
1582  016c 2708          	jreq	L537
1583                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1585  016e e608          	ld	a,(8,x)
1586  0170 aa20          	or	a,#32
1587  0172 e708          	ld	(8,x),a
1589  0174 2008          	jra	L737
1590  0176               L537:
1591                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1593  0176 1e01          	ldw	x,(OFST+1,sp)
1594  0178 e608          	ld	a,(8,x)
1595  017a a4df          	and	a,#223
1596  017c e708          	ld	(8,x),a
1597  017e               L737:
1598                     ; 658 }
1601  017e 85            	popw	x
1602  017f 81            	ret
1650                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1650                     ; 668 {
1651                     	switch	.text
1652  0180               _USART_SmartCardNACKCmd:
1654  0180 89            	pushw	x
1655       00000000      OFST:	set	0
1658                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1660                     ; 671   if (NewState != DISABLE)
1662  0181 0d05          	tnz	(OFST+5,sp)
1663  0183 2708          	jreq	L567
1664                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1666  0185 e608          	ld	a,(8,x)
1667  0187 aa10          	or	a,#16
1668  0189 e708          	ld	(8,x),a
1670  018b 2008          	jra	L767
1671  018d               L567:
1672                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1674  018d 1e01          	ldw	x,(OFST+1,sp)
1675  018f e608          	ld	a,(8,x)
1676  0191 a4ef          	and	a,#239
1677  0193 e708          	ld	(8,x),a
1678  0195               L767:
1679                     ; 681 }
1682  0195 85            	popw	x
1683  0196 81            	ret
1729                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1729                     ; 691 {
1730                     	switch	.text
1731  0197               _USART_SetGuardTime:
1733  0197 89            	pushw	x
1734       00000000      OFST:	set	0
1737                     ; 693   USARTx->GTR = USART_GuardTime;
1739  0198 7b05          	ld	a,(OFST+5,sp)
1740  019a 1e01          	ldw	x,(OFST+1,sp)
1741  019c e709          	ld	(9,x),a
1742                     ; 694 }
1745  019e 85            	popw	x
1746  019f 81            	ret
1815                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1815                     ; 752 {
1816                     	switch	.text
1817  01a0               _USART_IrDAConfig:
1819  01a0 89            	pushw	x
1820       00000000      OFST:	set	0
1823                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1825                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1827  01a1 0d05          	tnz	(OFST+5,sp)
1828  01a3 2708          	jreq	L1501
1829                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1831  01a5 e608          	ld	a,(8,x)
1832  01a7 aa04          	or	a,#4
1833  01a9 e708          	ld	(8,x),a
1835  01ab 2008          	jra	L3501
1836  01ad               L1501:
1837                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1839  01ad 1e01          	ldw	x,(OFST+1,sp)
1840  01af e608          	ld	a,(8,x)
1841  01b1 a4fb          	and	a,#251
1842  01b3 e708          	ld	(8,x),a
1843  01b5               L3501:
1844                     ; 763 }
1847  01b5 85            	popw	x
1848  01b6 81            	ret
1895                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1895                     ; 773 {
1896                     	switch	.text
1897  01b7               _USART_IrDACmd:
1899  01b7 89            	pushw	x
1900       00000000      OFST:	set	0
1903                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1905                     ; 778   if (NewState != DISABLE)
1907  01b8 0d05          	tnz	(OFST+5,sp)
1908  01ba 2708          	jreq	L1011
1909                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1911  01bc e608          	ld	a,(8,x)
1912  01be aa02          	or	a,#2
1913  01c0 e708          	ld	(8,x),a
1915  01c2 2008          	jra	L3011
1916  01c4               L1011:
1917                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1919  01c4 1e01          	ldw	x,(OFST+1,sp)
1920  01c6 e608          	ld	a,(8,x)
1921  01c8 a4fd          	and	a,#253
1922  01ca e708          	ld	(8,x),a
1923  01cc               L3011:
1924                     ; 788 }
1927  01cc 85            	popw	x
1928  01cd 81            	ret
2005                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2005                     ; 819                   FunctionalState NewState)
2005                     ; 820 {
2006                     	switch	.text
2007  01ce               _USART_DMACmd:
2009  01ce 89            	pushw	x
2010       00000000      OFST:	set	0
2013                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2015                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2017                     ; 825   if (NewState != DISABLE)
2019  01cf 0d06          	tnz	(OFST+6,sp)
2020  01d1 2708          	jreq	L5411
2021                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2023  01d3 e608          	ld	a,(8,x)
2024  01d5 1a05          	or	a,(OFST+5,sp)
2025  01d7 e708          	ld	(8,x),a
2027  01d9 2009          	jra	L7411
2028  01db               L5411:
2029                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2031  01db 1e01          	ldw	x,(OFST+1,sp)
2032  01dd 7b05          	ld	a,(OFST+5,sp)
2033  01df 43            	cpl	a
2034  01e0 e408          	and	a,(8,x)
2035  01e2 e708          	ld	(8,x),a
2036  01e4               L7411:
2037                     ; 837 }
2040  01e4 85            	popw	x
2041  01e5 81            	ret
2185                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2185                     ; 940 {
2186                     	switch	.text
2187  01e6               _USART_ITConfig:
2189  01e6 89            	pushw	x
2190  01e7 89            	pushw	x
2191       00000002      OFST:	set	2
2194                     ; 941   uint8_t usartreg, itpos = 0x00;
2196                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2198                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2200                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2202  01e8 7b07          	ld	a,(OFST+5,sp)
2203  01ea 6b01          	ld	(OFST-1,sp),a
2205                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2207  01ec 7b08          	ld	a,(OFST+6,sp)
2208  01ee a40f          	and	a,#15
2209  01f0 5f            	clrw	x
2210  01f1 97            	ld	xl,a
2211  01f2 a601          	ld	a,#1
2212  01f4 5d            	tnzw	x
2213  01f5 2704          	jreq	L65
2214  01f7               L06:
2215  01f7 48            	sll	a
2216  01f8 5a            	decw	x
2217  01f9 26fc          	jrne	L06
2218  01fb               L65:
2219  01fb 6b02          	ld	(OFST+0,sp),a
2221                     ; 950   if (NewState != DISABLE)
2223  01fd 0d09          	tnz	(OFST+7,sp)
2224  01ff 272a          	jreq	L7321
2225                     ; 953     if (usartreg == 0x01)
2227  0201 7b01          	ld	a,(OFST-1,sp)
2228  0203 a101          	cp	a,#1
2229  0205 260a          	jrne	L1421
2230                     ; 955       USARTx->CR1 |= itpos;
2232  0207 1e03          	ldw	x,(OFST+1,sp)
2233  0209 e604          	ld	a,(4,x)
2234  020b 1a02          	or	a,(OFST+0,sp)
2235  020d e704          	ld	(4,x),a
2237  020f 2045          	jra	L1521
2238  0211               L1421:
2239                     ; 957     else if (usartreg == 0x05)
2241  0211 7b01          	ld	a,(OFST-1,sp)
2242  0213 a105          	cp	a,#5
2243  0215 260a          	jrne	L5421
2244                     ; 959       USARTx->CR5 |= itpos;
2246  0217 1e03          	ldw	x,(OFST+1,sp)
2247  0219 e608          	ld	a,(8,x)
2248  021b 1a02          	or	a,(OFST+0,sp)
2249  021d e708          	ld	(8,x),a
2251  021f 2035          	jra	L1521
2252  0221               L5421:
2253                     ; 964       USARTx->CR2 |= itpos;
2255  0221 1e03          	ldw	x,(OFST+1,sp)
2256  0223 e605          	ld	a,(5,x)
2257  0225 1a02          	or	a,(OFST+0,sp)
2258  0227 e705          	ld	(5,x),a
2259  0229 202b          	jra	L1521
2260  022b               L7321:
2261                     ; 970     if (usartreg == 0x01)
2263  022b 7b01          	ld	a,(OFST-1,sp)
2264  022d a101          	cp	a,#1
2265  022f 260b          	jrne	L3521
2266                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2268  0231 1e03          	ldw	x,(OFST+1,sp)
2269  0233 7b02          	ld	a,(OFST+0,sp)
2270  0235 43            	cpl	a
2271  0236 e404          	and	a,(4,x)
2272  0238 e704          	ld	(4,x),a
2274  023a 201a          	jra	L1521
2275  023c               L3521:
2276                     ; 974     else if (usartreg == 0x05)
2278  023c 7b01          	ld	a,(OFST-1,sp)
2279  023e a105          	cp	a,#5
2280  0240 260b          	jrne	L7521
2281                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2283  0242 1e03          	ldw	x,(OFST+1,sp)
2284  0244 7b02          	ld	a,(OFST+0,sp)
2285  0246 43            	cpl	a
2286  0247 e408          	and	a,(8,x)
2287  0249 e708          	ld	(8,x),a
2289  024b 2009          	jra	L1521
2290  024d               L7521:
2291                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2293  024d 1e03          	ldw	x,(OFST+1,sp)
2294  024f 7b02          	ld	a,(OFST+0,sp)
2295  0251 43            	cpl	a
2296  0252 e405          	and	a,(5,x)
2297  0254 e705          	ld	(5,x),a
2298  0256               L1521:
2299                     ; 984 }
2302  0256 5b04          	addw	sp,#4
2303  0258 81            	ret
2451                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2451                     ; 1003 {
2452                     	switch	.text
2453  0259               _USART_GetFlagStatus:
2455  0259 89            	pushw	x
2456  025a 88            	push	a
2457       00000001      OFST:	set	1
2460                     ; 1004   FlagStatus status = RESET;
2462                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2464                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2466  025b 1e06          	ldw	x,(OFST+5,sp)
2467  025d a30101        	cpw	x,#257
2468  0260 2612          	jrne	L1531
2469                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2471  0262 1e02          	ldw	x,(OFST+1,sp)
2472  0264 e605          	ld	a,(5,x)
2473  0266 1507          	bcp	a,(OFST+6,sp)
2474  0268 2706          	jreq	L3531
2475                     ; 1014       status = SET;
2477  026a a601          	ld	a,#1
2478  026c 6b01          	ld	(OFST+0,sp),a
2481  026e 2013          	jra	L7531
2482  0270               L3531:
2483                     ; 1019       status = RESET;
2485  0270 0f01          	clr	(OFST+0,sp)
2487  0272 200f          	jra	L7531
2488  0274               L1531:
2489                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2491  0274 1e02          	ldw	x,(OFST+1,sp)
2492  0276 f6            	ld	a,(x)
2493  0277 1507          	bcp	a,(OFST+6,sp)
2494  0279 2706          	jreq	L1631
2495                     ; 1027       status = SET;
2497  027b a601          	ld	a,#1
2498  027d 6b01          	ld	(OFST+0,sp),a
2501  027f 2002          	jra	L7531
2502  0281               L1631:
2503                     ; 1032       status = RESET;
2505  0281 0f01          	clr	(OFST+0,sp)
2507  0283               L7531:
2508                     ; 1036   return status;
2510  0283 7b01          	ld	a,(OFST+0,sp)
2513  0285 5b03          	addw	sp,#3
2514  0287 81            	ret
2561                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2561                     ; 1061 {
2562                     	switch	.text
2563  0288               _USART_ClearFlag:
2565  0288 89            	pushw	x
2566       00000000      OFST:	set	0
2569                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2571                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2573  0289 7b06          	ld	a,(OFST+6,sp)
2574  028b 43            	cpl	a
2575  028c 1e01          	ldw	x,(OFST+1,sp)
2576  028e f7            	ld	(x),a
2577                     ; 1066 }
2580  028f 85            	popw	x
2581  0290 81            	ret
2684                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2684                     ; 1084 {
2685                     	switch	.text
2686  0291               _USART_GetITStatus:
2688  0291 89            	pushw	x
2689  0292 5203          	subw	sp,#3
2690       00000003      OFST:	set	3
2693                     ; 1085   ITStatus pendingbitstatus = RESET;
2695                     ; 1086   uint8_t temp = 0;
2697                     ; 1087   uint8_t itpos = 0;
2699                     ; 1088   uint8_t itmask1 = 0;
2701                     ; 1089   uint8_t itmask2 = 0;
2703                     ; 1090   uint8_t enablestatus = 0;
2705                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2707                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2709  0294 7b09          	ld	a,(OFST+6,sp)
2710  0296 a40f          	and	a,#15
2711  0298 5f            	clrw	x
2712  0299 97            	ld	xl,a
2713  029a a601          	ld	a,#1
2714  029c 5d            	tnzw	x
2715  029d 2704          	jreq	L07
2716  029f               L27:
2717  029f 48            	sll	a
2718  02a0 5a            	decw	x
2719  02a1 26fc          	jrne	L27
2720  02a3               L07:
2721  02a3 6b02          	ld	(OFST-1,sp),a
2723                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2725  02a5 7b09          	ld	a,(OFST+6,sp)
2726  02a7 4e            	swap	a
2727  02a8 a40f          	and	a,#15
2728  02aa 6b03          	ld	(OFST+0,sp),a
2730                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2732  02ac 7b03          	ld	a,(OFST+0,sp)
2733  02ae 5f            	clrw	x
2734  02af 97            	ld	xl,a
2735  02b0 a601          	ld	a,#1
2736  02b2 5d            	tnzw	x
2737  02b3 2704          	jreq	L47
2738  02b5               L67:
2739  02b5 48            	sll	a
2740  02b6 5a            	decw	x
2741  02b7 26fc          	jrne	L67
2742  02b9               L47:
2743  02b9 6b03          	ld	(OFST+0,sp),a
2745                     ; 1103   if (USART_IT == USART_IT_PE)
2747  02bb 1e08          	ldw	x,(OFST+5,sp)
2748  02bd a30100        	cpw	x,#256
2749  02c0 261d          	jrne	L5641
2750                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2752  02c2 1e04          	ldw	x,(OFST+1,sp)
2753  02c4 e604          	ld	a,(4,x)
2754  02c6 1403          	and	a,(OFST+0,sp)
2755  02c8 6b03          	ld	(OFST+0,sp),a
2757                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2759  02ca 1e04          	ldw	x,(OFST+1,sp)
2760  02cc f6            	ld	a,(x)
2761  02cd 1502          	bcp	a,(OFST-1,sp)
2762  02cf 270a          	jreq	L7641
2764  02d1 0d03          	tnz	(OFST+0,sp)
2765  02d3 2706          	jreq	L7641
2766                     ; 1112       pendingbitstatus = SET;
2768  02d5 a601          	ld	a,#1
2769  02d7 6b03          	ld	(OFST+0,sp),a
2772  02d9 204f          	jra	L3741
2773  02db               L7641:
2774                     ; 1117       pendingbitstatus = RESET;
2776  02db 0f03          	clr	(OFST+0,sp)
2778  02dd 204b          	jra	L3741
2779  02df               L5641:
2780                     ; 1121   else if (USART_IT == USART_IT_OR)
2782  02df 1e08          	ldw	x,(OFST+5,sp)
2783  02e1 a30235        	cpw	x,#565
2784  02e4 2629          	jrne	L5741
2785                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2787  02e6 1e04          	ldw	x,(OFST+1,sp)
2788  02e8 e605          	ld	a,(5,x)
2789  02ea 1403          	and	a,(OFST+0,sp)
2790  02ec 6b03          	ld	(OFST+0,sp),a
2792                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2794  02ee 1e04          	ldw	x,(OFST+1,sp)
2795  02f0 e608          	ld	a,(8,x)
2796  02f2 a401          	and	a,#1
2797  02f4 6b01          	ld	(OFST-2,sp),a
2799                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2801  02f6 1e04          	ldw	x,(OFST+1,sp)
2802  02f8 f6            	ld	a,(x)
2803  02f9 1502          	bcp	a,(OFST-1,sp)
2804  02fb 270e          	jreq	L7741
2806  02fd 0d03          	tnz	(OFST+0,sp)
2807  02ff 2604          	jrne	L1051
2809  0301 0d01          	tnz	(OFST-2,sp)
2810  0303 2706          	jreq	L7741
2811  0305               L1051:
2812                     ; 1132       pendingbitstatus = SET;
2814  0305 a601          	ld	a,#1
2815  0307 6b03          	ld	(OFST+0,sp),a
2818  0309 201f          	jra	L3741
2819  030b               L7741:
2820                     ; 1137       pendingbitstatus = RESET;
2822  030b 0f03          	clr	(OFST+0,sp)
2824  030d 201b          	jra	L3741
2825  030f               L5741:
2826                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2828  030f 1e04          	ldw	x,(OFST+1,sp)
2829  0311 e605          	ld	a,(5,x)
2830  0313 1403          	and	a,(OFST+0,sp)
2831  0315 6b03          	ld	(OFST+0,sp),a
2833                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2835  0317 1e04          	ldw	x,(OFST+1,sp)
2836  0319 f6            	ld	a,(x)
2837  031a 1502          	bcp	a,(OFST-1,sp)
2838  031c 270a          	jreq	L7051
2840  031e 0d03          	tnz	(OFST+0,sp)
2841  0320 2706          	jreq	L7051
2842                     ; 1149       pendingbitstatus = SET;
2844  0322 a601          	ld	a,#1
2845  0324 6b03          	ld	(OFST+0,sp),a
2848  0326 2002          	jra	L3741
2849  0328               L7051:
2850                     ; 1154       pendingbitstatus = RESET;
2852  0328 0f03          	clr	(OFST+0,sp)
2854  032a               L3741:
2855                     ; 1159   return  pendingbitstatus;
2857  032a 7b03          	ld	a,(OFST+0,sp)
2860  032c 5b05          	addw	sp,#5
2861  032e 81            	ret
2899                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2899                     ; 1184 {
2900                     	switch	.text
2901  032f               _USART_ClearITPendingBit:
2905                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2907                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2909  032f f6            	ld	a,(x)
2910  0330 a4bf          	and	a,#191
2911  0332 f7            	ld	(x),a
2912                     ; 1189 }
2915  0333 81            	ret
2928                     	xdef	_USART_ClearITPendingBit
2929                     	xdef	_USART_GetITStatus
2930                     	xdef	_USART_ClearFlag
2931                     	xdef	_USART_GetFlagStatus
2932                     	xdef	_USART_ITConfig
2933                     	xdef	_USART_DMACmd
2934                     	xdef	_USART_IrDACmd
2935                     	xdef	_USART_IrDAConfig
2936                     	xdef	_USART_SetGuardTime
2937                     	xdef	_USART_SmartCardNACKCmd
2938                     	xdef	_USART_SmartCardCmd
2939                     	xdef	_USART_HalfDuplexCmd
2940                     	xdef	_USART_SetAddress
2941                     	xdef	_USART_ReceiverWakeUpCmd
2942                     	xdef	_USART_WakeUpConfig
2943                     	xdef	_USART_ReceiveData9
2944                     	xdef	_USART_ReceiveData8
2945                     	xdef	_USART_SendData9
2946                     	xdef	_USART_SendData8
2947                     	xdef	_USART_SendBreak
2948                     	xdef	_USART_SetPrescaler
2949                     	xdef	_USART_Cmd
2950                     	xdef	_USART_ClockInit
2951                     	xdef	_USART_Init
2952                     	xdef	_USART_DeInit
2953                     	xref	_CLK_GetClockFreq
2954                     	xref.b	c_lreg
2955                     	xref.b	c_x
2974                     	xref	c_lursh
2975                     	xref	c_ltor
2976                     	xref	c_rtol
2977                     	xref	c_ludv
2978                     	end
