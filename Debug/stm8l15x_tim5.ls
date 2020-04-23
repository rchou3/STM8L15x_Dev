   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 168 void TIM5_DeInit(void)
  43                     ; 169 {
  45                     	switch	.text
  46  0000               _TIM5_DeInit:
  50                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5302      	clr	21250
  59                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5303      	clr	21251
  62                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5305      	clr	21253
  65                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5307      	clr	21255
  68                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f530b      	clr	21259
  71                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  73  001c 35015309      	mov	21257,#1
  74                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  76  0020 3501530a      	mov	21258,#1
  77                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f530b      	clr	21259
  80                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5309      	clr	21257
  83                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f530a      	clr	21258
  86                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f530d      	clr	21261
  92                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f530e      	clr	21262
  95                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff530f      	mov	21263,#255
  98                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff5310      	mov	21264,#255
 101                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5316      	clr	21270
 116                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 118  0058 35015308      	mov	21256,#1
 119                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5315      	clr	21269
 122                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5306      	clr	21254
 125                     ; 206 }
 128  0064 81            	ret
 290                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 290                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 290                     ; 233                        uint16_t TIM5_Period)
 290                     ; 234 {
 291                     	switch	.text
 292  0065               _TIM5_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 300                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 302                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7530f        	ld	21263,a
 306                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c75310        	ld	21264,a
 310                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7530e        	ld	21262,a
 314                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65300        	ld	a,21248
 317  0077 a48f          	and	a,#143
 318  0079 c75300        	ld	21248,a
 319                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5300        	or	a,21248
 323  0080 c75300        	ld	21248,a
 324                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 326  0083 35015308      	mov	21256,#1
 327                     ; 254 }
 330  0087 85            	popw	x
 331  0088 81            	ret
 399                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 399                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 399                     ; 276 {
 400                     	switch	.text
 401  0089               _TIM5_PrescalerConfig:
 405                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 407                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 409                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 411  0089 9e            	ld	a,xh
 412  008a c7530e        	ld	21262,a
 413                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 415  008d 9f            	ld	a,xl
 416  008e a101          	cp	a,#1
 417  0090 2606          	jrne	L741
 418                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 420  0092 72105308      	bset	21256,#0
 422  0096 2004          	jra	L151
 423  0098               L741:
 424                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 426  0098 72115308      	bres	21256,#0
 427  009c               L151:
 428                     ; 293 }
 431  009c 81            	ret
 476                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 476                     ; 307 {
 477                     	switch	.text
 478  009d               _TIM5_CounterModeConfig:
 480  009d 88            	push	a
 481  009e 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 308   uint8_t tmpcr1 = 0;
 487                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 489                     ; 313   tmpcr1 = TIM5->CR1;
 491  009f c65300        	ld	a,21248
 492  00a2 6b01          	ld	(OFST+0,sp),a
 494                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 496  00a4 7b01          	ld	a,(OFST+0,sp)
 497  00a6 a48f          	and	a,#143
 498  00a8 6b01          	ld	(OFST+0,sp),a
 500                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 502  00aa 7b01          	ld	a,(OFST+0,sp)
 503  00ac 1a02          	or	a,(OFST+1,sp)
 504  00ae 6b01          	ld	(OFST+0,sp),a
 506                     ; 321   TIM5->CR1 = tmpcr1;
 508  00b0 7b01          	ld	a,(OFST+0,sp)
 509  00b2 c75300        	ld	21248,a
 510                     ; 322 }
 513  00b5 85            	popw	x
 514  00b6 81            	ret
 548                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 548                     ; 331 {
 549                     	switch	.text
 550  00b7               _TIM5_SetCounter:
 554                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 556  00b7 9e            	ld	a,xh
 557  00b8 c7530c        	ld	21260,a
 558                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 560  00bb 9f            	ld	a,xl
 561  00bc c7530d        	ld	21261,a
 562                     ; 336 }
 565  00bf 81            	ret
 599                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 599                     ; 345 {
 600                     	switch	.text
 601  00c0               _TIM5_SetAutoreload:
 605                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 607  00c0 9e            	ld	a,xh
 608  00c1 c7530f        	ld	21263,a
 609                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 611  00c4 9f            	ld	a,xl
 612  00c5 c75310        	ld	21264,a
 613                     ; 349 }
 616  00c8 81            	ret
 668                     ; 356 uint16_t TIM5_GetCounter(void)
 668                     ; 357 {
 669                     	switch	.text
 670  00c9               _TIM5_GetCounter:
 672  00c9 5204          	subw	sp,#4
 673       00000004      OFST:	set	4
 676                     ; 358   uint16_t tmpcnt = 0;
 678                     ; 361   tmpcntrh = TIM5->CNTRH;
 680  00cb c6530c        	ld	a,21260
 681  00ce 6b02          	ld	(OFST-2,sp),a
 683                     ; 362   tmpcntrl = TIM5->CNTRL;
 685  00d0 c6530d        	ld	a,21261
 686  00d3 6b01          	ld	(OFST-3,sp),a
 688                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 690  00d5 7b01          	ld	a,(OFST-3,sp)
 691  00d7 5f            	clrw	x
 692  00d8 97            	ld	xl,a
 693  00d9 1f03          	ldw	(OFST-1,sp),x
 695                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 697  00db 7b02          	ld	a,(OFST-2,sp)
 698  00dd 5f            	clrw	x
 699  00de 97            	ld	xl,a
 700  00df 4f            	clr	a
 701  00e0 02            	rlwa	x,a
 702  00e1 01            	rrwa	x,a
 703  00e2 1a04          	or	a,(OFST+0,sp)
 704  00e4 01            	rrwa	x,a
 705  00e5 1a03          	or	a,(OFST-1,sp)
 706  00e7 01            	rrwa	x,a
 707  00e8 1f03          	ldw	(OFST-1,sp),x
 709                     ; 367   return ((uint16_t)tmpcnt);
 711  00ea 1e03          	ldw	x,(OFST-1,sp)
 714  00ec 5b04          	addw	sp,#4
 715  00ee 81            	ret
 739                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 739                     ; 384 {
 740                     	switch	.text
 741  00ef               _TIM5_GetPrescaler:
 745                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 747  00ef c6530e        	ld	a,21262
 750  00f2 81            	ret
 806                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 806                     ; 397 {
 807                     	switch	.text
 808  00f3               _TIM5_UpdateDisableConfig:
 812                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 814                     ; 402   if (NewState != DISABLE)
 816  00f3 4d            	tnz	a
 817  00f4 2706          	jreq	L513
 818                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 820  00f6 72125300      	bset	21248,#1
 822  00fa 2004          	jra	L713
 823  00fc               L513:
 824                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 826  00fc 72135300      	bres	21248,#1
 827  0100               L713:
 828                     ; 410 }
 831  0100 81            	ret
 889                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 889                     ; 421 {
 890                     	switch	.text
 891  0101               _TIM5_UpdateRequestConfig:
 895                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 897                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 899  0101 a101          	cp	a,#1
 900  0103 2606          	jrne	L743
 901                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 903  0105 72145300      	bset	21248,#2
 905  0109 2004          	jra	L153
 906  010b               L743:
 907                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 909  010b 72155300      	bres	21248,#2
 910  010f               L153:
 911                     ; 434 }
 914  010f 81            	ret
 950                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 950                     ; 443 {
 951                     	switch	.text
 952  0110               _TIM5_ARRPreloadConfig:
 956                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 958                     ; 448   if (NewState != DISABLE)
 960  0110 4d            	tnz	a
 961  0111 2706          	jreq	L173
 962                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 964  0113 721e5300      	bset	21248,#7
 966  0117 2004          	jra	L373
 967  0119               L173:
 968                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 970  0119 721f5300      	bres	21248,#7
 971  011d               L373:
 972                     ; 456 }
 975  011d 81            	ret
1032                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1032                     ; 467 {
1033                     	switch	.text
1034  011e               _TIM5_SelectOnePulseMode:
1038                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1040                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1042  011e a101          	cp	a,#1
1043  0120 2606          	jrne	L324
1044                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1046  0122 72165300      	bset	21248,#3
1048  0126 2004          	jra	L524
1049  0128               L324:
1050                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1052  0128 72175300      	bres	21248,#3
1053  012c               L524:
1054                     ; 480 }
1057  012c 81            	ret
1092                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1092                     ; 489 {
1093                     	switch	.text
1094  012d               _TIM5_Cmd:
1098                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1100                     ; 494   if (NewState != DISABLE)
1102  012d 4d            	tnz	a
1103  012e 2706          	jreq	L544
1104                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1106  0130 72105300      	bset	21248,#0
1108  0134 2004          	jra	L744
1109  0136               L544:
1110                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1112  0136 72115300      	bres	21248,#0
1113  013a               L744:
1114                     ; 502 }
1117  013a 81            	ret
1315                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1315                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1315                     ; 580                   uint16_t TIM5_Pulse,
1315                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1315                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1315                     ; 583 {
1316                     	switch	.text
1317  013b               _TIM5_OC1Init:
1319  013b 89            	pushw	x
1320  013c 88            	push	a
1321       00000001      OFST:	set	1
1324                     ; 584   uint8_t tmpccmr1 = 0;
1326                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1328                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1330                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1332                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1334                     ; 592   tmpccmr1 = TIM5->CCMR1;
1336  013d c65309        	ld	a,21257
1337  0140 6b01          	ld	(OFST+0,sp),a
1339                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1341  0142 7211530b      	bres	21259,#0
1342                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1344  0146 7b01          	ld	a,(OFST+0,sp)
1345  0148 a48f          	and	a,#143
1346  014a 6b01          	ld	(OFST+0,sp),a
1348                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1350  014c 9e            	ld	a,xh
1351  014d 1a01          	or	a,(OFST+0,sp)
1352  014f 6b01          	ld	(OFST+0,sp),a
1354                     ; 602   TIM5->CCMR1 = tmpccmr1;
1356  0151 7b01          	ld	a,(OFST+0,sp)
1357  0153 c75309        	ld	21257,a
1358                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1360  0156 9f            	ld	a,xl
1361  0157 a101          	cp	a,#1
1362  0159 2606          	jrne	L365
1363                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1365  015b 7210530b      	bset	21259,#0
1367  015f 2004          	jra	L565
1368  0161               L365:
1369                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1371  0161 7211530b      	bres	21259,#0
1372  0165               L565:
1373                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1375  0165 7b08          	ld	a,(OFST+7,sp)
1376  0167 a101          	cp	a,#1
1377  0169 2606          	jrne	L765
1378                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1380  016b 7212530b      	bset	21259,#1
1382  016f 2004          	jra	L175
1383  0171               L765:
1384                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1386  0171 7213530b      	bres	21259,#1
1387  0175               L175:
1388                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1390  0175 7b09          	ld	a,(OFST+8,sp)
1391  0177 a101          	cp	a,#1
1392  0179 2606          	jrne	L375
1393                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1395  017b 72105316      	bset	21270,#0
1397  017f 2004          	jra	L575
1398  0181               L375:
1399                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1401  0181 72115316      	bres	21270,#0
1402  0185               L575:
1403                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1405  0185 7b06          	ld	a,(OFST+5,sp)
1406  0187 c75311        	ld	21265,a
1407                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1409  018a 7b07          	ld	a,(OFST+6,sp)
1410  018c c75312        	ld	21266,a
1411                     ; 637 }
1414  018f 5b03          	addw	sp,#3
1415  0191 81            	ret
1498                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1498                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1498                     ; 666                   uint16_t TIM5_Pulse,
1498                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1498                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1498                     ; 669 {
1499                     	switch	.text
1500  0192               _TIM5_OC2Init:
1502  0192 89            	pushw	x
1503  0193 88            	push	a
1504       00000001      OFST:	set	1
1507                     ; 670   uint8_t tmpccmr2 = 0;
1509                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1511                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1513                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1515                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1517                     ; 678   tmpccmr2 = TIM5->CCMR2;
1519  0194 c6530a        	ld	a,21258
1520  0197 6b01          	ld	(OFST+0,sp),a
1522                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1524  0199 7219530b      	bres	21259,#4
1525                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1527  019d 7b01          	ld	a,(OFST+0,sp)
1528  019f a48f          	and	a,#143
1529  01a1 6b01          	ld	(OFST+0,sp),a
1531                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1533  01a3 9e            	ld	a,xh
1534  01a4 1a01          	or	a,(OFST+0,sp)
1535  01a6 6b01          	ld	(OFST+0,sp),a
1537                     ; 689   TIM5->CCMR2 = tmpccmr2;
1539  01a8 7b01          	ld	a,(OFST+0,sp)
1540  01aa c7530a        	ld	21258,a
1541                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1543  01ad 9f            	ld	a,xl
1544  01ae a101          	cp	a,#1
1545  01b0 2606          	jrne	L146
1546                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1548  01b2 7218530b      	bset	21259,#4
1550  01b6 2004          	jra	L346
1551  01b8               L146:
1552                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1554  01b8 7219530b      	bres	21259,#4
1555  01bc               L346:
1556                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1558  01bc 7b08          	ld	a,(OFST+7,sp)
1559  01be a101          	cp	a,#1
1560  01c0 2606          	jrne	L546
1561                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1563  01c2 721a530b      	bset	21259,#5
1565  01c6 2004          	jra	L746
1566  01c8               L546:
1567                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1569  01c8 721b530b      	bres	21259,#5
1570  01cc               L746:
1571                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1573  01cc 7b09          	ld	a,(OFST+8,sp)
1574  01ce a101          	cp	a,#1
1575  01d0 2606          	jrne	L156
1576                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1578  01d2 72145316      	bset	21270,#2
1580  01d6 2004          	jra	L356
1581  01d8               L156:
1582                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1584  01d8 72155316      	bres	21270,#2
1585  01dc               L356:
1586                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1588  01dc 7b06          	ld	a,(OFST+5,sp)
1589  01de c75313        	ld	21267,a
1590                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1592  01e1 7b07          	ld	a,(OFST+6,sp)
1593  01e3 c75314        	ld	21268,a
1594                     ; 725 }
1597  01e6 5b03          	addw	sp,#3
1598  01e8 81            	ret
1796                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1796                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1796                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1796                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1796                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1796                     ; 759 
1796                     ; 760 {
1797                     	switch	.text
1798  01e9               _TIM5_BKRConfig:
1800  01e9 89            	pushw	x
1801  01ea 88            	push	a
1802       00000001      OFST:	set	1
1805                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1807                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1809                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1811                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1813                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1815                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1815                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1815                     ; 774                                   TIM5_AutomaticOutput));
1817  01eb 7b06          	ld	a,(OFST+5,sp)
1818  01ed 1a07          	or	a,(OFST+6,sp)
1819  01ef 6b01          	ld	(OFST+0,sp),a
1821  01f1 9f            	ld	a,xl
1822  01f2 1a02          	or	a,(OFST+1,sp)
1823  01f4 1a01          	or	a,(OFST+0,sp)
1824  01f6 1a08          	or	a,(OFST+7,sp)
1825  01f8 c75315        	ld	21269,a
1826                     ; 775 }
1829  01fb 5b03          	addw	sp,#3
1830  01fd 81            	ret
1866                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1866                     ; 784 {
1867                     	switch	.text
1868  01fe               _TIM5_CtrlPWMOutputs:
1872                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1874                     ; 790   if (NewState != DISABLE)
1876  01fe 4d            	tnz	a
1877  01ff 2706          	jreq	L5001
1878                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1880  0201 721e5315      	bset	21269,#7
1882  0205 2004          	jra	L7001
1883  0207               L5001:
1884                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1886  0207 721f5315      	bres	21269,#7
1887  020b               L7001:
1888                     ; 798 }
1891  020b 81            	ret
1956                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1956                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1956                     ; 820 {
1957                     	switch	.text
1958  020c               _TIM5_SelectOCxM:
1960  020c 89            	pushw	x
1961       00000000      OFST:	set	0
1964                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1966                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1968                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1970  020d 9e            	ld	a,xh
1971  020e 4d            	tnz	a
1972  020f 2615          	jrne	L3401
1973                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1975  0211 7211530b      	bres	21259,#0
1976                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1978  0215 c65309        	ld	a,21257
1979  0218 a48f          	and	a,#143
1980  021a c75309        	ld	21257,a
1981                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1983  021d 9f            	ld	a,xl
1984  021e ca5309        	or	a,21257
1985  0221 c75309        	ld	21257,a
1987  0224 2014          	jra	L5401
1988  0226               L3401:
1989                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1991  0226 7219530b      	bres	21259,#4
1992                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1994  022a c6530a        	ld	a,21258
1995  022d a48f          	and	a,#143
1996  022f c7530a        	ld	21258,a
1997                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1999  0232 c6530a        	ld	a,21258
2000  0235 1a02          	or	a,(OFST+2,sp)
2001  0237 c7530a        	ld	21258,a
2002  023a               L5401:
2003                     ; 847 }
2006  023a 85            	popw	x
2007  023b 81            	ret
2041                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2041                     ; 856 {
2042                     	switch	.text
2043  023c               _TIM5_SetCompare1:
2047                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2049  023c 9e            	ld	a,xh
2050  023d c75311        	ld	21265,a
2051                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2053  0240 9f            	ld	a,xl
2054  0241 c75312        	ld	21266,a
2055                     ; 860 }
2058  0244 81            	ret
2092                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2092                     ; 869 {
2093                     	switch	.text
2094  0245               _TIM5_SetCompare2:
2098                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2100  0245 9e            	ld	a,xh
2101  0246 c75313        	ld	21267,a
2102                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2104  0249 9f            	ld	a,xl
2105  024a c75314        	ld	21268,a
2106                     ; 873 }
2109  024d 81            	ret
2176                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2176                     ; 884 {
2177                     	switch	.text
2178  024e               _TIM5_ForcedOC1Config:
2180  024e 88            	push	a
2181  024f 88            	push	a
2182       00000001      OFST:	set	1
2185                     ; 885   uint8_t tmpccmr1 = 0;
2187                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2189                     ; 890   tmpccmr1 = TIM5->CCMR1;
2191  0250 c65309        	ld	a,21257
2192  0253 6b01          	ld	(OFST+0,sp),a
2194                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2196  0255 7b01          	ld	a,(OFST+0,sp)
2197  0257 a48f          	and	a,#143
2198  0259 6b01          	ld	(OFST+0,sp),a
2200                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2202  025b 7b01          	ld	a,(OFST+0,sp)
2203  025d 1a02          	or	a,(OFST+1,sp)
2204  025f 6b01          	ld	(OFST+0,sp),a
2206                     ; 898   TIM5->CCMR1 = tmpccmr1;
2208  0261 7b01          	ld	a,(OFST+0,sp)
2209  0263 c75309        	ld	21257,a
2210                     ; 899 }
2213  0266 85            	popw	x
2214  0267 81            	ret
2259                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2259                     ; 910 {
2260                     	switch	.text
2261  0268               _TIM5_ForcedOC2Config:
2263  0268 88            	push	a
2264  0269 88            	push	a
2265       00000001      OFST:	set	1
2268                     ; 911   uint8_t tmpccmr2 = 0;
2270                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2272                     ; 916   tmpccmr2 = TIM5->CCMR2;
2274  026a c6530a        	ld	a,21258
2275  026d 6b01          	ld	(OFST+0,sp),a
2277                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2279  026f 7b01          	ld	a,(OFST+0,sp)
2280  0271 a48f          	and	a,#143
2281  0273 6b01          	ld	(OFST+0,sp),a
2283                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2285  0275 7b01          	ld	a,(OFST+0,sp)
2286  0277 1a02          	or	a,(OFST+1,sp)
2287  0279 6b01          	ld	(OFST+0,sp),a
2289                     ; 924   TIM5->CCMR2 = tmpccmr2;
2291  027b 7b01          	ld	a,(OFST+0,sp)
2292  027d c7530a        	ld	21258,a
2293                     ; 925 }
2296  0280 85            	popw	x
2297  0281 81            	ret
2333                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2333                     ; 934 {
2334                     	switch	.text
2335  0282               _TIM5_OC1PreloadConfig:
2339                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2341                     ; 939   if (NewState != DISABLE)
2343  0282 4d            	tnz	a
2344  0283 2706          	jreq	L5711
2345                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2347  0285 72165309      	bset	21257,#3
2349  0289 2004          	jra	L7711
2350  028b               L5711:
2351                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2353  028b 72175309      	bres	21257,#3
2354  028f               L7711:
2355                     ; 947 }
2358  028f 81            	ret
2394                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2394                     ; 956 {
2395                     	switch	.text
2396  0290               _TIM5_OC2PreloadConfig:
2400                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2402                     ; 961   if (NewState != DISABLE)
2404  0290 4d            	tnz	a
2405  0291 2706          	jreq	L7121
2406                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2408  0293 7216530a      	bset	21258,#3
2410  0297 2004          	jra	L1221
2411  0299               L7121:
2412                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2414  0299 7217530a      	bres	21258,#3
2415  029d               L1221:
2416                     ; 969 }
2419  029d 81            	ret
2454                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2454                     ; 978 {
2455                     	switch	.text
2456  029e               _TIM5_OC1FastConfig:
2460                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2462                     ; 983   if (NewState != DISABLE)
2464  029e 4d            	tnz	a
2465  029f 2706          	jreq	L1421
2466                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2468  02a1 72145309      	bset	21257,#2
2470  02a5 2004          	jra	L3421
2471  02a7               L1421:
2472                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2474  02a7 72155309      	bres	21257,#2
2475  02ab               L3421:
2476                     ; 991 }
2479  02ab 81            	ret
2514                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2514                     ; 1001 {
2515                     	switch	.text
2516  02ac               _TIM5_OC2FastConfig:
2520                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2522                     ; 1006   if (NewState != DISABLE)
2524  02ac 4d            	tnz	a
2525  02ad 2706          	jreq	L3621
2526                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2528  02af 7214530a      	bset	21258,#2
2530  02b3 2004          	jra	L5621
2531  02b5               L3621:
2532                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2534  02b5 7215530a      	bres	21258,#2
2535  02b9               L5621:
2536                     ; 1014 }
2539  02b9 81            	ret
2575                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2575                     ; 1025 {
2576                     	switch	.text
2577  02ba               _TIM5_OC1PolarityConfig:
2581                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2583                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2585  02ba a101          	cp	a,#1
2586  02bc 2606          	jrne	L5031
2587                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2589  02be 7212530b      	bset	21259,#1
2591  02c2 2004          	jra	L7031
2592  02c4               L5031:
2593                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2595  02c4 7213530b      	bres	21259,#1
2596  02c8               L7031:
2597                     ; 1038 }
2600  02c8 81            	ret
2636                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2636                     ; 1049 {
2637                     	switch	.text
2638  02c9               _TIM5_OC2PolarityConfig:
2642                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2644                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2646  02c9 a101          	cp	a,#1
2647  02cb 2606          	jrne	L7231
2648                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2650  02cd 721a530b      	bset	21259,#5
2652  02d1 2004          	jra	L1331
2653  02d3               L7231:
2654                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2656  02d3 721b530b      	bres	21259,#5
2657  02d7               L1331:
2658                     ; 1062 }
2661  02d7 81            	ret
2706                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2706                     ; 1075                  FunctionalState NewState)
2706                     ; 1076 {
2707                     	switch	.text
2708  02d8               _TIM5_CCxCmd:
2710  02d8 89            	pushw	x
2711       00000000      OFST:	set	0
2714                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2716                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2718                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2720  02d9 9e            	ld	a,xh
2721  02da 4d            	tnz	a
2722  02db 2610          	jrne	L5531
2723                     ; 1084     if (NewState != DISABLE)
2725  02dd 9f            	ld	a,xl
2726  02de 4d            	tnz	a
2727  02df 2706          	jreq	L7531
2728                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2730  02e1 7210530b      	bset	21259,#0
2732  02e5 2014          	jra	L3631
2733  02e7               L7531:
2734                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2736  02e7 7211530b      	bres	21259,#0
2737  02eb 200e          	jra	L3631
2738  02ed               L5531:
2739                     ; 1097     if (NewState != DISABLE)
2741  02ed 0d02          	tnz	(OFST+2,sp)
2742  02ef 2706          	jreq	L5631
2743                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2745  02f1 7218530b      	bset	21259,#4
2747  02f5 2004          	jra	L3631
2748  02f7               L5631:
2749                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2751  02f7 7219530b      	bres	21259,#4
2752  02fb               L3631:
2753                     ; 1106 }
2756  02fb 85            	popw	x
2757  02fc 81            	ret
2921                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2921                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2921                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2921                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2921                     ; 1188                  uint8_t TIM5_ICFilter)
2921                     ; 1189 {
2922                     	switch	.text
2923  02fd               _TIM5_ICInit:
2925  02fd 89            	pushw	x
2926       00000000      OFST:	set	0
2929                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2931                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2933  02fe 9e            	ld	a,xh
2934  02ff 4d            	tnz	a
2935  0300 2614          	jrne	L5641
2936                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2938  0302 7b07          	ld	a,(OFST+7,sp)
2939  0304 88            	push	a
2940  0305 7b06          	ld	a,(OFST+6,sp)
2941  0307 97            	ld	xl,a
2942  0308 7b03          	ld	a,(OFST+3,sp)
2943  030a 95            	ld	xh,a
2944  030b cd060d        	call	L3_TI1_Config
2946  030e 84            	pop	a
2947                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2949  030f 7b06          	ld	a,(OFST+6,sp)
2950  0311 cd03e3        	call	_TIM5_SetIC1Prescaler
2953  0314 2012          	jra	L7641
2954  0316               L5641:
2955                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2957  0316 7b07          	ld	a,(OFST+7,sp)
2958  0318 88            	push	a
2959  0319 7b06          	ld	a,(OFST+6,sp)
2960  031b 97            	ld	xl,a
2961  031c 7b03          	ld	a,(OFST+3,sp)
2962  031e 95            	ld	xh,a
2963  031f cd064a        	call	L5_TI2_Config
2965  0322 84            	pop	a
2966                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2968  0323 7b06          	ld	a,(OFST+6,sp)
2969  0325 cd03fd        	call	_TIM5_SetIC2Prescaler
2971  0328               L7641:
2972                     ; 1209 }
2975  0328 85            	popw	x
2976  0329 81            	ret
3072                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3072                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3072                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3072                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3072                     ; 1239                      uint8_t TIM5_ICFilter)
3072                     ; 1240 {
3073                     	switch	.text
3074  032a               _TIM5_PWMIConfig:
3076  032a 89            	pushw	x
3077  032b 89            	pushw	x
3078       00000002      OFST:	set	2
3081                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3083                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3085                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3087                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3089  032c 9f            	ld	a,xl
3090  032d 4d            	tnz	a
3091  032e 2606          	jrne	L7351
3092                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3094  0330 a601          	ld	a,#1
3095  0332 6b01          	ld	(OFST-1,sp),a
3098  0334 2002          	jra	L1451
3099  0336               L7351:
3100                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3102  0336 0f01          	clr	(OFST-1,sp)
3104  0338               L1451:
3105                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3107  0338 7b07          	ld	a,(OFST+5,sp)
3108  033a a101          	cp	a,#1
3109  033c 2606          	jrne	L3451
3110                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3112  033e a602          	ld	a,#2
3113  0340 6b02          	ld	(OFST+0,sp),a
3116  0342 2004          	jra	L5451
3117  0344               L3451:
3118                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3120  0344 a601          	ld	a,#1
3121  0346 6b02          	ld	(OFST+0,sp),a
3123  0348               L5451:
3124                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3126  0348 0d03          	tnz	(OFST+1,sp)
3127  034a 2626          	jrne	L7451
3128                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3128                     ; 1271                TIM5_ICFilter);
3130  034c 7b09          	ld	a,(OFST+7,sp)
3131  034e 88            	push	a
3132  034f 7b08          	ld	a,(OFST+6,sp)
3133  0351 97            	ld	xl,a
3134  0352 7b05          	ld	a,(OFST+3,sp)
3135  0354 95            	ld	xh,a
3136  0355 cd060d        	call	L3_TI1_Config
3138  0358 84            	pop	a
3139                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3141  0359 7b08          	ld	a,(OFST+6,sp)
3142  035b cd03e3        	call	_TIM5_SetIC1Prescaler
3144                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3146  035e 7b09          	ld	a,(OFST+7,sp)
3147  0360 88            	push	a
3148  0361 7b03          	ld	a,(OFST+1,sp)
3149  0363 97            	ld	xl,a
3150  0364 7b02          	ld	a,(OFST+0,sp)
3151  0366 95            	ld	xh,a
3152  0367 cd064a        	call	L5_TI2_Config
3154  036a 84            	pop	a
3155                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3157  036b 7b08          	ld	a,(OFST+6,sp)
3158  036d cd03fd        	call	_TIM5_SetIC2Prescaler
3161  0370 2022          	jra	L1551
3162  0372               L7451:
3163                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3163                     ; 1286                TIM5_ICFilter);
3165  0372 7b09          	ld	a,(OFST+7,sp)
3166  0374 88            	push	a
3167  0375 7b08          	ld	a,(OFST+6,sp)
3168  0377 97            	ld	xl,a
3169  0378 7b05          	ld	a,(OFST+3,sp)
3170  037a 95            	ld	xh,a
3171  037b cd064a        	call	L5_TI2_Config
3173  037e 84            	pop	a
3174                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3176  037f 7b08          	ld	a,(OFST+6,sp)
3177  0381 ad7a          	call	_TIM5_SetIC2Prescaler
3179                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3181  0383 7b09          	ld	a,(OFST+7,sp)
3182  0385 88            	push	a
3183  0386 7b03          	ld	a,(OFST+1,sp)
3184  0388 97            	ld	xl,a
3185  0389 7b02          	ld	a,(OFST+0,sp)
3186  038b 95            	ld	xh,a
3187  038c cd060d        	call	L3_TI1_Config
3189  038f 84            	pop	a
3190                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3192  0390 7b08          	ld	a,(OFST+6,sp)
3193  0392 ad4f          	call	_TIM5_SetIC1Prescaler
3195  0394               L1551:
3196                     ; 1297 }
3199  0394 5b04          	addw	sp,#4
3200  0396 81            	ret
3252                     ; 1304 uint16_t TIM5_GetCapture1(void)
3252                     ; 1305 {
3253                     	switch	.text
3254  0397               _TIM5_GetCapture1:
3256  0397 5204          	subw	sp,#4
3257       00000004      OFST:	set	4
3260                     ; 1306   uint16_t tmpccr1 = 0;
3262                     ; 1309   tmpccr1h = TIM5->CCR1H;
3264  0399 c65311        	ld	a,21265
3265  039c 6b02          	ld	(OFST-2,sp),a
3267                     ; 1310   tmpccr1l = TIM5->CCR1L;
3269  039e c65312        	ld	a,21266
3270  03a1 6b01          	ld	(OFST-3,sp),a
3272                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3274  03a3 7b01          	ld	a,(OFST-3,sp)
3275  03a5 5f            	clrw	x
3276  03a6 97            	ld	xl,a
3277  03a7 1f03          	ldw	(OFST-1,sp),x
3279                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3281  03a9 7b02          	ld	a,(OFST-2,sp)
3282  03ab 5f            	clrw	x
3283  03ac 97            	ld	xl,a
3284  03ad 4f            	clr	a
3285  03ae 02            	rlwa	x,a
3286  03af 01            	rrwa	x,a
3287  03b0 1a04          	or	a,(OFST+0,sp)
3288  03b2 01            	rrwa	x,a
3289  03b3 1a03          	or	a,(OFST-1,sp)
3290  03b5 01            	rrwa	x,a
3291  03b6 1f03          	ldw	(OFST-1,sp),x
3293                     ; 1315   return ((uint16_t)tmpccr1);
3295  03b8 1e03          	ldw	x,(OFST-1,sp)
3298  03ba 5b04          	addw	sp,#4
3299  03bc 81            	ret
3351                     ; 1323 uint16_t TIM5_GetCapture2(void)
3351                     ; 1324 {
3352                     	switch	.text
3353  03bd               _TIM5_GetCapture2:
3355  03bd 5204          	subw	sp,#4
3356       00000004      OFST:	set	4
3359                     ; 1325   uint16_t tmpccr2 = 0;
3361                     ; 1328   tmpccr2h = TIM5->CCR2H;
3363  03bf c65313        	ld	a,21267
3364  03c2 6b02          	ld	(OFST-2,sp),a
3366                     ; 1329   tmpccr2l = TIM5->CCR2L;
3368  03c4 c65314        	ld	a,21268
3369  03c7 6b01          	ld	(OFST-3,sp),a
3371                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3373  03c9 7b01          	ld	a,(OFST-3,sp)
3374  03cb 5f            	clrw	x
3375  03cc 97            	ld	xl,a
3376  03cd 1f03          	ldw	(OFST-1,sp),x
3378                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3380  03cf 7b02          	ld	a,(OFST-2,sp)
3381  03d1 5f            	clrw	x
3382  03d2 97            	ld	xl,a
3383  03d3 4f            	clr	a
3384  03d4 02            	rlwa	x,a
3385  03d5 01            	rrwa	x,a
3386  03d6 1a04          	or	a,(OFST+0,sp)
3387  03d8 01            	rrwa	x,a
3388  03d9 1a03          	or	a,(OFST-1,sp)
3389  03db 01            	rrwa	x,a
3390  03dc 1f03          	ldw	(OFST-1,sp),x
3392                     ; 1334   return ((uint16_t)tmpccr2);
3394  03de 1e03          	ldw	x,(OFST-1,sp)
3397  03e0 5b04          	addw	sp,#4
3398  03e2 81            	ret
3443                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3443                     ; 1348 {
3444                     	switch	.text
3445  03e3               _TIM5_SetIC1Prescaler:
3447  03e3 88            	push	a
3448  03e4 88            	push	a
3449       00000001      OFST:	set	1
3452                     ; 1349   uint8_t tmpccmr1 = 0;
3454                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3456                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3458  03e5 c65309        	ld	a,21257
3459  03e8 6b01          	ld	(OFST+0,sp),a
3461                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3463  03ea 7b01          	ld	a,(OFST+0,sp)
3464  03ec a4f3          	and	a,#243
3465  03ee 6b01          	ld	(OFST+0,sp),a
3467                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3469  03f0 7b01          	ld	a,(OFST+0,sp)
3470  03f2 1a02          	or	a,(OFST+1,sp)
3471  03f4 6b01          	ld	(OFST+0,sp),a
3473                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3475  03f6 7b01          	ld	a,(OFST+0,sp)
3476  03f8 c75309        	ld	21257,a
3477                     ; 1363 }
3480  03fb 85            	popw	x
3481  03fc 81            	ret
3526                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3526                     ; 1376 {
3527                     	switch	.text
3528  03fd               _TIM5_SetIC2Prescaler:
3530  03fd 88            	push	a
3531  03fe 88            	push	a
3532       00000001      OFST:	set	1
3535                     ; 1377   uint8_t tmpccmr2 = 0;
3537                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3539                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3541  03ff c6530a        	ld	a,21258
3542  0402 6b01          	ld	(OFST+0,sp),a
3544                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3546  0404 7b01          	ld	a,(OFST+0,sp)
3547  0406 a4f3          	and	a,#243
3548  0408 6b01          	ld	(OFST+0,sp),a
3550                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3552  040a 7b01          	ld	a,(OFST+0,sp)
3553  040c 1a02          	or	a,(OFST+1,sp)
3554  040e 6b01          	ld	(OFST+0,sp),a
3556                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3558  0410 7b01          	ld	a,(OFST+0,sp)
3559  0412 c7530a        	ld	21258,a
3560                     ; 1391 }
3563  0415 85            	popw	x
3564  0416 81            	ret
3650                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3650                     ; 1423 {
3651                     	switch	.text
3652  0417               _TIM5_ITConfig:
3654  0417 89            	pushw	x
3655       00000000      OFST:	set	0
3658                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3660                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3662                     ; 1428   if (NewState != DISABLE)
3664  0418 9f            	ld	a,xl
3665  0419 4d            	tnz	a
3666  041a 2709          	jreq	L3371
3667                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3669  041c 9e            	ld	a,xh
3670  041d ca5305        	or	a,21253
3671  0420 c75305        	ld	21253,a
3673  0423 2009          	jra	L5371
3674  0425               L3371:
3675                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3677  0425 7b01          	ld	a,(OFST+1,sp)
3678  0427 43            	cpl	a
3679  0428 c45305        	and	a,21253
3680  042b c75305        	ld	21253,a
3681  042e               L5371:
3682                     ; 1438 }
3685  042e 85            	popw	x
3686  042f 81            	ret
3767                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3767                     ; 1452 {
3768                     	switch	.text
3769  0430               _TIM5_GenerateEvent:
3773                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3775                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3777  0430 ca5308        	or	a,21256
3778  0433 c75308        	ld	21256,a
3779                     ; 1458 }
3782  0436 81            	ret
3921                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3921                     ; 1474 {
3922                     	switch	.text
3923  0437               _TIM5_GetFlagStatus:
3925  0437 89            	pushw	x
3926  0438 89            	pushw	x
3927       00000002      OFST:	set	2
3930                     ; 1475   FlagStatus bitstatus = RESET;
3932                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3936                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3938                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3940  0439 9f            	ld	a,xl
3941  043a c45306        	and	a,21254
3942  043d 6b01          	ld	(OFST-1,sp),a
3944                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3946  043f c65307        	ld	a,21255
3947  0442 1403          	and	a,(OFST+1,sp)
3948  0444 6b02          	ld	(OFST+0,sp),a
3950                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3952  0446 7b01          	ld	a,(OFST-1,sp)
3953  0448 1a02          	or	a,(OFST+0,sp)
3954  044a 2706          	jreq	L7502
3955                     ; 1486     bitstatus = SET;
3957  044c a601          	ld	a,#1
3958  044e 6b02          	ld	(OFST+0,sp),a
3961  0450 2002          	jra	L1602
3962  0452               L7502:
3963                     ; 1490     bitstatus = RESET;
3965  0452 0f02          	clr	(OFST+0,sp)
3967  0454               L1602:
3968                     ; 1492   return ((FlagStatus)bitstatus);
3970  0454 7b02          	ld	a,(OFST+0,sp)
3973  0456 5b04          	addw	sp,#4
3974  0458 81            	ret
4009                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
4009                     ; 1507 {
4010                     	switch	.text
4011  0459               _TIM5_ClearFlag:
4013  0459 89            	pushw	x
4014       00000000      OFST:	set	0
4017                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
4019                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
4021  045a 9f            	ld	a,xl
4022  045b 43            	cpl	a
4023  045c c75306        	ld	21254,a
4024                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
4026  045f 7b01          	ld	a,(OFST+1,sp)
4027  0461 43            	cpl	a
4028  0462 c75307        	ld	21255,a
4029                     ; 1513 }
4032  0465 85            	popw	x
4033  0466 81            	ret
4097                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4097                     ; 1527 {
4098                     	switch	.text
4099  0467               _TIM5_GetITStatus:
4101  0467 88            	push	a
4102  0468 89            	pushw	x
4103       00000002      OFST:	set	2
4106                     ; 1528   ITStatus bitstatus = RESET;
4108                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4112                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4114                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4116  0469 c45306        	and	a,21254
4117  046c 6b01          	ld	(OFST-1,sp),a
4119                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4121  046e c65305        	ld	a,21253
4122  0471 1403          	and	a,(OFST+1,sp)
4123  0473 6b02          	ld	(OFST+0,sp),a
4125                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4127  0475 0d01          	tnz	(OFST-1,sp)
4128  0477 270a          	jreq	L3312
4130  0479 0d02          	tnz	(OFST+0,sp)
4131  047b 2706          	jreq	L3312
4132                     ; 1541     bitstatus = (ITStatus)SET;
4134  047d a601          	ld	a,#1
4135  047f 6b02          	ld	(OFST+0,sp),a
4138  0481 2002          	jra	L5312
4139  0483               L3312:
4140                     ; 1545     bitstatus = (ITStatus)RESET;
4142  0483 0f02          	clr	(OFST+0,sp)
4144  0485               L5312:
4145                     ; 1547   return ((ITStatus)bitstatus);
4147  0485 7b02          	ld	a,(OFST+0,sp)
4150  0487 5b03          	addw	sp,#3
4151  0489 81            	ret
4187                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4187                     ; 1562 {
4188                     	switch	.text
4189  048a               _TIM5_ClearITPendingBit:
4193                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4195                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4197  048a 43            	cpl	a
4198  048b c75306        	ld	21254,a
4199                     ; 1568 }
4202  048e 81            	ret
4275                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4275                     ; 1582 {
4276                     	switch	.text
4277  048f               _TIM5_DMACmd:
4279  048f 89            	pushw	x
4280       00000000      OFST:	set	0
4283                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4285                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4287                     ; 1587   if (NewState != DISABLE)
4289  0490 9f            	ld	a,xl
4290  0491 4d            	tnz	a
4291  0492 2709          	jreq	L1122
4292                     ; 1590     TIM5->DER |= TIM5_DMASource;
4294  0494 9e            	ld	a,xh
4295  0495 ca5304        	or	a,21252
4296  0498 c75304        	ld	21252,a
4298  049b 2009          	jra	L3122
4299  049d               L1122:
4300                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4302  049d 7b01          	ld	a,(OFST+1,sp)
4303  049f 43            	cpl	a
4304  04a0 c45304        	and	a,21252
4305  04a3 c75304        	ld	21252,a
4306  04a6               L3122:
4307                     ; 1597 }
4310  04a6 85            	popw	x
4311  04a7 81            	ret
4346                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4346                     ; 1606 {
4347                     	switch	.text
4348  04a8               _TIM5_SelectCCDMA:
4352                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4354                     ; 1610   if (NewState != DISABLE)
4356  04a8 4d            	tnz	a
4357  04a9 2706          	jreq	L3322
4358                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4360  04ab 72165301      	bset	21249,#3
4362  04af 2004          	jra	L5322
4363  04b1               L3322:
4364                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4366  04b1 72175301      	bres	21249,#3
4367  04b5               L5322:
4368                     ; 1620 }
4371  04b5 81            	ret
4395                     ; 1644 void TIM5_InternalClockConfig(void)
4395                     ; 1645 {
4396                     	switch	.text
4397  04b6               _TIM5_InternalClockConfig:
4401                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4403  04b6 c65302        	ld	a,21250
4404  04b9 a4f8          	and	a,#248
4405  04bb c75302        	ld	21250,a
4406                     ; 1648 }
4409  04be 81            	ret
4498                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4498                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4498                     ; 1667                                  uint8_t ICFilter)
4498                     ; 1668 {
4499                     	switch	.text
4500  04bf               _TIM5_TIxExternalClockConfig:
4502  04bf 89            	pushw	x
4503       00000000      OFST:	set	0
4506                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4508                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4510                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4512                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4514  04c0 9e            	ld	a,xh
4515  04c1 a160          	cp	a,#96
4516  04c3 260e          	jrne	L7032
4517                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4519  04c5 7b05          	ld	a,(OFST+5,sp)
4520  04c7 88            	push	a
4521  04c8 9f            	ld	a,xl
4522  04c9 ae0001        	ldw	x,#1
4523  04cc 95            	ld	xh,a
4524  04cd cd064a        	call	L5_TI2_Config
4526  04d0 84            	pop	a
4528  04d1 200d          	jra	L1132
4529  04d3               L7032:
4530                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4532  04d3 7b05          	ld	a,(OFST+5,sp)
4533  04d5 88            	push	a
4534  04d6 7b03          	ld	a,(OFST+3,sp)
4535  04d8 ae0001        	ldw	x,#1
4536  04db 95            	ld	xh,a
4537  04dc cd060d        	call	L3_TI1_Config
4539  04df 84            	pop	a
4540  04e0               L1132:
4541                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4543  04e0 7b01          	ld	a,(OFST+1,sp)
4544  04e2 ad4b          	call	_TIM5_SelectInputTrigger
4546                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4548  04e4 c65302        	ld	a,21250
4549  04e7 aa07          	or	a,#7
4550  04e9 c75302        	ld	21250,a
4551                     ; 1689 }
4554  04ec 85            	popw	x
4555  04ed 81            	ret
4672                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4672                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4672                     ; 1709                               uint8_t ExtTRGFilter)
4672                     ; 1710 {
4673                     	switch	.text
4674  04ee               _TIM5_ETRClockMode1Config:
4676  04ee 89            	pushw	x
4677       00000000      OFST:	set	0
4680                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4682  04ef 7b05          	ld	a,(OFST+5,sp)
4683  04f1 88            	push	a
4684  04f2 9f            	ld	a,xl
4685  04f3 97            	ld	xl,a
4686  04f4 7b02          	ld	a,(OFST+2,sp)
4687  04f6 95            	ld	xh,a
4688  04f7 cd058b        	call	_TIM5_ETRConfig
4690  04fa 84            	pop	a
4691                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4693  04fb c65302        	ld	a,21250
4694  04fe a4f8          	and	a,#248
4695  0500 c75302        	ld	21250,a
4696                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4698  0503 c65302        	ld	a,21250
4699  0506 aa07          	or	a,#7
4700  0508 c75302        	ld	21250,a
4701                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4703  050b c65302        	ld	a,21250
4704  050e a48f          	and	a,#143
4705  0510 c75302        	ld	21250,a
4706                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4708  0513 c65302        	ld	a,21250
4709  0516 aa70          	or	a,#112
4710  0518 c75302        	ld	21250,a
4711                     ; 1721 }
4714  051b 85            	popw	x
4715  051c 81            	ret
4773                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4773                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4773                     ; 1741                               uint8_t ExtTRGFilter)
4773                     ; 1742 {
4774                     	switch	.text
4775  051d               _TIM5_ETRClockMode2Config:
4777  051d 89            	pushw	x
4778       00000000      OFST:	set	0
4781                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4783  051e 7b05          	ld	a,(OFST+5,sp)
4784  0520 88            	push	a
4785  0521 9f            	ld	a,xl
4786  0522 97            	ld	xl,a
4787  0523 7b02          	ld	a,(OFST+2,sp)
4788  0525 95            	ld	xh,a
4789  0526 ad63          	call	_TIM5_ETRConfig
4791  0528 84            	pop	a
4792                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4794  0529 721c5303      	bset	21251,#6
4795                     ; 1748 }
4798  052d 85            	popw	x
4799  052e 81            	ret
4915                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4915                     ; 1800 {
4916                     	switch	.text
4917  052f               _TIM5_SelectInputTrigger:
4919  052f 88            	push	a
4920  0530 88            	push	a
4921       00000001      OFST:	set	1
4924                     ; 1801   uint8_t tmpsmcr = 0;
4926                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4928                     ; 1806   tmpsmcr = TIM5->SMCR;
4930  0531 c65302        	ld	a,21250
4931  0534 6b01          	ld	(OFST+0,sp),a
4933                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4935  0536 7b01          	ld	a,(OFST+0,sp)
4936  0538 a48f          	and	a,#143
4937  053a 6b01          	ld	(OFST+0,sp),a
4939                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4941  053c 7b01          	ld	a,(OFST+0,sp)
4942  053e 1a02          	or	a,(OFST+1,sp)
4943  0540 6b01          	ld	(OFST+0,sp),a
4945                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4947  0542 7b01          	ld	a,(OFST+0,sp)
4948  0544 c75302        	ld	21250,a
4949                     ; 1813 }
4952  0547 85            	popw	x
4953  0548 81            	ret
5052                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
5052                     ; 1828 {
5053                     	switch	.text
5054  0549               _TIM5_SelectOutputTrigger:
5056  0549 88            	push	a
5057  054a 88            	push	a
5058       00000001      OFST:	set	1
5061                     ; 1829   uint8_t tmpcr2 = 0;
5063                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
5065                     ; 1834   tmpcr2 = TIM5->CR2;
5067  054b c65301        	ld	a,21249
5068  054e 6b01          	ld	(OFST+0,sp),a
5070                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5072  0550 7b01          	ld	a,(OFST+0,sp)
5073  0552 a48f          	and	a,#143
5074  0554 6b01          	ld	(OFST+0,sp),a
5076                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
5078  0556 7b01          	ld	a,(OFST+0,sp)
5079  0558 1a02          	or	a,(OFST+1,sp)
5080  055a 6b01          	ld	(OFST+0,sp),a
5082                     ; 1842   TIM5->CR2 = tmpcr2;
5084  055c 7b01          	ld	a,(OFST+0,sp)
5085  055e c75301        	ld	21249,a
5086                     ; 1843 }
5089  0561 85            	popw	x
5090  0562 81            	ret
5173                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5173                     ; 1856 {
5174                     	switch	.text
5175  0563               _TIM5_SelectSlaveMode:
5177  0563 88            	push	a
5178  0564 88            	push	a
5179       00000001      OFST:	set	1
5182                     ; 1857   uint8_t tmpsmcr = 0;
5184                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5186                     ; 1862   tmpsmcr = TIM5->SMCR;
5188  0565 c65302        	ld	a,21250
5189  0568 6b01          	ld	(OFST+0,sp),a
5191                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5193  056a 7b01          	ld	a,(OFST+0,sp)
5194  056c a4f8          	and	a,#248
5195  056e 6b01          	ld	(OFST+0,sp),a
5197                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5199  0570 7b01          	ld	a,(OFST+0,sp)
5200  0572 1a02          	or	a,(OFST+1,sp)
5201  0574 6b01          	ld	(OFST+0,sp),a
5203                     ; 1870   TIM5->SMCR = tmpsmcr;
5205  0576 7b01          	ld	a,(OFST+0,sp)
5206  0578 c75302        	ld	21250,a
5207                     ; 1871 }
5210  057b 85            	popw	x
5211  057c 81            	ret
5247                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5247                     ; 1880 {
5248                     	switch	.text
5249  057d               _TIM5_SelectMasterSlaveMode:
5253                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5255                     ; 1885   if (NewState != DISABLE)
5257  057d 4d            	tnz	a
5258  057e 2706          	jreq	L7752
5259                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5261  0580 721e5302      	bset	21250,#7
5263  0584 2004          	jra	L1062
5264  0586               L7752:
5265                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5267  0586 721f5302      	bres	21250,#7
5268  058a               L1062:
5269                     ; 1893 }
5272  058a 81            	ret
5328                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5328                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5328                     ; 1913                     uint8_t ExtTRGFilter)
5328                     ; 1914 {
5329                     	switch	.text
5330  058b               _TIM5_ETRConfig:
5332  058b 89            	pushw	x
5333       00000000      OFST:	set	0
5336                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5338                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5340                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5342                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5342                     ; 1922                          | (uint8_t)ExtTRGFilter);
5344  058c 9f            	ld	a,xl
5345  058d 1a01          	or	a,(OFST+1,sp)
5346  058f 1a05          	or	a,(OFST+5,sp)
5347  0591 ca5303        	or	a,21251
5348  0594 c75303        	ld	21251,a
5349                     ; 1923 }
5352  0597 85            	popw	x
5353  0598 81            	ret
5466                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5466                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5466                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5466                     ; 1961 {
5467                     	switch	.text
5468  0599               _TIM5_EncoderInterfaceConfig:
5470  0599 89            	pushw	x
5471  059a 5203          	subw	sp,#3
5472       00000003      OFST:	set	3
5475                     ; 1962   uint8_t tmpsmcr = 0;
5477                     ; 1963   uint8_t tmpccmr1 = 0;
5479                     ; 1964   uint8_t tmpccmr2 = 0;
5481                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5483                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5485                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5487                     ; 1971   tmpsmcr = TIM5->SMCR;
5489  059c c65302        	ld	a,21250
5490  059f 6b01          	ld	(OFST-2,sp),a
5492                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5494  05a1 c65309        	ld	a,21257
5495  05a4 6b02          	ld	(OFST-1,sp),a
5497                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5499  05a6 c6530a        	ld	a,21258
5500  05a9 6b03          	ld	(OFST+0,sp),a
5502                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5504  05ab 7b01          	ld	a,(OFST-2,sp)
5505  05ad a4f0          	and	a,#240
5506  05af 6b01          	ld	(OFST-2,sp),a
5508                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5510  05b1 9e            	ld	a,xh
5511  05b2 1a01          	or	a,(OFST-2,sp)
5512  05b4 6b01          	ld	(OFST-2,sp),a
5514                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5516  05b6 7b02          	ld	a,(OFST-1,sp)
5517  05b8 a4fc          	and	a,#252
5518  05ba 6b02          	ld	(OFST-1,sp),a
5520                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5522  05bc 7b03          	ld	a,(OFST+0,sp)
5523  05be a4fc          	and	a,#252
5524  05c0 6b03          	ld	(OFST+0,sp),a
5526                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5528  05c2 7b02          	ld	a,(OFST-1,sp)
5529  05c4 aa01          	or	a,#1
5530  05c6 6b02          	ld	(OFST-1,sp),a
5532                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5534  05c8 7b03          	ld	a,(OFST+0,sp)
5535  05ca aa01          	or	a,#1
5536  05cc 6b03          	ld	(OFST+0,sp),a
5538                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5540  05ce 9f            	ld	a,xl
5541  05cf a101          	cp	a,#1
5542  05d1 2606          	jrne	L5072
5543                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5545  05d3 7212530b      	bset	21259,#1
5547  05d7 2004          	jra	L7072
5548  05d9               L5072:
5549                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5551  05d9 7213530b      	bres	21259,#1
5552  05dd               L7072:
5553                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5555  05dd 7b08          	ld	a,(OFST+5,sp)
5556  05df a101          	cp	a,#1
5557  05e1 2606          	jrne	L1172
5558                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5560  05e3 721a530b      	bset	21259,#5
5562  05e7 2004          	jra	L3172
5563  05e9               L1172:
5564                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5566  05e9 721b530b      	bres	21259,#5
5567  05ed               L3172:
5568                     ; 2004   TIM5->SMCR = tmpsmcr;
5570  05ed 7b01          	ld	a,(OFST-2,sp)
5571  05ef c75302        	ld	21250,a
5572                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5574  05f2 7b02          	ld	a,(OFST-1,sp)
5575  05f4 c75309        	ld	21257,a
5576                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5578  05f7 7b03          	ld	a,(OFST+0,sp)
5579  05f9 c7530a        	ld	21258,a
5580                     ; 2007 }
5583  05fc 5b05          	addw	sp,#5
5584  05fe 81            	ret
5620                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5620                     ; 2016 {
5621                     	switch	.text
5622  05ff               _TIM5_SelectHallSensor:
5626                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5628                     ; 2021   if (NewState != DISABLE)
5630  05ff 4d            	tnz	a
5631  0600 2706          	jreq	L3372
5632                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5634  0602 721e5301      	bset	21249,#7
5636  0606 2004          	jra	L5372
5637  0608               L3372:
5638                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5640  0608 721f5301      	bres	21249,#7
5641  060c               L5372:
5642                     ; 2029 }
5645  060c 81            	ret
5717                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5717                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5717                     ; 2052                        uint8_t TIM5_ICFilter)
5717                     ; 2053 {
5718                     	switch	.text
5719  060d               L3_TI1_Config:
5721  060d 89            	pushw	x
5722  060e 89            	pushw	x
5723       00000002      OFST:	set	2
5726                     ; 2054   uint8_t tmpccmr1 = 0;
5728                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5730  060f 9e            	ld	a,xh
5731  0610 6b01          	ld	(OFST-1,sp),a
5733                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5735  0612 c65309        	ld	a,21257
5736  0615 6b02          	ld	(OFST+0,sp),a
5738                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5740                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5742                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5744                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5746  0617 7211530b      	bres	21259,#0
5747                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5749  061b 7b02          	ld	a,(OFST+0,sp)
5750  061d a40c          	and	a,#12
5751  061f 6b02          	ld	(OFST+0,sp),a
5753                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5755  0621 7b07          	ld	a,(OFST+5,sp)
5756  0623 97            	ld	xl,a
5757  0624 a610          	ld	a,#16
5758  0626 42            	mul	x,a
5759  0627 9f            	ld	a,xl
5760  0628 1a04          	or	a,(OFST+2,sp)
5761  062a 1a02          	or	a,(OFST+0,sp)
5762  062c 6b02          	ld	(OFST+0,sp),a
5764                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5766  062e 7b02          	ld	a,(OFST+0,sp)
5767  0630 c75309        	ld	21257,a
5768                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5770  0633 7b01          	ld	a,(OFST-1,sp)
5771  0635 a101          	cp	a,#1
5772  0637 2606          	jrne	L5772
5773                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5775  0639 7212530b      	bset	21259,#1
5777  063d 2004          	jra	L7772
5778  063f               L5772:
5779                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5781  063f 7213530b      	bres	21259,#1
5782  0643               L7772:
5783                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5785  0643 7210530b      	bset	21259,#0
5786                     ; 2084 }
5789  0647 5b04          	addw	sp,#4
5790  0649 81            	ret
5862                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5862                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5862                     ; 2103                        uint8_t TIM5_ICFilter)
5862                     ; 2104 {
5863                     	switch	.text
5864  064a               L5_TI2_Config:
5866  064a 89            	pushw	x
5867  064b 89            	pushw	x
5868       00000002      OFST:	set	2
5871                     ; 2105   uint8_t tmpccmr2 = 0;
5873                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5875  064c 9e            	ld	a,xh
5876  064d 6b01          	ld	(OFST-1,sp),a
5878                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5880                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5882                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5884                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5886  064f c6530a        	ld	a,21258
5887  0652 6b02          	ld	(OFST+0,sp),a
5889                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5891  0654 7219530b      	bres	21259,#4
5892                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5894  0658 7b02          	ld	a,(OFST+0,sp)
5895  065a a40c          	and	a,#12
5896  065c 6b02          	ld	(OFST+0,sp),a
5898                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5900  065e 7b07          	ld	a,(OFST+5,sp)
5901  0660 97            	ld	xl,a
5902  0661 a610          	ld	a,#16
5903  0663 42            	mul	x,a
5904  0664 9f            	ld	a,xl
5905  0665 1a04          	or	a,(OFST+2,sp)
5906  0667 1a02          	or	a,(OFST+0,sp)
5907  0669 6b02          	ld	(OFST+0,sp),a
5909                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5911  066b 7b02          	ld	a,(OFST+0,sp)
5912  066d c7530a        	ld	21258,a
5913                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5915  0670 7b01          	ld	a,(OFST-1,sp)
5916  0672 a101          	cp	a,#1
5917  0674 2606          	jrne	L7303
5918                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5920  0676 721a530b      	bset	21259,#5
5922  067a 2004          	jra	L1403
5923  067c               L7303:
5924                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5926  067c 721b530b      	bres	21259,#5
5927  0680               L1403:
5928                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5930  0680 7218530b      	bset	21259,#4
5931                     ; 2136 }
5934  0684 5b04          	addw	sp,#4
5935  0686 81            	ret
5948                     	xdef	_TIM5_SelectHallSensor
5949                     	xdef	_TIM5_EncoderInterfaceConfig
5950                     	xdef	_TIM5_ETRConfig
5951                     	xdef	_TIM5_SelectMasterSlaveMode
5952                     	xdef	_TIM5_SelectSlaveMode
5953                     	xdef	_TIM5_SelectOutputTrigger
5954                     	xdef	_TIM5_SelectInputTrigger
5955                     	xdef	_TIM5_ETRClockMode2Config
5956                     	xdef	_TIM5_ETRClockMode1Config
5957                     	xdef	_TIM5_TIxExternalClockConfig
5958                     	xdef	_TIM5_InternalClockConfig
5959                     	xdef	_TIM5_SelectCCDMA
5960                     	xdef	_TIM5_DMACmd
5961                     	xdef	_TIM5_ClearITPendingBit
5962                     	xdef	_TIM5_GetITStatus
5963                     	xdef	_TIM5_ClearFlag
5964                     	xdef	_TIM5_GetFlagStatus
5965                     	xdef	_TIM5_GenerateEvent
5966                     	xdef	_TIM5_ITConfig
5967                     	xdef	_TIM5_SetIC2Prescaler
5968                     	xdef	_TIM5_SetIC1Prescaler
5969                     	xdef	_TIM5_GetCapture2
5970                     	xdef	_TIM5_GetCapture1
5971                     	xdef	_TIM5_PWMIConfig
5972                     	xdef	_TIM5_ICInit
5973                     	xdef	_TIM5_CCxCmd
5974                     	xdef	_TIM5_OC2PolarityConfig
5975                     	xdef	_TIM5_OC1PolarityConfig
5976                     	xdef	_TIM5_OC2FastConfig
5977                     	xdef	_TIM5_OC1FastConfig
5978                     	xdef	_TIM5_OC2PreloadConfig
5979                     	xdef	_TIM5_OC1PreloadConfig
5980                     	xdef	_TIM5_ForcedOC2Config
5981                     	xdef	_TIM5_ForcedOC1Config
5982                     	xdef	_TIM5_SetCompare2
5983                     	xdef	_TIM5_SetCompare1
5984                     	xdef	_TIM5_SelectOCxM
5985                     	xdef	_TIM5_CtrlPWMOutputs
5986                     	xdef	_TIM5_BKRConfig
5987                     	xdef	_TIM5_OC2Init
5988                     	xdef	_TIM5_OC1Init
5989                     	xdef	_TIM5_Cmd
5990                     	xdef	_TIM5_SelectOnePulseMode
5991                     	xdef	_TIM5_ARRPreloadConfig
5992                     	xdef	_TIM5_UpdateRequestConfig
5993                     	xdef	_TIM5_UpdateDisableConfig
5994                     	xdef	_TIM5_GetPrescaler
5995                     	xdef	_TIM5_GetCounter
5996                     	xdef	_TIM5_SetAutoreload
5997                     	xdef	_TIM5_SetCounter
5998                     	xdef	_TIM5_CounterModeConfig
5999                     	xdef	_TIM5_PrescalerConfig
6000                     	xdef	_TIM5_TimeBaseInit
6001                     	xdef	_TIM5_DeInit
6020                     	end
