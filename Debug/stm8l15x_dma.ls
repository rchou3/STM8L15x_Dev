   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 140 void DMA_GlobalDeInit(void)
  43                     ; 141 {
  45                     	switch	.text
  46  0000               _DMA_GlobalDeInit:
  50                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  52  0000 72115070      	bres	20592,#0
  53                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  55  0004 35fc5070      	mov	20592,#252
  56                     ; 147 }
  59  0008 81            	ret
 175                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 175                     ; 156 {
 176                     	switch	.text
 177  0009               _DMA_DeInit:
 179  0009 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 185                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 187  000a f6            	ld	a,(x)
 188  000b a4fe          	and	a,#254
 189  000d f7            	ld	(x),a
 190                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 192  000e 7f            	clr	(x)
 193                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 195  000f 6f02          	clr	(2,x)
 196                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 198  0011 a35093        	cpw	x,#20627
 199  0014 2608          	jrne	L501
 200                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 202  0016 a640          	ld	a,#64
 203  0018 e703          	ld	(3,x),a
 204                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 206  001a 6f05          	clr	(5,x)
 208  001c 2006          	jra	L701
 209  001e               L501:
 210                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 212  001e 1e01          	ldw	x,(OFST+1,sp)
 213  0020 a652          	ld	a,#82
 214  0022 e703          	ld	(3,x),a
 215  0024               L701:
 216                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 218  0024 1e01          	ldw	x,(OFST+1,sp)
 219  0026 6f04          	clr	(4,x)
 220                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 222  0028 1e01          	ldw	x,(OFST+1,sp)
 223  002a 6f06          	clr	(6,x)
 224                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 226  002c 1e01          	ldw	x,(OFST+1,sp)
 227  002e 6f07          	clr	(7,x)
 228                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 230  0030 1e01          	ldw	x,(OFST+1,sp)
 231  0032 6f01          	clr	(1,x)
 232                     ; 187 }
 235  0034 85            	popw	x
 236  0035 81            	ret
 482                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 482                     ; 225               uint32_t DMA_Memory0BaseAddr,
 482                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 482                     ; 227               uint8_t DMA_BufferSize,
 482                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 482                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 482                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 482                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 482                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 482                     ; 233 {
 483                     	switch	.text
 484  0036               _DMA_Init:
 486  0036 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 492                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 494                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 496                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 498                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 500                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 502                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 504  0037 f6            	ld	a,(x)
 505  0038 a4fe          	and	a,#254
 506  003a f7            	ld	(x),a
 507                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 509  003b 7f            	clr	(x)
 510                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 510                     ; 251                                            (uint8_t)DMA_Mode) | \
 510                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 512  003c 7b0c          	ld	a,(OFST+12,sp)
 513  003e 1a0d          	or	a,(OFST+13,sp)
 514  0040 1a0e          	or	a,(OFST+14,sp)
 515  0042 fa            	or	a,(x)
 516  0043 f7            	ld	(x),a
 517                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 519  0044 e601          	ld	a,(1,x)
 520  0046 a4c7          	and	a,#199
 521  0048 e701          	ld	(1,x),a
 522                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 522                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 524  004a 7b0f          	ld	a,(OFST+15,sp)
 525  004c 1a10          	or	a,(OFST+16,sp)
 526  004e ea01          	or	a,(1,x)
 527  0050 e701          	ld	(1,x),a
 528                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 530  0052 7b0b          	ld	a,(OFST+11,sp)
 531  0054 1e01          	ldw	x,(OFST+1,sp)
 532  0056 e702          	ld	(2,x),a
 533                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 535  0058 7b09          	ld	a,(OFST+9,sp)
 536  005a 1e01          	ldw	x,(OFST+1,sp)
 537  005c e703          	ld	(3,x),a
 538                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 540  005e 7b0a          	ld	a,(OFST+10,sp)
 541  0060 1e01          	ldw	x,(OFST+1,sp)
 542  0062 e704          	ld	(4,x),a
 543                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 545  0064 1e01          	ldw	x,(OFST+1,sp)
 546  0066 a35093        	cpw	x,#20627
 547  0069 2606          	jrne	L742
 548                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 550  006b 7b06          	ld	a,(OFST+6,sp)
 551  006d 1e01          	ldw	x,(OFST+1,sp)
 552  006f e705          	ld	(5,x),a
 553  0071               L742:
 554                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 556  0071 7b07          	ld	a,(OFST+7,sp)
 557  0073 1e01          	ldw	x,(OFST+1,sp)
 558  0075 e706          	ld	(6,x),a
 559                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 561  0077 7b08          	ld	a,(OFST+8,sp)
 562  0079 1e01          	ldw	x,(OFST+1,sp)
 563  007b e707          	ld	(7,x),a
 564                     ; 280 }
 567  007d 85            	popw	x
 568  007e 81            	ret
 623                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 623                     ; 289 {
 624                     	switch	.text
 625  007f               _DMA_GlobalCmd:
 629                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 293   if (NewState != DISABLE)
 633  007f 4d            	tnz	a
 634  0080 2706          	jreq	L772
 635                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 637  0082 72105070      	bset	20592,#0
 639  0086 2004          	jra	L103
 640  0088               L772:
 641                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 643  0088 72115070      	bres	20592,#0
 644  008c               L103:
 645                     ; 303 }
 648  008c 81            	ret
 695                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 695                     ; 315 {
 696                     	switch	.text
 697  008d               _DMA_Cmd:
 699  008d 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 705                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 320   if (NewState != DISABLE)
 709  008e 0d05          	tnz	(OFST+5,sp)
 710  0090 2706          	jreq	L723
 711                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 713  0092 f6            	ld	a,(x)
 714  0093 aa01          	or	a,#1
 715  0095 f7            	ld	(x),a
 717  0096 2006          	jra	L133
 718  0098               L723:
 719                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 721  0098 1e01          	ldw	x,(OFST+1,sp)
 722  009a f6            	ld	a,(x)
 723  009b a4fe          	and	a,#254
 724  009d f7            	ld	(x),a
 725  009e               L133:
 726                     ; 330 }
 729  009e 85            	popw	x
 730  009f 81            	ret
 764                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 764                     ; 343 {
 765                     	switch	.text
 766  00a0               _DMA_SetTimeOut:
 770                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 772                     ; 348   DMA1->GCSR = 0;
 774  00a0 725f5070      	clr	20592
 775                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 777  00a4 48            	sll	a
 778  00a5 48            	sll	a
 779  00a6 c75070        	ld	20592,a
 780                     ; 351 }
 783  00a9 81            	ret
 830                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 830                     ; 402 {
 831                     	switch	.text
 832  00aa               _DMA_SetCurrDataCounter:
 834  00aa 89            	pushw	x
 835       00000000      OFST:	set	0
 838                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 840                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 842  00ab 7b05          	ld	a,(OFST+5,sp)
 843  00ad 1e01          	ldw	x,(OFST+1,sp)
 844  00af e702          	ld	(2,x),a
 845                     ; 408 }
 848  00b1 85            	popw	x
 849  00b2 81            	ret
 887                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 887                     ; 416 {
 888                     	switch	.text
 889  00b3               _DMA_GetCurrDataCounter:
 893                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 895                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 897  00b3 e602          	ld	a,(2,x)
 900  00b5 81            	ret
 977                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 977                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 977                     ; 484                   FunctionalState NewState)
 977                     ; 485 {
 978                     	switch	.text
 979  00b6               _DMA_ITConfig:
 981  00b6 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 987                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 989                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 991                     ; 491   if (NewState != DISABLE)
 993  00b7 0d06          	tnz	(OFST+6,sp)
 994  00b9 2706          	jreq	L554
 995                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 997  00bb f6            	ld	a,(x)
 998  00bc 1a05          	or	a,(OFST+5,sp)
 999  00be f7            	ld	(x),a
1001  00bf 2007          	jra	L754
1002  00c1               L554:
1003                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1005  00c1 1e01          	ldw	x,(OFST+1,sp)
1006  00c3 7b05          	ld	a,(OFST+5,sp)
1007  00c5 43            	cpl	a
1008  00c6 f4            	and	a,(x)
1009  00c7 f7            	ld	(x),a
1010  00c8               L754:
1011                     ; 501 }
1014  00c8 85            	popw	x
1015  00c9 81            	ret
1264                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1264                     ; 531 {
1265                     	switch	.text
1266  00ca               _DMA_GetFlagStatus:
1268  00ca 89            	pushw	x
1269  00cb 5204          	subw	sp,#4
1270       00000004      OFST:	set	4
1273                     ; 532   FlagStatus flagstatus = RESET;
1275                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1277                     ; 534   uint8_t tmpgir1 = 0;
1279                     ; 535   uint8_t tmpgcsr = 0;
1281                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1283                     ; 541   tmpgcsr = DMA1->GCSR;
1285  00cd c65070        	ld	a,20592
1286  00d0 6b04          	ld	(OFST+0,sp),a
1288                     ; 542   tmpgir1 = DMA1->GIR1;
1290  00d2 c65071        	ld	a,20593
1291  00d5 6b01          	ld	(OFST-3,sp),a
1293                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1295  00d7 01            	rrwa	x,a
1296  00d8 9f            	ld	a,xl
1297  00d9 a40f          	and	a,#15
1298  00db 97            	ld	xl,a
1299  00dc 4f            	clr	a
1300  00dd 02            	rlwa	x,a
1301  00de 5d            	tnzw	x
1302  00df 2736          	jreq	L706
1303                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1305  00e1 7b05          	ld	a,(OFST+1,sp)
1306  00e3 a501          	bcp	a,#1
1307  00e5 2707          	jreq	L116
1308                     ; 549       DMA_Channelx = DMA1_Channel0;
1310  00e7 ae5075        	ldw	x,#20597
1311  00ea 1f02          	ldw	(OFST-2,sp),x
1314  00ec 201f          	jra	L316
1315  00ee               L116:
1316                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1318  00ee 7b05          	ld	a,(OFST+1,sp)
1319  00f0 a502          	bcp	a,#2
1320  00f2 2707          	jreq	L516
1321                     ; 553       DMA_Channelx = DMA1_Channel1;
1323  00f4 ae507f        	ldw	x,#20607
1324  00f7 1f02          	ldw	(OFST-2,sp),x
1327  00f9 2012          	jra	L316
1328  00fb               L516:
1329                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1331  00fb 7b05          	ld	a,(OFST+1,sp)
1332  00fd a504          	bcp	a,#4
1333  00ff 2707          	jreq	L126
1334                     ; 557       DMA_Channelx = DMA1_Channel2;
1336  0101 ae5089        	ldw	x,#20617
1337  0104 1f02          	ldw	(OFST-2,sp),x
1340  0106 2005          	jra	L316
1341  0108               L126:
1342                     ; 561       DMA_Channelx = DMA1_Channel3;
1344  0108 ae5093        	ldw	x,#20627
1345  010b 1f02          	ldw	(OFST-2,sp),x
1347  010d               L316:
1348                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1350  010d 1e02          	ldw	x,(OFST-2,sp)
1351  010f e601          	ld	a,(1,x)
1352  0111 1406          	and	a,(OFST+2,sp)
1353  0113 6b04          	ld	(OFST+0,sp),a
1356  0115 2014          	jra	L526
1357  0117               L706:
1358                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1360  0117 7b05          	ld	a,(OFST+1,sp)
1361  0119 a510          	bcp	a,#16
1362  011b 2708          	jreq	L726
1363                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1365  011d 7b06          	ld	a,(OFST+2,sp)
1366  011f 1401          	and	a,(OFST-3,sp)
1367  0121 6b04          	ld	(OFST+0,sp),a
1370  0123 2006          	jra	L526
1371  0125               L726:
1372                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1374  0125 7b04          	ld	a,(OFST+0,sp)
1375  0127 a402          	and	a,#2
1376  0129 6b04          	ld	(OFST+0,sp),a
1378  012b               L526:
1379                     ; 579   return (flagstatus);
1381  012b 7b04          	ld	a,(OFST+0,sp)
1384  012d 5b06          	addw	sp,#6
1385  012f 81            	ret
1432                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1432                     ; 598 {
1433                     	switch	.text
1434  0130               _DMA_ClearFlag:
1436  0130 89            	pushw	x
1437  0131 89            	pushw	x
1438       00000002      OFST:	set	2
1441                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1443                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1445                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1447  0132 01            	rrwa	x,a
1448  0133 9f            	ld	a,xl
1449  0134 a401          	and	a,#1
1450  0136 97            	ld	xl,a
1451  0137 4f            	clr	a
1452  0138 02            	rlwa	x,a
1453  0139 5d            	tnzw	x
1454  013a 2707          	jreq	L756
1455                     ; 607     DMA_Channelx = DMA1_Channel0;
1457  013c ae5075        	ldw	x,#20597
1458  013f 1f01          	ldw	(OFST-1,sp),x
1461  0141 201f          	jra	L166
1462  0143               L756:
1463                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1465  0143 7b03          	ld	a,(OFST+1,sp)
1466  0145 a502          	bcp	a,#2
1467  0147 2707          	jreq	L366
1468                     ; 613       DMA_Channelx = DMA1_Channel1;
1470  0149 ae507f        	ldw	x,#20607
1471  014c 1f01          	ldw	(OFST-1,sp),x
1474  014e 2012          	jra	L166
1475  0150               L366:
1476                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1478  0150 7b03          	ld	a,(OFST+1,sp)
1479  0152 a504          	bcp	a,#4
1480  0154 2707          	jreq	L766
1481                     ; 619         DMA_Channelx = DMA1_Channel2;
1483  0156 ae5089        	ldw	x,#20617
1484  0159 1f01          	ldw	(OFST-1,sp),x
1487  015b 2005          	jra	L166
1488  015d               L766:
1489                     ; 623         DMA_Channelx = DMA1_Channel3;
1491  015d ae5093        	ldw	x,#20627
1492  0160 1f01          	ldw	(OFST-1,sp),x
1494  0162               L166:
1495                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1497  0162 1e01          	ldw	x,(OFST-1,sp)
1498  0164 7b04          	ld	a,(OFST+2,sp)
1499  0166 a406          	and	a,#6
1500  0168 43            	cpl	a
1501  0169 e401          	and	a,(1,x)
1502  016b e701          	ld	(1,x),a
1503                     ; 630 }
1506  016d 5b04          	addw	sp,#4
1507  016f 81            	ret
1645                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1645                     ; 647 {
1646                     	switch	.text
1647  0170               _DMA_GetITStatus:
1649  0170 88            	push	a
1650  0171 5204          	subw	sp,#4
1651       00000004      OFST:	set	4
1654                     ; 648   ITStatus itstatus = RESET;
1656                     ; 649   uint8_t tmpreg = 0;
1658                     ; 650   uint8_t tmp2 = 0;
1660                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1662                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1664                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1666  0173 a510          	bcp	a,#16
1667  0175 2707          	jreq	L757
1668                     ; 659     DMA_Channelx = DMA1_Channel0;
1670  0177 ae5075        	ldw	x,#20597
1671  017a 1f03          	ldw	(OFST-1,sp),x
1674  017c 201f          	jra	L167
1675  017e               L757:
1676                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1678  017e 7b05          	ld	a,(OFST+1,sp)
1679  0180 a520          	bcp	a,#32
1680  0182 2707          	jreq	L367
1681                     ; 665       DMA_Channelx = DMA1_Channel1;
1683  0184 ae507f        	ldw	x,#20607
1684  0187 1f03          	ldw	(OFST-1,sp),x
1687  0189 2012          	jra	L167
1688  018b               L367:
1689                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1691  018b 7b05          	ld	a,(OFST+1,sp)
1692  018d a540          	bcp	a,#64
1693  018f 2707          	jreq	L767
1694                     ; 671         DMA_Channelx = DMA1_Channel2;
1696  0191 ae5089        	ldw	x,#20617
1697  0194 1f03          	ldw	(OFST-1,sp),x
1700  0196 2005          	jra	L167
1701  0198               L767:
1702                     ; 675         DMA_Channelx = DMA1_Channel3;
1704  0198 ae5093        	ldw	x,#20627
1705  019b 1f03          	ldw	(OFST-1,sp),x
1707  019d               L167:
1708                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1710  019d 1e03          	ldw	x,(OFST-1,sp)
1711  019f e601          	ld	a,(1,x)
1712  01a1 6b01          	ld	(OFST-3,sp),a
1714                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1716  01a3 1e03          	ldw	x,(OFST-1,sp)
1717  01a5 7b01          	ld	a,(OFST-3,sp)
1718  01a7 f4            	and	a,(x)
1719  01a8 6b01          	ld	(OFST-3,sp),a
1721                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1723  01aa 7b05          	ld	a,(OFST+1,sp)
1724  01ac a406          	and	a,#6
1725  01ae 6b02          	ld	(OFST-2,sp),a
1727                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1729  01b0 7b01          	ld	a,(OFST-3,sp)
1730  01b2 1402          	and	a,(OFST-2,sp)
1731  01b4 6b02          	ld	(OFST-2,sp),a
1733                     ; 686   return (itstatus);
1735  01b6 7b02          	ld	a,(OFST-2,sp)
1738  01b8 5b05          	addw	sp,#5
1739  01ba 81            	ret
1787                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1787                     ; 705 {
1788                     	switch	.text
1789  01bb               _DMA_ClearITPendingBit:
1791  01bb 88            	push	a
1792  01bc 89            	pushw	x
1793       00000002      OFST:	set	2
1796                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1798                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1800                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1802  01bd a510          	bcp	a,#16
1803  01bf 2707          	jreq	L7101
1804                     ; 713     DMA_Channelx = DMA1_Channel0;
1806  01c1 ae5075        	ldw	x,#20597
1807  01c4 1f01          	ldw	(OFST-1,sp),x
1810  01c6 201f          	jra	L1201
1811  01c8               L7101:
1812                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1814  01c8 7b03          	ld	a,(OFST+1,sp)
1815  01ca a520          	bcp	a,#32
1816  01cc 2707          	jreq	L3201
1817                     ; 719       DMA_Channelx = DMA1_Channel1;
1819  01ce ae507f        	ldw	x,#20607
1820  01d1 1f01          	ldw	(OFST-1,sp),x
1823  01d3 2012          	jra	L1201
1824  01d5               L3201:
1825                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1827  01d5 7b03          	ld	a,(OFST+1,sp)
1828  01d7 a540          	bcp	a,#64
1829  01d9 2707          	jreq	L7201
1830                     ; 725         DMA_Channelx = DMA1_Channel2;
1832  01db ae5089        	ldw	x,#20617
1833  01de 1f01          	ldw	(OFST-1,sp),x
1836  01e0 2005          	jra	L1201
1837  01e2               L7201:
1838                     ; 729         DMA_Channelx = DMA1_Channel3;
1840  01e2 ae5093        	ldw	x,#20627
1841  01e5 1f01          	ldw	(OFST-1,sp),x
1843  01e7               L1201:
1844                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1846  01e7 1e01          	ldw	x,(OFST-1,sp)
1847  01e9 7b03          	ld	a,(OFST+1,sp)
1848  01eb a406          	and	a,#6
1849  01ed 43            	cpl	a
1850  01ee e401          	and	a,(1,x)
1851  01f0 e701          	ld	(1,x),a
1852                     ; 735 }
1855  01f2 5b03          	addw	sp,#3
1856  01f4 81            	ret
1869                     	xdef	_DMA_ClearITPendingBit
1870                     	xdef	_DMA_GetITStatus
1871                     	xdef	_DMA_ClearFlag
1872                     	xdef	_DMA_GetFlagStatus
1873                     	xdef	_DMA_ITConfig
1874                     	xdef	_DMA_GetCurrDataCounter
1875                     	xdef	_DMA_SetCurrDataCounter
1876                     	xdef	_DMA_SetTimeOut
1877                     	xdef	_DMA_Cmd
1878                     	xdef	_DMA_GlobalCmd
1879                     	xdef	_DMA_Init
1880                     	xdef	_DMA_DeInit
1881                     	xdef	_DMA_GlobalDeInit
1900                     	end
