   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 136                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 136                     ; 129 {
 138                     	switch	.text
 139  0000               _SPI_DeInit:
 143                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 145  0000 7f            	clr	(x)
 146                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 148  0001 6f01          	clr	(1,x)
 149                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 151  0003 6f02          	clr	(2,x)
 152                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 154  0005 a602          	ld	a,#2
 155  0007 e703          	ld	(3,x),a
 156                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 158  0009 a607          	ld	a,#7
 159  000b e705          	ld	(5,x),a
 160                     ; 135 }
 163  000d 81            	ret
 489                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 489                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 489                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 489                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 489                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 489                     ; 182 {
 490                     	switch	.text
 491  000e               _SPI_Init:
 493  000e 89            	pushw	x
 494  000f 88            	push	a
 495       00000001      OFST:	set	1
 498                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 500                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 502                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 504                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 506                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 508                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 510                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 512                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 514                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 514                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 514                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 514                     ; 197                                   SPI_CPHA));
 516  0010 7b09          	ld	a,(OFST+8,sp)
 517  0012 1a0a          	or	a,(OFST+9,sp)
 518  0014 6b01          	ld	(OFST+0,sp),a
 520  0016 7b06          	ld	a,(OFST+5,sp)
 521  0018 1a07          	or	a,(OFST+6,sp)
 522  001a 1a01          	or	a,(OFST+0,sp)
 523  001c 1e02          	ldw	x,(OFST+1,sp)
 524  001e f7            	ld	(x),a
 525                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 527  001f 7b0b          	ld	a,(OFST+10,sp)
 528  0021 1a0c          	or	a,(OFST+11,sp)
 529  0023 1e02          	ldw	x,(OFST+1,sp)
 530  0025 e701          	ld	(1,x),a
 531                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 533  0027 7b08          	ld	a,(OFST+7,sp)
 534  0029 a104          	cp	a,#4
 535  002b 260a          	jrne	L562
 536                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 538  002d 1e02          	ldw	x,(OFST+1,sp)
 539  002f e601          	ld	a,(1,x)
 540  0031 aa01          	or	a,#1
 541  0033 e701          	ld	(1,x),a
 543  0035 2008          	jra	L762
 544  0037               L562:
 545                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0037 1e02          	ldw	x,(OFST+1,sp)
 548  0039 e601          	ld	a,(1,x)
 549  003b a4fe          	and	a,#254
 550  003d e701          	ld	(1,x),a
 551  003f               L762:
 552                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 554  003f 1e02          	ldw	x,(OFST+1,sp)
 555  0041 f6            	ld	a,(x)
 556  0042 1a08          	or	a,(OFST+7,sp)
 557  0044 f7            	ld	(x),a
 558                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  0045 7b0d          	ld	a,(OFST+12,sp)
 561  0047 1e02          	ldw	x,(OFST+1,sp)
 562  0049 e705          	ld	(5,x),a
 563                     ; 216 }
 566  004b 5b03          	addw	sp,#3
 567  004d 81            	ret
 634                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 634                     ; 226 {
 635                     	switch	.text
 636  004e               _SPI_Cmd:
 638  004e 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 644                     ; 230   if (NewState != DISABLE)
 646  004f 0d05          	tnz	(OFST+5,sp)
 647  0051 2706          	jreq	L523
 648                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 650  0053 f6            	ld	a,(x)
 651  0054 aa40          	or	a,#64
 652  0056 f7            	ld	(x),a
 654  0057 2006          	jra	L723
 655  0059               L523:
 656                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 658  0059 1e01          	ldw	x,(OFST+1,sp)
 659  005b f6            	ld	a,(x)
 660  005c a4bf          	and	a,#191
 661  005e f7            	ld	(x),a
 662  005f               L723:
 663                     ; 238 }
 666  005f 85            	popw	x
 667  0060 81            	ret
 715                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 715                     ; 248 {
 716                     	switch	.text
 717  0061               _SPI_NSSInternalSoftwareCmd:
 719  0061 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 725                     ; 252   if (NewState != DISABLE)
 727  0062 0d05          	tnz	(OFST+5,sp)
 728  0064 2708          	jreq	L553
 729                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 731  0066 e601          	ld	a,(1,x)
 732  0068 aa01          	or	a,#1
 733  006a e701          	ld	(1,x),a
 735  006c 2008          	jra	L753
 736  006e               L553:
 737                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 739  006e 1e01          	ldw	x,(OFST+1,sp)
 740  0070 e601          	ld	a,(1,x)
 741  0072 a4fe          	and	a,#254
 742  0074 e701          	ld	(1,x),a
 743  0076               L753:
 744                     ; 260 }
 747  0076 85            	popw	x
 748  0077 81            	ret
 816                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 816                     ; 272 {
 817                     	switch	.text
 818  0078               _SPI_BiDirectionalLineConfig:
 820  0078 89            	pushw	x
 821       00000000      OFST:	set	0
 824                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 826                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 828  0079 0d05          	tnz	(OFST+5,sp)
 829  007b 2708          	jreq	L514
 830                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 832  007d e601          	ld	a,(1,x)
 833  007f aa40          	or	a,#64
 834  0081 e701          	ld	(1,x),a
 836  0083 2008          	jra	L714
 837  0085               L514:
 838                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 840  0085 1e01          	ldw	x,(OFST+1,sp)
 841  0087 e601          	ld	a,(1,x)
 842  0089 a4bf          	and	a,#191
 843  008b e701          	ld	(1,x),a
 844  008d               L714:
 845                     ; 284 }
 848  008d 85            	popw	x
 849  008e 81            	ret
 895                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 895                     ; 320 {
 896                     	switch	.text
 897  008f               _SPI_SendData:
 899  008f 89            	pushw	x
 900       00000000      OFST:	set	0
 903                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 905  0090 7b05          	ld	a,(OFST+5,sp)
 906  0092 1e01          	ldw	x,(OFST+1,sp)
 907  0094 e704          	ld	(4,x),a
 908                     ; 322 }
 911  0096 85            	popw	x
 912  0097 81            	ret
 949                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 949                     ; 330 {
 950                     	switch	.text
 951  0098               _SPI_ReceiveData:
 955                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 957  0098 e604          	ld	a,(4,x)
 960  009a 81            	ret
 997                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 997                     ; 415 {
 998                     	switch	.text
 999  009b               _SPI_TransmitCRC:
1003                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1005  009b e601          	ld	a,(1,x)
1006  009d aa10          	or	a,#16
1007  009f e701          	ld	(1,x),a
1008                     ; 417 }
1011  00a1 81            	ret
1060                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1060                     ; 427 {
1061                     	switch	.text
1062  00a2               _SPI_CalculateCRCCmd:
1064  00a2 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 432   SPI_Cmd(SPI1, DISABLE);
1072  00a3 4b00          	push	#0
1073  00a5 ae5200        	ldw	x,#20992
1074  00a8 ada4          	call	_SPI_Cmd
1076  00aa 84            	pop	a
1077                     ; 434   if (NewState != DISABLE)
1079  00ab 0d05          	tnz	(OFST+5,sp)
1080  00ad 270a          	jreq	L135
1081                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1083  00af 1e01          	ldw	x,(OFST+1,sp)
1084  00b1 e601          	ld	a,(1,x)
1085  00b3 aa20          	or	a,#32
1086  00b5 e701          	ld	(1,x),a
1088  00b7 2008          	jra	L335
1089  00b9               L135:
1090                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1092  00b9 1e01          	ldw	x,(OFST+1,sp)
1093  00bb e601          	ld	a,(1,x)
1094  00bd a4df          	and	a,#223
1095  00bf e701          	ld	(1,x),a
1096  00c1               L335:
1097                     ; 442 }
1100  00c1 85            	popw	x
1101  00c2 81            	ret
1177                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1177                     ; 454 {
1178                     	switch	.text
1179  00c3               _SPI_GetCRC:
1181  00c3 89            	pushw	x
1182  00c4 88            	push	a
1183       00000001      OFST:	set	1
1186                     ; 455   uint8_t crcreg = 0;
1188                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1190                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1192  00c5 0d06          	tnz	(OFST+5,sp)
1193  00c7 2706          	jreq	L575
1194                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1196  00c9 e607          	ld	a,(7,x)
1197  00cb 6b01          	ld	(OFST+0,sp),a
1200  00cd 2006          	jra	L775
1201  00cf               L575:
1202                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1204  00cf 1e02          	ldw	x,(OFST+1,sp)
1205  00d1 e606          	ld	a,(6,x)
1206  00d3 6b01          	ld	(OFST+0,sp),a
1208  00d5               L775:
1209                     ; 470   return crcreg;
1211  00d5 7b01          	ld	a,(OFST+0,sp)
1214  00d7 5b03          	addw	sp,#3
1215  00d9 81            	ret
1254                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1254                     ; 479 {
1255                     	switch	.text
1256  00da               _SPI_ResetCRC:
1258  00da 89            	pushw	x
1259       00000000      OFST:	set	0
1262                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1264  00db 4b01          	push	#1
1265  00dd adc3          	call	_SPI_CalculateCRCCmd
1267  00df 84            	pop	a
1268                     ; 485   SPI_Cmd(SPIx, ENABLE);
1270  00e0 4b01          	push	#1
1271  00e2 1e02          	ldw	x,(OFST+2,sp)
1272  00e4 cd004e        	call	_SPI_Cmd
1274  00e7 84            	pop	a
1275                     ; 486 }
1278  00e8 85            	popw	x
1279  00e9 81            	ret
1317                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1317                     ; 494 {
1318                     	switch	.text
1319  00ea               _SPI_GetCRCPolynomial:
1323                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1325  00ea e605          	ld	a,(5,x)
1328  00ec 81            	ret
1405                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1405                     ; 526 {
1406                     	switch	.text
1407  00ed               _SPI_DMACmd:
1409  00ed 89            	pushw	x
1410       00000000      OFST:	set	0
1413                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1415                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1417                     ; 531   if (NewState != DISABLE)
1419  00ee 0d06          	tnz	(OFST+6,sp)
1420  00f0 2708          	jreq	L107
1421                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1423  00f2 e602          	ld	a,(2,x)
1424  00f4 1a05          	or	a,(OFST+5,sp)
1425  00f6 e702          	ld	(2,x),a
1427  00f8 2009          	jra	L307
1428  00fa               L107:
1429                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1431  00fa 1e01          	ldw	x,(OFST+1,sp)
1432  00fc 7b05          	ld	a,(OFST+5,sp)
1433  00fe 43            	cpl	a
1434  00ff e402          	and	a,(2,x)
1435  0101 e702          	ld	(2,x),a
1436  0103               L307:
1437                     ; 541 }
1440  0103 85            	popw	x
1441  0104 81            	ret
1562                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1562                     ; 627 {
1563                     	switch	.text
1564  0105               _SPI_ITConfig:
1566  0105 89            	pushw	x
1567  0106 88            	push	a
1568       00000001      OFST:	set	1
1571                     ; 628   uint8_t itpos = 0;
1573                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1575                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1577                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1579  0107 7b06          	ld	a,(OFST+5,sp)
1580  0109 a40f          	and	a,#15
1581  010b 5f            	clrw	x
1582  010c 97            	ld	xl,a
1583  010d a601          	ld	a,#1
1584  010f 5d            	tnzw	x
1585  0110 2704          	jreq	L04
1586  0112               L24:
1587  0112 48            	sll	a
1588  0113 5a            	decw	x
1589  0114 26fc          	jrne	L24
1590  0116               L04:
1591  0116 6b01          	ld	(OFST+0,sp),a
1593                     ; 636   if (NewState != DISABLE)
1595  0118 0d07          	tnz	(OFST+6,sp)
1596  011a 270a          	jreq	L367
1597                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1599  011c 1e02          	ldw	x,(OFST+1,sp)
1600  011e e602          	ld	a,(2,x)
1601  0120 1a01          	or	a,(OFST+0,sp)
1602  0122 e702          	ld	(2,x),a
1604  0124 2009          	jra	L567
1605  0126               L367:
1606                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1608  0126 1e02          	ldw	x,(OFST+1,sp)
1609  0128 7b01          	ld	a,(OFST+0,sp)
1610  012a 43            	cpl	a
1611  012b e402          	and	a,(2,x)
1612  012d e702          	ld	(2,x),a
1613  012f               L567:
1614                     ; 644 }
1617  012f 5b03          	addw	sp,#3
1618  0131 81            	ret
1751                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1751                     ; 662 {
1752                     	switch	.text
1753  0132               _SPI_GetFlagStatus:
1755  0132 89            	pushw	x
1756  0133 88            	push	a
1757       00000001      OFST:	set	1
1760                     ; 663   FlagStatus status = RESET;
1762                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1764                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1766  0134 e603          	ld	a,(3,x)
1767  0136 1506          	bcp	a,(OFST+5,sp)
1768  0138 2706          	jreq	L1501
1769                     ; 670     status = SET; /* SPI_FLAG is set */
1771  013a a601          	ld	a,#1
1772  013c 6b01          	ld	(OFST+0,sp),a
1775  013e 2002          	jra	L3501
1776  0140               L1501:
1777                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1779  0140 0f01          	clr	(OFST+0,sp)
1781  0142               L3501:
1782                     ; 678   return status;
1784  0142 7b01          	ld	a,(OFST+0,sp)
1787  0144 5b03          	addw	sp,#3
1788  0146 81            	ret
1835                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1835                     ; 697 {
1836                     	switch	.text
1837  0147               _SPI_ClearFlag:
1839  0147 89            	pushw	x
1840       00000000      OFST:	set	0
1843                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1845                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1847  0148 7b05          	ld	a,(OFST+5,sp)
1848  014a 43            	cpl	a
1849  014b 1e01          	ldw	x,(OFST+1,sp)
1850  014d e703          	ld	(3,x),a
1851                     ; 701 }
1854  014f 85            	popw	x
1855  0150 81            	ret
1949                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1949                     ; 718 {
1950                     	switch	.text
1951  0151               _SPI_GetITStatus:
1953  0151 89            	pushw	x
1954  0152 5203          	subw	sp,#3
1955       00000003      OFST:	set	3
1958                     ; 719   ITStatus pendingbitstatus = RESET;
1960                     ; 720   uint8_t itpos = 0;
1962                     ; 721   uint8_t itmask1 = 0;
1964                     ; 722   uint8_t itmask2 = 0;
1966                     ; 723   __IO uint8_t enablestatus = 0;
1968  0154 0f02          	clr	(OFST-1,sp)
1970                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1972                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1974  0156 7b08          	ld	a,(OFST+5,sp)
1975  0158 a40f          	and	a,#15
1976  015a 5f            	clrw	x
1977  015b 97            	ld	xl,a
1978  015c a601          	ld	a,#1
1979  015e 5d            	tnzw	x
1980  015f 2704          	jreq	L25
1981  0161               L45:
1982  0161 48            	sll	a
1983  0162 5a            	decw	x
1984  0163 26fc          	jrne	L45
1985  0165               L25:
1986  0165 6b01          	ld	(OFST-2,sp),a
1988                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1990  0167 7b08          	ld	a,(OFST+5,sp)
1991  0169 4e            	swap	a
1992  016a a40f          	and	a,#15
1993  016c 6b03          	ld	(OFST+0,sp),a
1995                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1997  016e 7b03          	ld	a,(OFST+0,sp)
1998  0170 5f            	clrw	x
1999  0171 97            	ld	xl,a
2000  0172 a601          	ld	a,#1
2001  0174 5d            	tnzw	x
2002  0175 2704          	jreq	L65
2003  0177               L06:
2004  0177 48            	sll	a
2005  0178 5a            	decw	x
2006  0179 26fc          	jrne	L06
2007  017b               L65:
2008  017b 6b03          	ld	(OFST+0,sp),a
2010                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2012  017d 1e04          	ldw	x,(OFST+1,sp)
2013  017f e603          	ld	a,(3,x)
2014  0181 1403          	and	a,(OFST+0,sp)
2015  0183 6b02          	ld	(OFST-1,sp),a
2017                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2019  0185 1e04          	ldw	x,(OFST+1,sp)
2020  0187 e602          	ld	a,(2,x)
2021  0189 1501          	bcp	a,(OFST-2,sp)
2022  018b 270a          	jreq	L1511
2024  018d 0d02          	tnz	(OFST-1,sp)
2025  018f 2706          	jreq	L1511
2026                     ; 738     pendingbitstatus = SET;
2028  0191 a601          	ld	a,#1
2029  0193 6b03          	ld	(OFST+0,sp),a
2032  0195 2002          	jra	L3511
2033  0197               L1511:
2034                     ; 743     pendingbitstatus = RESET;
2036  0197 0f03          	clr	(OFST+0,sp)
2038  0199               L3511:
2039                     ; 746   return  pendingbitstatus;
2041  0199 7b03          	ld	a,(OFST+0,sp)
2044  019b 5b05          	addw	sp,#5
2045  019d 81            	ret
2102                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2102                     ; 765 {
2103                     	switch	.text
2104  019e               _SPI_ClearITPendingBit:
2106  019e 89            	pushw	x
2107  019f 88            	push	a
2108       00000001      OFST:	set	1
2111                     ; 766   uint8_t itpos = 0;
2113                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2115                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2117  01a0 7b06          	ld	a,(OFST+5,sp)
2118  01a2 a4f0          	and	a,#240
2119  01a4 4e            	swap	a
2120  01a5 a40f          	and	a,#15
2121  01a7 5f            	clrw	x
2122  01a8 97            	ld	xl,a
2123  01a9 a601          	ld	a,#1
2124  01ab 5d            	tnzw	x
2125  01ac 2704          	jreq	L46
2126  01ae               L66:
2127  01ae 48            	sll	a
2128  01af 5a            	decw	x
2129  01b0 26fc          	jrne	L66
2130  01b2               L46:
2131  01b2 6b01          	ld	(OFST+0,sp),a
2133                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2135  01b4 7b01          	ld	a,(OFST+0,sp)
2136  01b6 43            	cpl	a
2137  01b7 1e02          	ldw	x,(OFST+1,sp)
2138  01b9 e703          	ld	(3,x),a
2139                     ; 776 }
2142  01bb 5b03          	addw	sp,#3
2143  01bd 81            	ret
2156                     	xdef	_SPI_ClearITPendingBit
2157                     	xdef	_SPI_GetITStatus
2158                     	xdef	_SPI_ClearFlag
2159                     	xdef	_SPI_GetFlagStatus
2160                     	xdef	_SPI_ITConfig
2161                     	xdef	_SPI_DMACmd
2162                     	xdef	_SPI_GetCRCPolynomial
2163                     	xdef	_SPI_ResetCRC
2164                     	xdef	_SPI_GetCRC
2165                     	xdef	_SPI_CalculateCRCCmd
2166                     	xdef	_SPI_TransmitCRC
2167                     	xdef	_SPI_ReceiveData
2168                     	xdef	_SPI_SendData
2169                     	xdef	_SPI_BiDirectionalLineConfig
2170                     	xdef	_SPI_NSSInternalSoftwareCmd
2171                     	xdef	_SPI_Cmd
2172                     	xdef	_SPI_Init
2173                     	xdef	_SPI_DeInit
2192                     	end
