   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 181 void TIM1_DeInit(void)
  43                     ; 182 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f52b0      	clr	21168
  53                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f52b1      	clr	21169
  56                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f52b2      	clr	21170
  59                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f52b3      	clr	21171
  62                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f52b5      	clr	21173
  65                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  67  0014 725f52bd      	clr	21181
  68                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  70  0018 725f52be      	clr	21182
  71                     ; 193   TIM1->CCMR1 = 0x01;
  73  001c 350152b9      	mov	21177,#1
  74                     ; 194   TIM1->CCMR2 = 0x01;
  76  0020 350152ba      	mov	21178,#1
  77                     ; 195   TIM1->CCMR3 = 0x01;
  79  0024 350152bb      	mov	21179,#1
  80                     ; 196   TIM1->CCMR4 = 0x01;
  82  0028 350152bc      	mov	21180,#1
  83                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  85  002c 725f52bd      	clr	21181
  86                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  88  0030 725f52be      	clr	21182
  89                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  91  0034 725f52b9      	clr	21177
  92                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  94  0038 725f52ba      	clr	21178
  95                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  97  003c 725f52bb      	clr	21179
  98                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 100  0040 725f52bc      	clr	21180
 101                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 103  0044 725f52bf      	clr	21183
 104                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 106  0048 725f52c0      	clr	21184
 107                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 109  004c 725f52c1      	clr	21185
 110                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 112  0050 725f52c2      	clr	21186
 113                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 115  0054 35ff52c3      	mov	21187,#255
 116                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 118  0058 35ff52c4      	mov	21188,#255
 119                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 121  005c 725f52c6      	clr	21190
 122                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 124  0060 725f52c7      	clr	21191
 125                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 127  0064 725f52c8      	clr	21192
 128                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 130  0068 725f52c9      	clr	21193
 131                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 133  006c 725f52ca      	clr	21194
 134                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 136  0070 725f52cb      	clr	21195
 137                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 139  0074 725f52cc      	clr	21196
 140                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 142  0078 725f52cd      	clr	21197
 143                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 145  007c 725f52d0      	clr	21200
 146                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 148  0080 350152b8      	mov	21176,#1
 149                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 151  0084 725f52cf      	clr	21199
 152                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 154  0088 725f52ce      	clr	21198
 155                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 157  008c 725f52c5      	clr	21189
 158                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 160  0090 725f52b6      	clr	21174
 161                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 163  0094 725f52b7      	clr	21175
 164                     ; 225 }
 167  0098 81            	ret
 276                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 243                        uint16_t TIM1_Period,
 276                     ; 244                        uint8_t TIM1_RepetitionCounter)
 276                     ; 245 {
 277                     	switch	.text
 278  0099               _TIM1_TimeBaseInit:
 280  0099 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  009a 7b06          	ld	a,(OFST+6,sp)
 289  009c c752c3        	ld	21187,a
 290                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  009f 7b07          	ld	a,(OFST+7,sp)
 293  00a1 c752c4        	ld	21188,a
 294                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  00a4 9e            	ld	a,xh
 297  00a5 c752c1        	ld	21185,a
 298                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  00a8 9f            	ld	a,xl
 301  00a9 c752c2        	ld	21186,a
 302                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 304  00ac c652b0        	ld	a,21168
 305  00af a48f          	and	a,#143
 306  00b1 1a05          	or	a,(OFST+5,sp)
 307  00b3 c752b0        	ld	21168,a
 308                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 310  00b6 7b08          	ld	a,(OFST+8,sp)
 311  00b8 c752c5        	ld	21189,a
 312                     ; 265 }
 315  00bb 85            	popw	x
 316  00bc 81            	ret
 383                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 383                     ; 280 {
 384                     	switch	.text
 385  00bd               _TIM1_PrescalerConfig:
 387  00bd 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 393                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 395  00be 9e            	ld	a,xh
 396  00bf c752c1        	ld	21185,a
 397                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 399  00c2 9f            	ld	a,xl
 400  00c3 c752c2        	ld	21186,a
 401                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 403  00c6 7b05          	ld	a,(OFST+5,sp)
 404  00c8 c752b8        	ld	21176,a
 405                     ; 290 }
 408  00cb 85            	popw	x
 409  00cc 81            	ret
 445                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 445                     ; 304 {
 446                     	switch	.text
 447  00cd               _TIM1_CounterModeConfig:
 449  00cd 88            	push	a
 450       00000000      OFST:	set	0
 453                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 455                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 455                     ; 311                         | (uint8_t)TIM1_CounterMode);
 457  00ce c652b0        	ld	a,21168
 458  00d1 a48f          	and	a,#143
 459  00d3 1a01          	or	a,(OFST+1,sp)
 460  00d5 c752b0        	ld	21168,a
 461                     ; 312 }
 464  00d8 84            	pop	a
 465  00d9 81            	ret
 499                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 499                     ; 321 {
 500                     	switch	.text
 501  00da               _TIM1_SetCounter:
 505                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 507  00da 9e            	ld	a,xh
 508  00db c752bf        	ld	21183,a
 509                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 511  00de 9f            	ld	a,xl
 512  00df c752c0        	ld	21184,a
 513                     ; 325 }
 516  00e2 81            	ret
 550                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 550                     ; 334 {
 551                     	switch	.text
 552  00e3               _TIM1_SetAutoreload:
 556                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 558  00e3 9e            	ld	a,xh
 559  00e4 c752c3        	ld	21187,a
 560                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 562  00e7 9f            	ld	a,xl
 563  00e8 c752c4        	ld	21188,a
 564                     ; 338 }
 567  00eb 81            	ret
 619                     ; 345 uint16_t TIM1_GetCounter(void)
 619                     ; 346 {
 620                     	switch	.text
 621  00ec               _TIM1_GetCounter:
 623  00ec 5204          	subw	sp,#4
 624       00000004      OFST:	set	4
 627                     ; 348   uint16_t tmpcntr = 0;
 629                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 633                     ; 351   tmpcntrh = TIM1->CNTRH;
 635  00ee c652bf        	ld	a,21183
 636  00f1 6b02          	ld	(OFST-2,sp),a
 638                     ; 352   tmpcntrl = TIM1->CNTRL;
 640  00f3 c652c0        	ld	a,21184
 641  00f6 6b01          	ld	(OFST-3,sp),a
 643                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 645  00f8 7b01          	ld	a,(OFST-3,sp)
 646  00fa 5f            	clrw	x
 647  00fb 97            	ld	xl,a
 648  00fc 1f03          	ldw	(OFST-1,sp),x
 650                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 652  00fe 7b02          	ld	a,(OFST-2,sp)
 653  0100 5f            	clrw	x
 654  0101 97            	ld	xl,a
 655  0102 4f            	clr	a
 656  0103 02            	rlwa	x,a
 657  0104 01            	rrwa	x,a
 658  0105 1a04          	or	a,(OFST+0,sp)
 659  0107 01            	rrwa	x,a
 660  0108 1a03          	or	a,(OFST-1,sp)
 661  010a 01            	rrwa	x,a
 662  010b 1f03          	ldw	(OFST-1,sp),x
 664                     ; 358   return (uint16_t)tmpcntr;
 666  010d 1e03          	ldw	x,(OFST-1,sp)
 669  010f 5b04          	addw	sp,#4
 670  0111 81            	ret
 704                     ; 366 uint16_t TIM1_GetPrescaler(void)
 704                     ; 367 {
 705                     	switch	.text
 706  0112               _TIM1_GetPrescaler:
 708  0112 89            	pushw	x
 709       00000002      OFST:	set	2
 712                     ; 368   uint16_t tmpreg = 0;
 714                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 716  0113 c652c1        	ld	a,21185
 717  0116 5f            	clrw	x
 718  0117 97            	ld	xl,a
 719  0118 4f            	clr	a
 720  0119 02            	rlwa	x,a
 721  011a 1f01          	ldw	(OFST-1,sp),x
 723                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 725  011c c652c2        	ld	a,21186
 726  011f 5f            	clrw	x
 727  0120 97            	ld	xl,a
 728  0121 01            	rrwa	x,a
 729  0122 1a02          	or	a,(OFST+0,sp)
 730  0124 01            	rrwa	x,a
 731  0125 1a01          	or	a,(OFST-1,sp)
 732  0127 01            	rrwa	x,a
 735  0128 5b02          	addw	sp,#2
 736  012a 81            	ret
 792                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 792                     ; 381 {
 793                     	switch	.text
 794  012b               _TIM1_UpdateDisableConfig:
 798                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 800                     ; 386   if (NewState != DISABLE)
 802  012b 4d            	tnz	a
 803  012c 2706          	jreq	L772
 804                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 806  012e 721252b0      	bset	21168,#1
 808  0132 2004          	jra	L103
 809  0134               L772:
 810                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 812  0134 721352b0      	bres	21168,#1
 813  0138               L103:
 814                     ; 394 }
 817  0138 81            	ret
 875                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 875                     ; 405 {
 876                     	switch	.text
 877  0139               _TIM1_UpdateRequestConfig:
 881                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 883                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 885  0139 4d            	tnz	a
 886  013a 2706          	jreq	L133
 887                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 889  013c 721452b0      	bset	21168,#2
 891  0140 2004          	jra	L333
 892  0142               L133:
 893                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 895  0142 721552b0      	bres	21168,#2
 896  0146               L333:
 897                     ; 418 }
 900  0146 81            	ret
 936                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 936                     ; 427 {
 937                     	switch	.text
 938  0147               _TIM1_ARRPreloadConfig:
 942                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 944                     ; 432   if (NewState != DISABLE)
 946  0147 4d            	tnz	a
 947  0148 2706          	jreq	L353
 948                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 950  014a 721e52b0      	bset	21168,#7
 952  014e 2004          	jra	L553
 953  0150               L353:
 954                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 956  0150 721f52b0      	bres	21168,#7
 957  0154               L553:
 958                     ; 440 }
 961  0154 81            	ret
1018                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1018                     ; 451 {
1019                     	switch	.text
1020  0155               _TIM1_SelectOnePulseMode:
1024                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1026                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1028  0155 4d            	tnz	a
1029  0156 2706          	jreq	L504
1030                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1032  0158 721652b0      	bset	21168,#3
1034  015c 2004          	jra	L704
1035  015e               L504:
1036                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1038  015e 721752b0      	bres	21168,#3
1039  0162               L704:
1040                     ; 464 }
1043  0162 81            	ret
1078                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1078                     ; 473 {
1079                     	switch	.text
1080  0163               _TIM1_Cmd:
1084                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1086                     ; 478   if (NewState != DISABLE)
1088  0163 4d            	tnz	a
1089  0164 2706          	jreq	L724
1090                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1092  0166 721052b0      	bset	21168,#0
1094  016a 2004          	jra	L134
1095  016c               L724:
1096                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1098  016c 721152b0      	bres	21168,#0
1099  0170               L134:
1100                     ; 486 }
1103  0170 81            	ret
1388                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1388                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1388                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1388                     ; 580                   uint16_t TIM1_Pulse,
1388                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1388                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1388                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1388                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1388                     ; 585 {
1389                     	switch	.text
1390  0171               _TIM1_OC1Init:
1392  0171 89            	pushw	x
1393  0172 5203          	subw	sp,#3
1394       00000003      OFST:	set	3
1397                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1399                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1401                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1403                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1405                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1407                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1409                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1411                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1411                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1413  0174 c652bd        	ld	a,21181
1414  0177 a4f0          	and	a,#240
1415  0179 c752bd        	ld	21181,a
1416                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1416                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1416                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1416                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1418  017c 7b0c          	ld	a,(OFST+9,sp)
1419  017e a408          	and	a,#8
1420  0180 6b03          	ld	(OFST+0,sp),a
1422  0182 7b0b          	ld	a,(OFST+8,sp)
1423  0184 a402          	and	a,#2
1424  0186 1a03          	or	a,(OFST+0,sp)
1425  0188 6b02          	ld	(OFST-1,sp),a
1427  018a 7b08          	ld	a,(OFST+5,sp)
1428  018c a404          	and	a,#4
1429  018e 6b01          	ld	(OFST-2,sp),a
1431  0190 9f            	ld	a,xl
1432  0191 a401          	and	a,#1
1433  0193 1a01          	or	a,(OFST-2,sp)
1434  0195 1a02          	or	a,(OFST-1,sp)
1435  0197 ca52bd        	or	a,21181
1436  019a c752bd        	ld	21181,a
1437                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1437                     ; 608                           | (uint8_t)TIM1_OCMode);
1439  019d c652b9        	ld	a,21177
1440  01a0 a48f          	and	a,#143
1441  01a2 1a04          	or	a,(OFST+1,sp)
1442  01a4 c752b9        	ld	21177,a
1443                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1445  01a7 c652d0        	ld	a,21200
1446  01aa a4fc          	and	a,#252
1447  01ac c752d0        	ld	21200,a
1448                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1448                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1450  01af 7b0e          	ld	a,(OFST+11,sp)
1451  01b1 a402          	and	a,#2
1452  01b3 6b03          	ld	(OFST+0,sp),a
1454  01b5 7b0d          	ld	a,(OFST+10,sp)
1455  01b7 a401          	and	a,#1
1456  01b9 1a03          	or	a,(OFST+0,sp)
1457  01bb ca52d0        	or	a,21200
1458  01be c752d0        	ld	21200,a
1459                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1461  01c1 7b09          	ld	a,(OFST+6,sp)
1462  01c3 c752c6        	ld	21190,a
1463                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1465  01c6 7b0a          	ld	a,(OFST+7,sp)
1466  01c8 c752c7        	ld	21191,a
1467                     ; 619 }
1470  01cb 5b05          	addw	sp,#5
1471  01cd 81            	ret
1575                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1575                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1575                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1575                     ; 661                   uint16_t TIM1_Pulse,
1575                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1575                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1575                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1575                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1575                     ; 666 {
1576                     	switch	.text
1577  01ce               _TIM1_OC2Init:
1579  01ce 89            	pushw	x
1580  01cf 5203          	subw	sp,#3
1581       00000003      OFST:	set	3
1584                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1586                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1588                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1590                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1592                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1594                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1596                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1598                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1600  01d1 c652bd        	ld	a,21181
1601  01d4 a40f          	and	a,#15
1602  01d6 c752bd        	ld	21181,a
1603                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1603                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1605  01d9 7b0c          	ld	a,(OFST+9,sp)
1606  01db a480          	and	a,#128
1607  01dd 6b03          	ld	(OFST+0,sp),a
1609  01df 7b0b          	ld	a,(OFST+8,sp)
1610  01e1 a420          	and	a,#32
1611  01e3 1a03          	or	a,(OFST+0,sp)
1612  01e5 6b02          	ld	(OFST-1,sp),a
1614  01e7 7b08          	ld	a,(OFST+5,sp)
1615  01e9 a440          	and	a,#64
1616  01eb 6b01          	ld	(OFST-2,sp),a
1618  01ed 9f            	ld	a,xl
1619  01ee a410          	and	a,#16
1620  01f0 1a01          	or	a,(OFST-2,sp)
1621  01f2 1a02          	or	a,(OFST-1,sp)
1622  01f4 ca52bd        	or	a,21181
1623  01f7 c752bd        	ld	21181,a
1624                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1626  01fa c652ba        	ld	a,21178
1627  01fd a48f          	and	a,#143
1628  01ff 1a04          	or	a,(OFST+1,sp)
1629  0201 c752ba        	ld	21178,a
1630                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1632  0204 c652d0        	ld	a,21200
1633  0207 a4f3          	and	a,#243
1634  0209 c752d0        	ld	21200,a
1635                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1637  020c 7b0e          	ld	a,(OFST+11,sp)
1638  020e a408          	and	a,#8
1639  0210 6b03          	ld	(OFST+0,sp),a
1641  0212 7b0d          	ld	a,(OFST+10,sp)
1642  0214 a404          	and	a,#4
1643  0216 1a03          	or	a,(OFST+0,sp)
1644  0218 ca52d0        	or	a,21200
1645  021b c752d0        	ld	21200,a
1646                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1648  021e 7b09          	ld	a,(OFST+6,sp)
1649  0220 c752c8        	ld	21192,a
1650                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1652  0223 7b0a          	ld	a,(OFST+7,sp)
1653  0225 c752c9        	ld	21193,a
1654                     ; 696 }
1657  0228 5b05          	addw	sp,#5
1658  022a 81            	ret
1762                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1762                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1762                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1762                     ; 738                   uint16_t TIM1_Pulse,
1762                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1762                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1762                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1762                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1762                     ; 743 {
1763                     	switch	.text
1764  022b               _TIM1_OC3Init:
1766  022b 89            	pushw	x
1767  022c 5203          	subw	sp,#3
1768       00000003      OFST:	set	3
1771                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1773                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1775                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1777                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1779                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1781                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1783                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1785                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1787  022e c652be        	ld	a,21182
1788  0231 a4f0          	and	a,#240
1789  0233 c752be        	ld	21182,a
1790                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1790                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1792  0236 7b0c          	ld	a,(OFST+9,sp)
1793  0238 a408          	and	a,#8
1794  023a 6b03          	ld	(OFST+0,sp),a
1796  023c 7b0b          	ld	a,(OFST+8,sp)
1797  023e a402          	and	a,#2
1798  0240 1a03          	or	a,(OFST+0,sp)
1799  0242 6b02          	ld	(OFST-1,sp),a
1801  0244 7b08          	ld	a,(OFST+5,sp)
1802  0246 a404          	and	a,#4
1803  0248 6b01          	ld	(OFST-2,sp),a
1805  024a 9f            	ld	a,xl
1806  024b a401          	and	a,#1
1807  024d 1a01          	or	a,(OFST-2,sp)
1808  024f 1a02          	or	a,(OFST-1,sp)
1809  0251 ca52be        	or	a,21182
1810  0254 c752be        	ld	21182,a
1811                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1813  0257 c652bb        	ld	a,21179
1814  025a a48f          	and	a,#143
1815  025c 1a04          	or	a,(OFST+1,sp)
1816  025e c752bb        	ld	21179,a
1817                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1819  0261 c652d0        	ld	a,21200
1820  0264 a4cf          	and	a,#207
1821  0266 c752d0        	ld	21200,a
1822                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1824  0269 7b0e          	ld	a,(OFST+11,sp)
1825  026b a420          	and	a,#32
1826  026d 6b03          	ld	(OFST+0,sp),a
1828  026f 7b0d          	ld	a,(OFST+10,sp)
1829  0271 a410          	and	a,#16
1830  0273 1a03          	or	a,(OFST+0,sp)
1831  0275 ca52d0        	or	a,21200
1832  0278 c752d0        	ld	21200,a
1833                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1835  027b 7b09          	ld	a,(OFST+6,sp)
1836  027d c752ca        	ld	21194,a
1837                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1839  0280 7b0a          	ld	a,(OFST+7,sp)
1840  0282 c752cb        	ld	21195,a
1841                     ; 773 }
1844  0285 5b05          	addw	sp,#5
1845  0287 81            	ret
2052                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2052                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2052                     ; 805                      uint8_t TIM1_DeadTime,
2052                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2052                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2052                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2052                     ; 809 {
2053                     	switch	.text
2054  0288               _TIM1_BDTRConfig:
2056  0288 89            	pushw	x
2057  0289 88            	push	a
2058       00000001      OFST:	set	1
2061                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2063                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2065                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2067                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2069                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2071                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2073  028a 7b06          	ld	a,(OFST+5,sp)
2074  028c c752cf        	ld	21199,a
2075                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2075                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2075                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2077  028f 7b07          	ld	a,(OFST+6,sp)
2078  0291 1a08          	or	a,(OFST+7,sp)
2079  0293 1a09          	or	a,(OFST+8,sp)
2080  0295 6b01          	ld	(OFST+0,sp),a
2082  0297 9f            	ld	a,xl
2083  0298 1a02          	or	a,(OFST+1,sp)
2084  029a 1a01          	or	a,(OFST+0,sp)
2085  029c c752ce        	ld	21198,a
2086                     ; 826 }
2089  029f 5b03          	addw	sp,#3
2090  02a1 81            	ret
2126                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2126                     ; 835 {
2127                     	switch	.text
2128  02a2               _TIM1_CtrlPWMOutputs:
2132                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2134                     ; 841   if (NewState != DISABLE)
2136  02a2 4d            	tnz	a
2137  02a3 2706          	jreq	L5601
2138                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2140  02a5 721e52ce      	bset	21198,#7
2142  02a9 2004          	jra	L7601
2143  02ab               L5601:
2144                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2146  02ab 721f52ce      	bres	21198,#7
2147  02af               L7601:
2148                     ; 849 }
2151  02af 81            	ret
2230                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2230                     ; 872 {
2231                     	switch	.text
2232  02b0               _TIM1_SelectOCxM:
2234  02b0 89            	pushw	x
2235       00000000      OFST:	set	0
2238                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2240                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2242                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2244  02b1 9e            	ld	a,xh
2245  02b2 4d            	tnz	a
2246  02b3 2610          	jrne	L7211
2247                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2249  02b5 721152bd      	bres	21181,#0
2250                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2252  02b9 c652b9        	ld	a,21177
2253  02bc a48f          	and	a,#143
2254  02be 1a02          	or	a,(OFST+2,sp)
2255  02c0 c752b9        	ld	21177,a
2257  02c3 2024          	jra	L1311
2258  02c5               L7211:
2259                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2261  02c5 7b01          	ld	a,(OFST+1,sp)
2262  02c7 a101          	cp	a,#1
2263  02c9 2610          	jrne	L3311
2264                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2266  02cb 721952bd      	bres	21181,#4
2267                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2269  02cf c652ba        	ld	a,21178
2270  02d2 a48f          	and	a,#143
2271  02d4 1a02          	or	a,(OFST+2,sp)
2272  02d6 c752ba        	ld	21178,a
2274  02d9 200e          	jra	L1311
2275  02db               L3311:
2276                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2278  02db 721152be      	bres	21182,#0
2279                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2281  02df c652bb        	ld	a,21179
2282  02e2 a48f          	and	a,#143
2283  02e4 1a02          	or	a,(OFST+2,sp)
2284  02e6 c752bb        	ld	21179,a
2285  02e9               L1311:
2286                     ; 902 }
2289  02e9 85            	popw	x
2290  02ea 81            	ret
2324                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2324                     ; 911 {
2325                     	switch	.text
2326  02eb               _TIM1_SetCompare1:
2330                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2332  02eb 9e            	ld	a,xh
2333  02ec c752c6        	ld	21190,a
2334                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2336  02ef 9f            	ld	a,xl
2337  02f0 c752c7        	ld	21191,a
2338                     ; 916 }
2341  02f3 81            	ret
2375                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2375                     ; 925 {
2376                     	switch	.text
2377  02f4               _TIM1_SetCompare2:
2381                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2383  02f4 9e            	ld	a,xh
2384  02f5 c752c8        	ld	21192,a
2385                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2387  02f8 9f            	ld	a,xl
2388  02f9 c752c9        	ld	21193,a
2389                     ; 929 }
2392  02fc 81            	ret
2426                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2426                     ; 938 {
2427                     	switch	.text
2428  02fd               _TIM1_SetCompare3:
2432                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2434  02fd 9e            	ld	a,xh
2435  02fe c752ca        	ld	21194,a
2436                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2438  0301 9f            	ld	a,xl
2439  0302 c752cb        	ld	21195,a
2440                     ; 942 }
2443  0305 81            	ret
2477                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2477                     ; 951 {
2478                     	switch	.text
2479  0306               _TIM1_SetCompare4:
2483                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2485  0306 9e            	ld	a,xh
2486  0307 c752cc        	ld	21196,a
2487                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2489  030a 9f            	ld	a,xl
2490  030b c752cd        	ld	21197,a
2491                     ; 955 }
2494  030e 81            	ret
2530                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2530                     ; 964 {
2531                     	switch	.text
2532  030f               _TIM1_CCPreloadControl:
2536                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2538                     ; 969   if (NewState != DISABLE)
2540  030f 4d            	tnz	a
2541  0310 2706          	jreq	L5421
2542                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2544  0312 721052b1      	bset	21169,#0
2546  0316 2004          	jra	L7421
2547  0318               L5421:
2548                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2550  0318 721152b1      	bres	21169,#0
2551  031c               L7421:
2552                     ; 977 }
2555  031c 81            	ret
2613                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2613                     ; 988 {
2614                     	switch	.text
2615  031d               _TIM1_ForcedOC1Config:
2617  031d 88            	push	a
2618       00000000      OFST:	set	0
2621                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2623                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2625  031e c652b9        	ld	a,21177
2626  0321 a48f          	and	a,#143
2627  0323 1a01          	or	a,(OFST+1,sp)
2628  0325 c752b9        	ld	21177,a
2629                     ; 994 }
2632  0328 84            	pop	a
2633  0329 81            	ret
2669                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2669                     ; 1005 {
2670                     	switch	.text
2671  032a               _TIM1_ForcedOC2Config:
2673  032a 88            	push	a
2674       00000000      OFST:	set	0
2677                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2679                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2681  032b c652ba        	ld	a,21178
2682  032e a48f          	and	a,#143
2683  0330 1a01          	or	a,(OFST+1,sp)
2684  0332 c752ba        	ld	21178,a
2685                     ; 1011 }
2688  0335 84            	pop	a
2689  0336 81            	ret
2725                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2725                     ; 1022 {
2726                     	switch	.text
2727  0337               _TIM1_ForcedOC3Config:
2729  0337 88            	push	a
2730       00000000      OFST:	set	0
2733                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2735                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2737  0338 c652bb        	ld	a,21179
2738  033b a48f          	and	a,#143
2739  033d 1a01          	or	a,(OFST+1,sp)
2740  033f c752bb        	ld	21179,a
2741                     ; 1028 }
2744  0342 84            	pop	a
2745  0343 81            	ret
2781                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2781                     ; 1037 {
2782                     	switch	.text
2783  0344               _TIM1_OC1PreloadConfig:
2787                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2789                     ; 1042   if (NewState != DISABLE)
2791  0344 4d            	tnz	a
2792  0345 2706          	jreq	L1531
2793                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2795  0347 721652b9      	bset	21177,#3
2797  034b 2004          	jra	L3531
2798  034d               L1531:
2799                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2801  034d 721752b9      	bres	21177,#3
2802  0351               L3531:
2803                     ; 1050 }
2806  0351 81            	ret
2842                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2842                     ; 1059 {
2843                     	switch	.text
2844  0352               _TIM1_OC2PreloadConfig:
2848                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2850                     ; 1064   if (NewState != DISABLE)
2852  0352 4d            	tnz	a
2853  0353 2706          	jreq	L3731
2854                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2856  0355 721652ba      	bset	21178,#3
2858  0359 2004          	jra	L5731
2859  035b               L3731:
2860                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2862  035b 721752ba      	bres	21178,#3
2863  035f               L5731:
2864                     ; 1072 }
2867  035f 81            	ret
2903                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2903                     ; 1081 {
2904                     	switch	.text
2905  0360               _TIM1_OC3PreloadConfig:
2909                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2911                     ; 1086   if (NewState != DISABLE)
2913  0360 4d            	tnz	a
2914  0361 2706          	jreq	L5141
2915                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2917  0363 721652bb      	bset	21179,#3
2919  0367 2004          	jra	L7141
2920  0369               L5141:
2921                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2923  0369 721752bb      	bres	21179,#3
2924  036d               L7141:
2925                     ; 1094 }
2928  036d 81            	ret
2964                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2964                     ; 1103 {
2965                     	switch	.text
2966  036e               _TIM1_OC4PreloadConfig:
2970                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2972                     ; 1108   if (NewState != DISABLE)
2974  036e 4d            	tnz	a
2975  036f 2706          	jreq	L7341
2976                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2978  0371 721652bc      	bset	21180,#3
2980  0375 2004          	jra	L1441
2981  0377               L7341:
2982                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2984  0377 721752bc      	bres	21180,#3
2985  037b               L1441:
2986                     ; 1116 }
2989  037b 81            	ret
3024                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3024                     ; 1125 {
3025                     	switch	.text
3026  037c               _TIM1_OC1FastConfig:
3030                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3032                     ; 1130   if (NewState != DISABLE)
3034  037c 4d            	tnz	a
3035  037d 2706          	jreq	L1641
3036                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3038  037f 721452b9      	bset	21177,#2
3040  0383 2004          	jra	L3641
3041  0385               L1641:
3042                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3044  0385 721552b9      	bres	21177,#2
3045  0389               L3641:
3046                     ; 1138 }
3049  0389 81            	ret
3084                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3084                     ; 1147 {
3085                     	switch	.text
3086  038a               _TIM1_OC2FastConfig:
3090                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3092                     ; 1152   if (NewState != DISABLE)
3094  038a 4d            	tnz	a
3095  038b 2706          	jreq	L3051
3096                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3098  038d 721452ba      	bset	21178,#2
3100  0391 2004          	jra	L5051
3101  0393               L3051:
3102                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3104  0393 721552ba      	bres	21178,#2
3105  0397               L5051:
3106                     ; 1160 }
3109  0397 81            	ret
3144                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3144                     ; 1169 {
3145                     	switch	.text
3146  0398               _TIM1_OC3FastConfig:
3150                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3152                     ; 1174   if (NewState != DISABLE)
3154  0398 4d            	tnz	a
3155  0399 2706          	jreq	L5251
3156                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3158  039b 721452bb      	bset	21179,#2
3160  039f 2004          	jra	L7251
3161  03a1               L5251:
3162                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3164  03a1 721552bb      	bres	21179,#2
3165  03a5               L7251:
3166                     ; 1182 }
3169  03a5 81            	ret
3204                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3204                     ; 1191 {
3205                     	switch	.text
3206  03a6               _TIM1_ClearOC1Ref:
3210                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3212                     ; 1196   if (NewState != DISABLE)
3214  03a6 4d            	tnz	a
3215  03a7 2706          	jreq	L7451
3216                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3218  03a9 721e52b9      	bset	21177,#7
3220  03ad 2004          	jra	L1551
3221  03af               L7451:
3222                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3224  03af 721f52b9      	bres	21177,#7
3225  03b3               L1551:
3226                     ; 1204 }
3229  03b3 81            	ret
3264                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3264                     ; 1213 {
3265                     	switch	.text
3266  03b4               _TIM1_ClearOC2Ref:
3270                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3272                     ; 1218   if (NewState != DISABLE)
3274  03b4 4d            	tnz	a
3275  03b5 2706          	jreq	L1751
3276                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3278  03b7 721e52ba      	bset	21178,#7
3280  03bb 2004          	jra	L3751
3281  03bd               L1751:
3282                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3284  03bd 721f52ba      	bres	21178,#7
3285  03c1               L3751:
3286                     ; 1226 }
3289  03c1 81            	ret
3324                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3324                     ; 1235 {
3325                     	switch	.text
3326  03c2               _TIM1_ClearOC3Ref:
3330                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3332                     ; 1240   if (NewState != DISABLE)
3334  03c2 4d            	tnz	a
3335  03c3 2706          	jreq	L3161
3336                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3338  03c5 721e52bb      	bset	21179,#7
3340  03c9 2004          	jra	L5161
3341  03cb               L3161:
3342                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3344  03cb 721f52bb      	bres	21179,#7
3345  03cf               L5161:
3346                     ; 1248 }
3349  03cf 81            	ret
3384                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3384                     ; 1257 {
3385                     	switch	.text
3386  03d0               _TIM1_ClearOC4Ref:
3390                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3392                     ; 1262   if (NewState != DISABLE)
3394  03d0 4d            	tnz	a
3395  03d1 2706          	jreq	L5361
3396                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3398  03d3 721e52bc      	bset	21180,#7
3400  03d7 2004          	jra	L7361
3401  03d9               L5361:
3402                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3404  03d9 721f52bc      	bres	21180,#7
3405  03dd               L7361:
3406                     ; 1270 }
3409  03dd 81            	ret
3445                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3445                     ; 1281 {
3446                     	switch	.text
3447  03de               _TIM1_OC1PolarityConfig:
3451                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3453                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3455  03de 4d            	tnz	a
3456  03df 2706          	jreq	L7561
3457                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3459  03e1 721252bd      	bset	21181,#1
3461  03e5 2004          	jra	L1661
3462  03e7               L7561:
3463                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3465  03e7 721352bd      	bres	21181,#1
3466  03eb               L1661:
3467                     ; 1294 }
3470  03eb 81            	ret
3506                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3506                     ; 1305 {
3507                     	switch	.text
3508  03ec               _TIM1_OC1NPolarityConfig:
3512                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3514                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3516  03ec 4d            	tnz	a
3517  03ed 2706          	jreq	L1071
3518                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3520  03ef 721652bd      	bset	21181,#3
3522  03f3 2004          	jra	L3071
3523  03f5               L1071:
3524                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3526  03f5 721752bd      	bres	21181,#3
3527  03f9               L3071:
3528                     ; 1318 }
3531  03f9 81            	ret
3567                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3567                     ; 1329 {
3568                     	switch	.text
3569  03fa               _TIM1_OC2PolarityConfig:
3573                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3575                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3577  03fa 4d            	tnz	a
3578  03fb 2706          	jreq	L3271
3579                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3581  03fd 721a52bd      	bset	21181,#5
3583  0401 2004          	jra	L5271
3584  0403               L3271:
3585                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3587  0403 721b52bd      	bres	21181,#5
3588  0407               L5271:
3589                     ; 1342 }
3592  0407 81            	ret
3628                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3628                     ; 1353 {
3629                     	switch	.text
3630  0408               _TIM1_OC2NPolarityConfig:
3634                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3636                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3638  0408 4d            	tnz	a
3639  0409 2706          	jreq	L5471
3640                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3642  040b 721e52bd      	bset	21181,#7
3644  040f 2004          	jra	L7471
3645  0411               L5471:
3646                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3648  0411 721f52bd      	bres	21181,#7
3649  0415               L7471:
3650                     ; 1366 }
3653  0415 81            	ret
3689                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3689                     ; 1377 {
3690                     	switch	.text
3691  0416               _TIM1_OC3PolarityConfig:
3695                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3697                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3699  0416 4d            	tnz	a
3700  0417 2706          	jreq	L7671
3701                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3703  0419 721252be      	bset	21182,#1
3705  041d 2004          	jra	L1771
3706  041f               L7671:
3707                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3709  041f 721352be      	bres	21182,#1
3710  0423               L1771:
3711                     ; 1390 }
3714  0423 81            	ret
3750                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3750                     ; 1401 {
3751                     	switch	.text
3752  0424               _TIM1_OC3NPolarityConfig:
3756                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3758                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3760  0424 4d            	tnz	a
3761  0425 2706          	jreq	L1102
3762                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3764  0427 721652be      	bset	21182,#3
3766  042b 2004          	jra	L3102
3767  042d               L1102:
3768                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3770  042d 721752be      	bres	21182,#3
3771  0431               L3102:
3772                     ; 1414 }
3775  0431 81            	ret
3834                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3834                     ; 1425 {
3835                     	switch	.text
3836  0432               _TIM1_SelectOCREFClear:
3840                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3842                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3844  0432 721752b2      	bres	21170,#3
3845                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3847  0436 ca52b2        	or	a,21170
3848  0439 c752b2        	ld	21170,a
3849                     ; 1432 }
3852  043c 81            	ret
3887                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3887                     ; 1441 {
3888                     	switch	.text
3889  043d               _TIM1_SelectCOM:
3893                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3895                     ; 1446   if (NewState != DISABLE)
3897  043d 4d            	tnz	a
3898  043e 2706          	jreq	L1602
3899                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3901  0440 721452b1      	bset	21169,#2
3903  0444 2004          	jra	L3602
3904  0446               L1602:
3905                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3907  0446 721552b1      	bres	21169,#2
3908  044a               L3602:
3909                     ; 1454 }
3912  044a 81            	ret
3957                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3957                     ; 1469 {
3958                     	switch	.text
3959  044b               _TIM1_CCxCmd:
3961  044b 89            	pushw	x
3962       00000000      OFST:	set	0
3965                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3967                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3969                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3971  044c 9e            	ld	a,xh
3972  044d 4d            	tnz	a
3973  044e 2610          	jrne	L7012
3974                     ; 1477     if (NewState != DISABLE)
3976  0450 9f            	ld	a,xl
3977  0451 4d            	tnz	a
3978  0452 2706          	jreq	L1112
3979                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3981  0454 721052bd      	bset	21181,#0
3983  0458 2040          	jra	L5112
3984  045a               L1112:
3985                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3987  045a 721152bd      	bres	21181,#0
3988  045e 203a          	jra	L5112
3989  0460               L7012:
3990                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3992  0460 7b01          	ld	a,(OFST+1,sp)
3993  0462 a101          	cp	a,#1
3994  0464 2610          	jrne	L7112
3995                     ; 1489     if (NewState != DISABLE)
3997  0466 0d02          	tnz	(OFST+2,sp)
3998  0468 2706          	jreq	L1212
3999                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
4001  046a 721852bd      	bset	21181,#4
4003  046e 202a          	jra	L5112
4004  0470               L1212:
4005                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
4007  0470 721952bd      	bres	21181,#4
4008  0474 2024          	jra	L5112
4009  0476               L7112:
4010                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
4012  0476 7b01          	ld	a,(OFST+1,sp)
4013  0478 a102          	cp	a,#2
4014  047a 2610          	jrne	L7212
4015                     ; 1501     if (NewState != DISABLE)
4017  047c 0d02          	tnz	(OFST+2,sp)
4018  047e 2706          	jreq	L1312
4019                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4021  0480 721052be      	bset	21182,#0
4023  0484 2014          	jra	L5112
4024  0486               L1312:
4025                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4027  0486 721152be      	bres	21182,#0
4028  048a 200e          	jra	L5112
4029  048c               L7212:
4030                     ; 1513     if (NewState != DISABLE)
4032  048c 0d02          	tnz	(OFST+2,sp)
4033  048e 2706          	jreq	L7312
4034                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4036  0490 721852be      	bset	21182,#4
4038  0494 2004          	jra	L5112
4039  0496               L7312:
4040                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4042  0496 721952be      	bres	21182,#4
4043  049a               L5112:
4044                     ; 1522 }
4047  049a 85            	popw	x
4048  049b 81            	ret
4093                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4093                     ; 1536 {
4094                     	switch	.text
4095  049c               _TIM1_CCxNCmd:
4097  049c 89            	pushw	x
4098       00000000      OFST:	set	0
4101                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4103                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4105                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4107  049d 9e            	ld	a,xh
4108  049e 4d            	tnz	a
4109  049f 2610          	jrne	L5612
4110                     ; 1544     if (NewState != DISABLE)
4112  04a1 9f            	ld	a,xl
4113  04a2 4d            	tnz	a
4114  04a3 2706          	jreq	L7612
4115                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4117  04a5 721452bd      	bset	21181,#2
4119  04a9 202a          	jra	L3712
4120  04ab               L7612:
4121                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4123  04ab 721552bd      	bres	21181,#2
4124  04af 2024          	jra	L3712
4125  04b1               L5612:
4126                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4128  04b1 7b01          	ld	a,(OFST+1,sp)
4129  04b3 a101          	cp	a,#1
4130  04b5 2610          	jrne	L5712
4131                     ; 1556     if (NewState != DISABLE)
4133  04b7 0d02          	tnz	(OFST+2,sp)
4134  04b9 2706          	jreq	L7712
4135                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4137  04bb 721c52bd      	bset	21181,#6
4139  04bf 2014          	jra	L3712
4140  04c1               L7712:
4141                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4143  04c1 721d52bd      	bres	21181,#6
4144  04c5 200e          	jra	L3712
4145  04c7               L5712:
4146                     ; 1568     if (NewState != DISABLE)
4148  04c7 0d02          	tnz	(OFST+2,sp)
4149  04c9 2706          	jreq	L5022
4150                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4152  04cb 721452be      	bset	21182,#2
4154  04cf 2004          	jra	L3712
4155  04d1               L5022:
4156                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4158  04d1 721552be      	bres	21182,#2
4159  04d5               L3712:
4160                     ; 1577 }
4163  04d5 85            	popw	x
4164  04d6 81            	ret
4332                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4332                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4332                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4332                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4332                     ; 1668                  uint8_t TIM1_ICFilter)
4332                     ; 1669 {
4333                     	switch	.text
4334  04d7               _TIM1_ICInit:
4336  04d7 89            	pushw	x
4337       00000000      OFST:	set	0
4340                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4342                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4344                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4346                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4348                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4350                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4352  04d8 9e            	ld	a,xh
4353  04d9 4d            	tnz	a
4354  04da 2614          	jrne	L5032
4355                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4357  04dc 7b07          	ld	a,(OFST+7,sp)
4358  04de 88            	push	a
4359  04df 7b06          	ld	a,(OFST+6,sp)
4360  04e1 97            	ld	xl,a
4361  04e2 7b03          	ld	a,(OFST+3,sp)
4362  04e4 95            	ld	xh,a
4363  04e5 cd080b        	call	L3_TI1_Config
4365  04e8 84            	pop	a
4366                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4368  04e9 7b06          	ld	a,(OFST+6,sp)
4369  04eb cd0640        	call	_TIM1_SetIC1Prescaler
4372  04ee 2046          	jra	L7032
4373  04f0               L5032:
4374                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4376  04f0 7b01          	ld	a,(OFST+1,sp)
4377  04f2 a101          	cp	a,#1
4378  04f4 2614          	jrne	L1132
4379                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4381  04f6 7b07          	ld	a,(OFST+7,sp)
4382  04f8 88            	push	a
4383  04f9 7b06          	ld	a,(OFST+6,sp)
4384  04fb 97            	ld	xl,a
4385  04fc 7b03          	ld	a,(OFST+3,sp)
4386  04fe 95            	ld	xh,a
4387  04ff cd083b        	call	L5_TI2_Config
4389  0502 84            	pop	a
4390                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4392  0503 7b06          	ld	a,(OFST+6,sp)
4393  0505 cd064d        	call	_TIM1_SetIC2Prescaler
4396  0508 202c          	jra	L7032
4397  050a               L1132:
4398                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4400  050a 7b01          	ld	a,(OFST+1,sp)
4401  050c a102          	cp	a,#2
4402  050e 2614          	jrne	L5132
4403                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4405  0510 7b07          	ld	a,(OFST+7,sp)
4406  0512 88            	push	a
4407  0513 7b06          	ld	a,(OFST+6,sp)
4408  0515 97            	ld	xl,a
4409  0516 7b03          	ld	a,(OFST+3,sp)
4410  0518 95            	ld	xh,a
4411  0519 cd086b        	call	L7_TI3_Config
4413  051c 84            	pop	a
4414                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4416  051d 7b06          	ld	a,(OFST+6,sp)
4417  051f cd065a        	call	_TIM1_SetIC3Prescaler
4420  0522 2012          	jra	L7032
4421  0524               L5132:
4422                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4424  0524 7b07          	ld	a,(OFST+7,sp)
4425  0526 88            	push	a
4426  0527 7b06          	ld	a,(OFST+6,sp)
4427  0529 97            	ld	xl,a
4428  052a 7b03          	ld	a,(OFST+3,sp)
4429  052c 95            	ld	xh,a
4430  052d cd089b        	call	L11_TI4_Config
4432  0530 84            	pop	a
4433                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4435  0531 7b06          	ld	a,(OFST+6,sp)
4436  0533 cd0667        	call	_TIM1_SetIC4Prescaler
4438  0536               L7032:
4439                     ; 1706 }
4442  0536 85            	popw	x
4443  0537 81            	ret
4541                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4541                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4541                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4541                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4541                     ; 1737                      uint8_t TIM1_ICFilter)
4541                     ; 1738 {
4542                     	switch	.text
4543  0538               _TIM1_PWMIConfig:
4545  0538 89            	pushw	x
4546  0539 89            	pushw	x
4547       00000002      OFST:	set	2
4550                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4552                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4554                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4556                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4558                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4560                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4562                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4564  053a 9f            	ld	a,xl
4565  053b a101          	cp	a,#1
4566  053d 2706          	jreq	L7632
4567                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4569  053f a601          	ld	a,#1
4570  0541 6b01          	ld	(OFST-1,sp),a
4573  0543 2002          	jra	L1732
4574  0545               L7632:
4575                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4577  0545 0f01          	clr	(OFST-1,sp)
4579  0547               L1732:
4580                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4582  0547 7b07          	ld	a,(OFST+5,sp)
4583  0549 a101          	cp	a,#1
4584  054b 2606          	jrne	L3732
4585                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4587  054d a602          	ld	a,#2
4588  054f 6b02          	ld	(OFST+0,sp),a
4591  0551 2004          	jra	L5732
4592  0553               L3732:
4593                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4595  0553 a601          	ld	a,#1
4596  0555 6b02          	ld	(OFST+0,sp),a
4598  0557               L5732:
4599                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4601  0557 0d03          	tnz	(OFST+1,sp)
4602  0559 2626          	jrne	L7732
4603                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4605  055b 7b09          	ld	a,(OFST+7,sp)
4606  055d 88            	push	a
4607  055e 7b08          	ld	a,(OFST+6,sp)
4608  0560 97            	ld	xl,a
4609  0561 7b05          	ld	a,(OFST+3,sp)
4610  0563 95            	ld	xh,a
4611  0564 cd080b        	call	L3_TI1_Config
4613  0567 84            	pop	a
4614                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4616  0568 7b08          	ld	a,(OFST+6,sp)
4617  056a cd0640        	call	_TIM1_SetIC1Prescaler
4619                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4621  056d 7b09          	ld	a,(OFST+7,sp)
4622  056f 88            	push	a
4623  0570 7b03          	ld	a,(OFST+1,sp)
4624  0572 97            	ld	xl,a
4625  0573 7b02          	ld	a,(OFST+0,sp)
4626  0575 95            	ld	xh,a
4627  0576 cd083b        	call	L5_TI2_Config
4629  0579 84            	pop	a
4630                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4632  057a 7b08          	ld	a,(OFST+6,sp)
4633  057c cd064d        	call	_TIM1_SetIC2Prescaler
4636  057f 2024          	jra	L1042
4637  0581               L7732:
4638                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4640  0581 7b09          	ld	a,(OFST+7,sp)
4641  0583 88            	push	a
4642  0584 7b08          	ld	a,(OFST+6,sp)
4643  0586 97            	ld	xl,a
4644  0587 7b05          	ld	a,(OFST+3,sp)
4645  0589 95            	ld	xh,a
4646  058a cd083b        	call	L5_TI2_Config
4648  058d 84            	pop	a
4649                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4651  058e 7b08          	ld	a,(OFST+6,sp)
4652  0590 cd064d        	call	_TIM1_SetIC2Prescaler
4654                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4656  0593 7b09          	ld	a,(OFST+7,sp)
4657  0595 88            	push	a
4658  0596 7b03          	ld	a,(OFST+1,sp)
4659  0598 97            	ld	xl,a
4660  0599 7b02          	ld	a,(OFST+0,sp)
4661  059b 95            	ld	xh,a
4662  059c cd080b        	call	L3_TI1_Config
4664  059f 84            	pop	a
4665                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4667  05a0 7b08          	ld	a,(OFST+6,sp)
4668  05a2 cd0640        	call	_TIM1_SetIC1Prescaler
4670  05a5               L1042:
4671                     ; 1796 }
4674  05a5 5b04          	addw	sp,#4
4675  05a7 81            	ret
4727                     ; 1803 uint16_t TIM1_GetCapture1(void)
4727                     ; 1804 {
4728                     	switch	.text
4729  05a8               _TIM1_GetCapture1:
4731  05a8 5204          	subw	sp,#4
4732       00000004      OFST:	set	4
4735                     ; 1807   uint16_t tmpccr1 = 0;
4737                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4741                     ; 1810   tmpccr1h = TIM1->CCR1H;
4743  05aa c652c6        	ld	a,21190
4744  05ad 6b02          	ld	(OFST-2,sp),a
4746                     ; 1811   tmpccr1l = TIM1->CCR1L;
4748  05af c652c7        	ld	a,21191
4749  05b2 6b01          	ld	(OFST-3,sp),a
4751                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4753  05b4 7b01          	ld	a,(OFST-3,sp)
4754  05b6 5f            	clrw	x
4755  05b7 97            	ld	xl,a
4756  05b8 1f03          	ldw	(OFST-1,sp),x
4758                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4760  05ba 7b02          	ld	a,(OFST-2,sp)
4761  05bc 5f            	clrw	x
4762  05bd 97            	ld	xl,a
4763  05be 4f            	clr	a
4764  05bf 02            	rlwa	x,a
4765  05c0 01            	rrwa	x,a
4766  05c1 1a04          	or	a,(OFST+0,sp)
4767  05c3 01            	rrwa	x,a
4768  05c4 1a03          	or	a,(OFST-1,sp)
4769  05c6 01            	rrwa	x,a
4770  05c7 1f03          	ldw	(OFST-1,sp),x
4772                     ; 1816   return (uint16_t)tmpccr1;
4774  05c9 1e03          	ldw	x,(OFST-1,sp)
4777  05cb 5b04          	addw	sp,#4
4778  05cd 81            	ret
4830                     ; 1824 uint16_t TIM1_GetCapture2(void)
4830                     ; 1825 {
4831                     	switch	.text
4832  05ce               _TIM1_GetCapture2:
4834  05ce 5204          	subw	sp,#4
4835       00000004      OFST:	set	4
4838                     ; 1828   uint16_t tmpccr2 = 0;
4840                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4844                     ; 1831   tmpccr2h = TIM1->CCR2H;
4846  05d0 c652c8        	ld	a,21192
4847  05d3 6b02          	ld	(OFST-2,sp),a
4849                     ; 1832   tmpccr2l = TIM1->CCR2L;
4851  05d5 c652c9        	ld	a,21193
4852  05d8 6b01          	ld	(OFST-3,sp),a
4854                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4856  05da 7b01          	ld	a,(OFST-3,sp)
4857  05dc 5f            	clrw	x
4858  05dd 97            	ld	xl,a
4859  05de 1f03          	ldw	(OFST-1,sp),x
4861                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4863  05e0 7b02          	ld	a,(OFST-2,sp)
4864  05e2 5f            	clrw	x
4865  05e3 97            	ld	xl,a
4866  05e4 4f            	clr	a
4867  05e5 02            	rlwa	x,a
4868  05e6 01            	rrwa	x,a
4869  05e7 1a04          	or	a,(OFST+0,sp)
4870  05e9 01            	rrwa	x,a
4871  05ea 1a03          	or	a,(OFST-1,sp)
4872  05ec 01            	rrwa	x,a
4873  05ed 1f03          	ldw	(OFST-1,sp),x
4875                     ; 1837   return (uint16_t)tmpccr2;
4877  05ef 1e03          	ldw	x,(OFST-1,sp)
4880  05f1 5b04          	addw	sp,#4
4881  05f3 81            	ret
4933                     ; 1845 uint16_t TIM1_GetCapture3(void)
4933                     ; 1846 {
4934                     	switch	.text
4935  05f4               _TIM1_GetCapture3:
4937  05f4 5204          	subw	sp,#4
4938       00000004      OFST:	set	4
4941                     ; 1848   uint16_t tmpccr3 = 0;
4943                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4947                     ; 1851   tmpccr3h = TIM1->CCR3H;
4949  05f6 c652ca        	ld	a,21194
4950  05f9 6b02          	ld	(OFST-2,sp),a
4952                     ; 1852   tmpccr3l = TIM1->CCR3L;
4954  05fb c652cb        	ld	a,21195
4955  05fe 6b01          	ld	(OFST-3,sp),a
4957                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4959  0600 7b01          	ld	a,(OFST-3,sp)
4960  0602 5f            	clrw	x
4961  0603 97            	ld	xl,a
4962  0604 1f03          	ldw	(OFST-1,sp),x
4964                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4966  0606 7b02          	ld	a,(OFST-2,sp)
4967  0608 5f            	clrw	x
4968  0609 97            	ld	xl,a
4969  060a 4f            	clr	a
4970  060b 02            	rlwa	x,a
4971  060c 01            	rrwa	x,a
4972  060d 1a04          	or	a,(OFST+0,sp)
4973  060f 01            	rrwa	x,a
4974  0610 1a03          	or	a,(OFST-1,sp)
4975  0612 01            	rrwa	x,a
4976  0613 1f03          	ldw	(OFST-1,sp),x
4978                     ; 1857   return (uint16_t)tmpccr3;
4980  0615 1e03          	ldw	x,(OFST-1,sp)
4983  0617 5b04          	addw	sp,#4
4984  0619 81            	ret
5036                     ; 1865 uint16_t TIM1_GetCapture4(void)
5036                     ; 1866 {
5037                     	switch	.text
5038  061a               _TIM1_GetCapture4:
5040  061a 5204          	subw	sp,#4
5041       00000004      OFST:	set	4
5044                     ; 1868   uint16_t tmpccr4 = 0;
5046                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5050                     ; 1871   tmpccr4h = TIM1->CCR4H;
5052  061c c652cc        	ld	a,21196
5053  061f 6b02          	ld	(OFST-2,sp),a
5055                     ; 1872   tmpccr4l = TIM1->CCR4L;
5057  0621 c652cd        	ld	a,21197
5058  0624 6b01          	ld	(OFST-3,sp),a
5060                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5062  0626 7b01          	ld	a,(OFST-3,sp)
5063  0628 5f            	clrw	x
5064  0629 97            	ld	xl,a
5065  062a 1f03          	ldw	(OFST-1,sp),x
5067                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5069  062c 7b02          	ld	a,(OFST-2,sp)
5070  062e 5f            	clrw	x
5071  062f 97            	ld	xl,a
5072  0630 4f            	clr	a
5073  0631 02            	rlwa	x,a
5074  0632 01            	rrwa	x,a
5075  0633 1a04          	or	a,(OFST+0,sp)
5076  0635 01            	rrwa	x,a
5077  0636 1a03          	or	a,(OFST-1,sp)
5078  0638 01            	rrwa	x,a
5079  0639 1f03          	ldw	(OFST-1,sp),x
5081                     ; 1877   return (uint16_t)tmpccr4;
5083  063b 1e03          	ldw	x,(OFST-1,sp)
5086  063d 5b04          	addw	sp,#4
5087  063f 81            	ret
5123                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5123                     ; 1891 {
5124                     	switch	.text
5125  0640               _TIM1_SetIC1Prescaler:
5127  0640 88            	push	a
5128       00000000      OFST:	set	0
5131                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5133                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5135  0641 c652b9        	ld	a,21177
5136  0644 a4f3          	and	a,#243
5137  0646 1a01          	or	a,(OFST+1,sp)
5138  0648 c752b9        	ld	21177,a
5139                     ; 1897 }
5142  064b 84            	pop	a
5143  064c 81            	ret
5179                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5179                     ; 1910 {
5180                     	switch	.text
5181  064d               _TIM1_SetIC2Prescaler:
5183  064d 88            	push	a
5184       00000000      OFST:	set	0
5187                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5189                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5191  064e c652ba        	ld	a,21178
5192  0651 a4f3          	and	a,#243
5193  0653 1a01          	or	a,(OFST+1,sp)
5194  0655 c752ba        	ld	21178,a
5195                     ; 1916 }
5198  0658 84            	pop	a
5199  0659 81            	ret
5235                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5235                     ; 1929 {
5236                     	switch	.text
5237  065a               _TIM1_SetIC3Prescaler:
5239  065a 88            	push	a
5240       00000000      OFST:	set	0
5243                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5245                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5247  065b c652bb        	ld	a,21179
5248  065e a4f3          	and	a,#243
5249  0660 1a01          	or	a,(OFST+1,sp)
5250  0662 c752bb        	ld	21179,a
5251                     ; 1936 }
5254  0665 84            	pop	a
5255  0666 81            	ret
5291                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5291                     ; 1949 {
5292                     	switch	.text
5293  0667               _TIM1_SetIC4Prescaler:
5295  0667 88            	push	a
5296       00000000      OFST:	set	0
5299                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5301                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5303  0668 c652bc        	ld	a,21180
5304  066b a4f3          	and	a,#243
5305  066d 1a01          	or	a,(OFST+1,sp)
5306  066f c752bc        	ld	21180,a
5307                     ; 1956 }
5310  0672 84            	pop	a
5311  0673 81            	ret
5418                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5418                     ; 1992 {
5419                     	switch	.text
5420  0674               _TIM1_ITConfig:
5422  0674 89            	pushw	x
5423       00000000      OFST:	set	0
5426                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5428                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5430                     ; 1997   if (NewState != DISABLE)
5432  0675 9f            	ld	a,xl
5433  0676 4d            	tnz	a
5434  0677 2709          	jreq	L1762
5435                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5437  0679 9e            	ld	a,xh
5438  067a ca52b5        	or	a,21173
5439  067d c752b5        	ld	21173,a
5441  0680 2009          	jra	L3762
5442  0682               L1762:
5443                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5445  0682 7b01          	ld	a,(OFST+1,sp)
5446  0684 43            	cpl	a
5447  0685 c452b5        	and	a,21173
5448  0688 c752b5        	ld	21173,a
5449  068b               L3762:
5450                     ; 2007 }
5453  068b 85            	popw	x
5454  068c 81            	ret
5559                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5559                     ; 2024 {
5560                     	switch	.text
5561  068d               _TIM1_GenerateEvent:
5565                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5567                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5569  068d c752b8        	ld	21176,a
5570                     ; 2030 }
5573  0690 81            	ret
5747                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5747                     ; 2050 {
5748                     	switch	.text
5749  0691               _TIM1_GetFlagStatus:
5751  0691 89            	pushw	x
5752  0692 89            	pushw	x
5753       00000002      OFST:	set	2
5756                     ; 2051   FlagStatus bitstatus = RESET;
5758                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5762                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5764                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5766  0693 9f            	ld	a,xl
5767  0694 c452b6        	and	a,21174
5768  0697 6b01          	ld	(OFST-1,sp),a
5770                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5772  0699 c652b7        	ld	a,21175
5773  069c 1403          	and	a,(OFST+1,sp)
5774  069e 6b02          	ld	(OFST+0,sp),a
5776                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5778  06a0 7b01          	ld	a,(OFST-1,sp)
5779  06a2 1a02          	or	a,(OFST+0,sp)
5780  06a4 2706          	jreq	L5303
5781                     ; 2062     bitstatus = SET;
5783  06a6 a601          	ld	a,#1
5784  06a8 6b02          	ld	(OFST+0,sp),a
5787  06aa 2002          	jra	L7303
5788  06ac               L5303:
5789                     ; 2066     bitstatus = RESET;
5791  06ac 0f02          	clr	(OFST+0,sp)
5793  06ae               L7303:
5794                     ; 2068   return (FlagStatus)(bitstatus);
5796  06ae 7b02          	ld	a,(OFST+0,sp)
5799  06b0 5b04          	addw	sp,#4
5800  06b2 81            	ret
5835                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5835                     ; 2090 {
5836                     	switch	.text
5837  06b3               _TIM1_ClearFlag:
5839  06b3 89            	pushw	x
5840       00000000      OFST:	set	0
5843                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5845                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5847  06b4 9f            	ld	a,xl
5848  06b5 43            	cpl	a
5849  06b6 c752b6        	ld	21174,a
5850                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5852  06b9 7b01          	ld	a,(OFST+1,sp)
5853  06bb 43            	cpl	a
5854  06bc a41e          	and	a,#30
5855  06be c752b7        	ld	21175,a
5856                     ; 2097 }
5859  06c1 85            	popw	x
5860  06c2 81            	ret
5924                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5924                     ; 2115 {
5925                     	switch	.text
5926  06c3               _TIM1_GetITStatus:
5928  06c3 88            	push	a
5929  06c4 89            	pushw	x
5930       00000002      OFST:	set	2
5933                     ; 2116   ITStatus bitstatus = RESET;
5935                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5939                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5941                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5943  06c5 c452b6        	and	a,21174
5944  06c8 6b01          	ld	(OFST-1,sp),a
5946                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5948  06ca c652b5        	ld	a,21173
5949  06cd 1403          	and	a,(OFST+1,sp)
5950  06cf 6b02          	ld	(OFST+0,sp),a
5952                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5954  06d1 0d01          	tnz	(OFST-1,sp)
5955  06d3 270a          	jreq	L1113
5957  06d5 0d02          	tnz	(OFST+0,sp)
5958  06d7 2706          	jreq	L1113
5959                     ; 2129     bitstatus = SET;
5961  06d9 a601          	ld	a,#1
5962  06db 6b02          	ld	(OFST+0,sp),a
5965  06dd 2002          	jra	L3113
5966  06df               L1113:
5967                     ; 2133     bitstatus = RESET;
5969  06df 0f02          	clr	(OFST+0,sp)
5971  06e1               L3113:
5972                     ; 2135   return (ITStatus)(bitstatus);
5974  06e1 7b02          	ld	a,(OFST+0,sp)
5977  06e3 5b03          	addw	sp,#3
5978  06e5 81            	ret
6014                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6014                     ; 2153 {
6015                     	switch	.text
6016  06e6               _TIM1_ClearITPendingBit:
6020                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
6022                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6024  06e6 43            	cpl	a
6025  06e7 c752b6        	ld	21174,a
6026                     ; 2159 }
6029  06ea 81            	ret
6567                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6567                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6567                     ; 2169 {
6568                     	switch	.text
6569  06eb               _TIM1_DMAConfig:
6573                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6575                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6577                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6579  06eb 9e            	ld	a,xh
6580  06ec c752d1        	ld	21201,a
6581                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6583  06ef 9f            	ld	a,xl
6584  06f0 c752d2        	ld	21202,a
6585                     ; 2177 }
6588  06f3 81            	ret
6682                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6682                     ; 2190 {
6683                     	switch	.text
6684  06f4               _TIM1_DMACmd:
6686  06f4 89            	pushw	x
6687       00000000      OFST:	set	0
6690                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6692                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6694                     ; 2195   if (NewState != DISABLE)
6696  06f5 9f            	ld	a,xl
6697  06f6 4d            	tnz	a
6698  06f7 2709          	jreq	L7243
6699                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6701  06f9 9e            	ld	a,xh
6702  06fa ca52b4        	or	a,21172
6703  06fd c752b4        	ld	21172,a
6705  0700 2009          	jra	L1343
6706  0702               L7243:
6707                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6709  0702 7b01          	ld	a,(OFST+1,sp)
6710  0704 43            	cpl	a
6711  0705 c452b4        	and	a,21172
6712  0708 c752b4        	ld	21172,a
6713  070b               L1343:
6714                     ; 2205 }
6717  070b 85            	popw	x
6718  070c 81            	ret
6753                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6753                     ; 2214 {
6754                     	switch	.text
6755  070d               _TIM1_SelectCCDMA:
6759                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6761                     ; 2218   if (NewState != DISABLE)
6763  070d 4d            	tnz	a
6764  070e 2706          	jreq	L1543
6765                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6767  0710 721652b1      	bset	21169,#3
6769  0714 2004          	jra	L3543
6770  0716               L1543:
6771                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6773  0716 721752b1      	bres	21169,#3
6774  071a               L3543:
6775                     ; 2228 }
6778  071a 81            	ret
6802                     ; 2251 void TIM1_InternalClockConfig(void)
6802                     ; 2252 {
6803                     	switch	.text
6804  071b               _TIM1_InternalClockConfig:
6808                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6810  071b c652b2        	ld	a,21170
6811  071e a4f8          	and	a,#248
6812  0720 c752b2        	ld	21170,a
6813                     ; 2255 }
6816  0723 81            	ret
6905                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6905                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6905                     ; 2274                                  uint8_t ICFilter)
6905                     ; 2275 {
6906                     	switch	.text
6907  0724               _TIM1_TIxExternalClockConfig:
6909  0724 89            	pushw	x
6910       00000000      OFST:	set	0
6913                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6915                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6917                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6919                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6921  0725 9e            	ld	a,xh
6922  0726 a160          	cp	a,#96
6923  0728 260e          	jrne	L5253
6924                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6926  072a 7b05          	ld	a,(OFST+5,sp)
6927  072c 88            	push	a
6928  072d 9f            	ld	a,xl
6929  072e ae0001        	ldw	x,#1
6930  0731 95            	ld	xh,a
6931  0732 cd083b        	call	L5_TI2_Config
6933  0735 84            	pop	a
6935  0736 200d          	jra	L7253
6936  0738               L5253:
6937                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6939  0738 7b05          	ld	a,(OFST+5,sp)
6940  073a 88            	push	a
6941  073b 7b03          	ld	a,(OFST+3,sp)
6942  073d ae0001        	ldw	x,#1
6943  0740 95            	ld	xh,a
6944  0741 cd080b        	call	L3_TI1_Config
6946  0744 84            	pop	a
6947  0745               L7253:
6948                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6950  0745 7b01          	ld	a,(OFST+1,sp)
6951  0747 ad34          	call	_TIM1_SelectInputTrigger
6953                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6955  0749 c652b2        	ld	a,21170
6956  074c aa07          	or	a,#7
6957  074e c752b2        	ld	21170,a
6958                     ; 2296 }
6961  0751 85            	popw	x
6962  0752 81            	ret
7079                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7079                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7079                     ; 2316                               uint8_t ExtTRGFilter)
7079                     ; 2317 {
7080                     	switch	.text
7081  0753               _TIM1_ETRClockMode1Config:
7083  0753 89            	pushw	x
7084       00000000      OFST:	set	0
7087                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7089                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7091                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7093                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7095  0754 7b05          	ld	a,(OFST+5,sp)
7096  0756 88            	push	a
7097  0757 9f            	ld	a,xl
7098  0758 97            	ld	xl,a
7099  0759 7b02          	ld	a,(OFST+2,sp)
7100  075b 95            	ld	xh,a
7101  075c ad54          	call	_TIM1_ETRConfig
7103  075e 84            	pop	a
7104                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7104                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7106  075f c652b2        	ld	a,21170
7107  0762 a488          	and	a,#136
7108  0764 aa77          	or	a,#119
7109  0766 c752b2        	ld	21170,a
7110                     ; 2329 }
7113  0769 85            	popw	x
7114  076a 81            	ret
7172                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7172                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7172                     ; 2349                               uint8_t ExtTRGFilter)
7172                     ; 2350 {
7173                     	switch	.text
7174  076b               _TIM1_ETRClockMode2Config:
7176  076b 89            	pushw	x
7177       00000000      OFST:	set	0
7180                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7182                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7184                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7186  076c 7b05          	ld	a,(OFST+5,sp)
7187  076e 88            	push	a
7188  076f 9f            	ld	a,xl
7189  0770 97            	ld	xl,a
7190  0771 7b02          	ld	a,(OFST+2,sp)
7191  0773 95            	ld	xh,a
7192  0774 ad3c          	call	_TIM1_ETRConfig
7194  0776 84            	pop	a
7195                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7197  0777 721c52b3      	bset	21171,#6
7198                     ; 2360 }
7201  077b 85            	popw	x
7202  077c 81            	ret
7309                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7309                     ; 2411 {
7310                     	switch	.text
7311  077d               _TIM1_SelectInputTrigger:
7313  077d 88            	push	a
7314       00000000      OFST:	set	0
7317                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7319                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7321  077e c652b2        	ld	a,21170
7322  0781 a48f          	and	a,#143
7323  0783 1a01          	or	a,(OFST+1,sp)
7324  0785 c752b2        	ld	21170,a
7325                     ; 2417 }
7328  0788 84            	pop	a
7329  0789 81            	ret
7435                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7435                     ; 2434 {
7436                     	switch	.text
7437  078a               _TIM1_SelectOutputTrigger:
7439  078a 88            	push	a
7440       00000000      OFST:	set	0
7443                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7445                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7447  078b c652b1        	ld	a,21169
7448  078e a48f          	and	a,#143
7449  0790 1a01          	or	a,(OFST+1,sp)
7450  0792 c752b1        	ld	21169,a
7451                     ; 2439 }
7454  0795 84            	pop	a
7455  0796 81            	ret
7529                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7529                     ; 2452 {
7530                     	switch	.text
7531  0797               _TIM1_SelectSlaveMode:
7533  0797 88            	push	a
7534       00000000      OFST:	set	0
7537                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7539                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7541  0798 c652b2        	ld	a,21170
7542  079b a4f8          	and	a,#248
7543  079d 1a01          	or	a,(OFST+1,sp)
7544  079f c752b2        	ld	21170,a
7545                     ; 2459 }
7548  07a2 84            	pop	a
7549  07a3 81            	ret
7585                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7585                     ; 2468 {
7586                     	switch	.text
7587  07a4               _TIM1_SelectMasterSlaveMode:
7591                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7593                     ; 2473   if (NewState != DISABLE)
7595  07a4 4d            	tnz	a
7596  07a5 2706          	jreq	L5004
7597                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7599  07a7 721e52b2      	bset	21170,#7
7601  07ab 2004          	jra	L7004
7602  07ad               L5004:
7603                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7605  07ad 721f52b2      	bres	21170,#7
7606  07b1               L7004:
7607                     ; 2481 }
7610  07b1 81            	ret
7666                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7666                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7666                     ; 2501                     uint8_t ExtTRGFilter)
7666                     ; 2502 {
7667                     	switch	.text
7668  07b2               _TIM1_ETRConfig:
7670  07b2 89            	pushw	x
7671       00000000      OFST:	set	0
7674                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7676                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7676                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7676                     ; 2508                          | (uint8_t) ExtTRGFilter);
7678  07b3 9f            	ld	a,xl
7679  07b4 1a01          	or	a,(OFST+1,sp)
7680  07b6 1a05          	or	a,(OFST+5,sp)
7681  07b8 ca52b3        	or	a,21171
7682  07bb c752b3        	ld	21171,a
7683                     ; 2509 }
7686  07be 85            	popw	x
7687  07bf 81            	ret
7773                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7773                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7773                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7773                     ; 2550 {
7774                     	switch	.text
7775  07c0               _TIM1_EncoderInterfaceConfig:
7777  07c0 89            	pushw	x
7778       00000000      OFST:	set	0
7781                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7783                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7785                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7787                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7789  07c1 9f            	ld	a,xl
7790  07c2 4d            	tnz	a
7791  07c3 2706          	jreq	L7704
7792                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7794  07c5 721252bd      	bset	21181,#1
7796  07c9 2004          	jra	L1014
7797  07cb               L7704:
7798                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7800  07cb 721352bd      	bres	21181,#1
7801  07cf               L1014:
7802                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7804  07cf 0d05          	tnz	(OFST+5,sp)
7805  07d1 2706          	jreq	L3014
7806                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7808  07d3 721a52bd      	bset	21181,#5
7810  07d7 2004          	jra	L5014
7811  07d9               L3014:
7812                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7814  07d9 721b52bd      	bres	21181,#5
7815  07dd               L5014:
7816                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7818  07dd c652b2        	ld	a,21170
7819  07e0 a4f0          	and	a,#240
7820  07e2 1a01          	or	a,(OFST+1,sp)
7821  07e4 c752b2        	ld	21170,a
7822                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7824  07e7 c652b9        	ld	a,21177
7825  07ea a4fc          	and	a,#252
7826  07ec aa01          	or	a,#1
7827  07ee c752b9        	ld	21177,a
7828                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7830  07f1 c652ba        	ld	a,21178
7831  07f4 a4fc          	and	a,#252
7832  07f6 aa01          	or	a,#1
7833  07f8 c752ba        	ld	21178,a
7834                     ; 2581 }
7837  07fb 85            	popw	x
7838  07fc 81            	ret
7874                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7874                     ; 2590 {
7875                     	switch	.text
7876  07fd               _TIM1_SelectHallSensor:
7880                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7882                     ; 2595   if (NewState != DISABLE)
7884  07fd 4d            	tnz	a
7885  07fe 2706          	jreq	L5214
7886                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7888  0800 721e52b1      	bset	21169,#7
7890  0804 2004          	jra	L7214
7891  0806               L5214:
7892                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7894  0806 721f52b1      	bres	21169,#7
7895  080a               L7214:
7896                     ; 2603 }
7899  080a 81            	ret
7951                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7951                     ; 2624 {
7952                     	switch	.text
7953  080b               L3_TI1_Config:
7955  080b 89            	pushw	x
7956  080c 88            	push	a
7957       00000001      OFST:	set	1
7960                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7962  080d 721152bd      	bres	21181,#0
7963                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7963                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7965  0811 7b06          	ld	a,(OFST+5,sp)
7966  0813 97            	ld	xl,a
7967  0814 a610          	ld	a,#16
7968  0816 42            	mul	x,a
7969  0817 9f            	ld	a,xl
7970  0818 1a03          	or	a,(OFST+2,sp)
7971  081a 6b01          	ld	(OFST+0,sp),a
7973  081c c652b9        	ld	a,21177
7974  081f a40c          	and	a,#12
7975  0821 1a01          	or	a,(OFST+0,sp)
7976  0823 c752b9        	ld	21177,a
7977                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7979  0826 0d02          	tnz	(OFST+1,sp)
7980  0828 2706          	jreq	L7514
7981                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7983  082a 721252bd      	bset	21181,#1
7985  082e 2004          	jra	L1614
7986  0830               L7514:
7987                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7989  0830 721352bd      	bres	21181,#1
7990  0834               L1614:
7991                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7993  0834 721052bd      	bset	21181,#0
7994                     ; 2647 }
7997  0838 5b03          	addw	sp,#3
7998  083a 81            	ret
8050                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8050                     ; 2664 {
8051                     	switch	.text
8052  083b               L5_TI2_Config:
8054  083b 89            	pushw	x
8055  083c 88            	push	a
8056       00000001      OFST:	set	1
8059                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8061  083d 721952bd      	bres	21181,#4
8062                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8062                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8064  0841 7b06          	ld	a,(OFST+5,sp)
8065  0843 97            	ld	xl,a
8066  0844 a610          	ld	a,#16
8067  0846 42            	mul	x,a
8068  0847 9f            	ld	a,xl
8069  0848 1a03          	or	a,(OFST+2,sp)
8070  084a 6b01          	ld	(OFST+0,sp),a
8072  084c c652ba        	ld	a,21178
8073  084f a40c          	and	a,#12
8074  0851 1a01          	or	a,(OFST+0,sp)
8075  0853 c752ba        	ld	21178,a
8076                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8078  0856 0d02          	tnz	(OFST+1,sp)
8079  0858 2706          	jreq	L1124
8080                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8082  085a 721a52bd      	bset	21181,#5
8084  085e 2004          	jra	L3124
8085  0860               L1124:
8086                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8088  0860 721b52bd      	bres	21181,#5
8089  0864               L3124:
8090                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8092  0864 721852bd      	bset	21181,#4
8093                     ; 2682 }
8096  0868 5b03          	addw	sp,#3
8097  086a 81            	ret
8149                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8149                     ; 2699 {
8150                     	switch	.text
8151  086b               L7_TI3_Config:
8153  086b 89            	pushw	x
8154  086c 88            	push	a
8155       00000001      OFST:	set	1
8158                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8160  086d 721152be      	bres	21182,#0
8161                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8161                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8163  0871 7b06          	ld	a,(OFST+5,sp)
8164  0873 97            	ld	xl,a
8165  0874 a610          	ld	a,#16
8166  0876 42            	mul	x,a
8167  0877 9f            	ld	a,xl
8168  0878 1a03          	or	a,(OFST+2,sp)
8169  087a 6b01          	ld	(OFST+0,sp),a
8171  087c c652bb        	ld	a,21179
8172  087f a40c          	and	a,#12
8173  0881 1a01          	or	a,(OFST+0,sp)
8174  0883 c752bb        	ld	21179,a
8175                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8177  0886 0d02          	tnz	(OFST+1,sp)
8178  0888 2706          	jreq	L3424
8179                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8181  088a 721252be      	bset	21182,#1
8183  088e 2004          	jra	L5424
8184  0890               L3424:
8185                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8187  0890 721352be      	bres	21182,#1
8188  0894               L5424:
8189                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8191  0894 721052be      	bset	21182,#0
8192                     ; 2718 }
8195  0898 5b03          	addw	sp,#3
8196  089a 81            	ret
8248                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8248                     ; 2734 {
8249                     	switch	.text
8250  089b               L11_TI4_Config:
8252  089b 89            	pushw	x
8253  089c 88            	push	a
8254       00000001      OFST:	set	1
8257                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8259  089d 721952be      	bres	21182,#4
8260                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8260                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8262  08a1 7b06          	ld	a,(OFST+5,sp)
8263  08a3 97            	ld	xl,a
8264  08a4 a610          	ld	a,#16
8265  08a6 42            	mul	x,a
8266  08a7 9f            	ld	a,xl
8267  08a8 1a03          	or	a,(OFST+2,sp)
8268  08aa 6b01          	ld	(OFST+0,sp),a
8270  08ac c652bc        	ld	a,21180
8271  08af a40c          	and	a,#12
8272  08b1 1a01          	or	a,(OFST+0,sp)
8273  08b3 c752bc        	ld	21180,a
8274                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8276  08b6 0d02          	tnz	(OFST+1,sp)
8277  08b8 2706          	jreq	L5724
8278                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8280  08ba 721a52be      	bset	21182,#5
8282  08be 2004          	jra	L7724
8283  08c0               L5724:
8284                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8286  08c0 721b52be      	bres	21182,#5
8287  08c4               L7724:
8288                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8290  08c4 721852be      	bset	21182,#4
8291                     ; 2755 }
8294  08c8 5b03          	addw	sp,#3
8295  08ca 81            	ret
8308                     	xdef	_TIM1_SelectHallSensor
8309                     	xdef	_TIM1_EncoderInterfaceConfig
8310                     	xdef	_TIM1_ETRConfig
8311                     	xdef	_TIM1_SelectMasterSlaveMode
8312                     	xdef	_TIM1_SelectSlaveMode
8313                     	xdef	_TIM1_SelectOutputTrigger
8314                     	xdef	_TIM1_SelectInputTrigger
8315                     	xdef	_TIM1_ETRClockMode2Config
8316                     	xdef	_TIM1_ETRClockMode1Config
8317                     	xdef	_TIM1_TIxExternalClockConfig
8318                     	xdef	_TIM1_InternalClockConfig
8319                     	xdef	_TIM1_SelectCCDMA
8320                     	xdef	_TIM1_DMACmd
8321                     	xdef	_TIM1_DMAConfig
8322                     	xdef	_TIM1_ClearITPendingBit
8323                     	xdef	_TIM1_GetITStatus
8324                     	xdef	_TIM1_ClearFlag
8325                     	xdef	_TIM1_GetFlagStatus
8326                     	xdef	_TIM1_GenerateEvent
8327                     	xdef	_TIM1_ITConfig
8328                     	xdef	_TIM1_SetIC4Prescaler
8329                     	xdef	_TIM1_SetIC3Prescaler
8330                     	xdef	_TIM1_SetIC2Prescaler
8331                     	xdef	_TIM1_SetIC1Prescaler
8332                     	xdef	_TIM1_GetCapture4
8333                     	xdef	_TIM1_GetCapture3
8334                     	xdef	_TIM1_GetCapture2
8335                     	xdef	_TIM1_GetCapture1
8336                     	xdef	_TIM1_PWMIConfig
8337                     	xdef	_TIM1_ICInit
8338                     	xdef	_TIM1_CCxNCmd
8339                     	xdef	_TIM1_CCxCmd
8340                     	xdef	_TIM1_SelectCOM
8341                     	xdef	_TIM1_SelectOCREFClear
8342                     	xdef	_TIM1_OC3NPolarityConfig
8343                     	xdef	_TIM1_OC3PolarityConfig
8344                     	xdef	_TIM1_OC2NPolarityConfig
8345                     	xdef	_TIM1_OC2PolarityConfig
8346                     	xdef	_TIM1_OC1NPolarityConfig
8347                     	xdef	_TIM1_OC1PolarityConfig
8348                     	xdef	_TIM1_ClearOC4Ref
8349                     	xdef	_TIM1_ClearOC3Ref
8350                     	xdef	_TIM1_ClearOC2Ref
8351                     	xdef	_TIM1_ClearOC1Ref
8352                     	xdef	_TIM1_OC3FastConfig
8353                     	xdef	_TIM1_OC2FastConfig
8354                     	xdef	_TIM1_OC1FastConfig
8355                     	xdef	_TIM1_OC4PreloadConfig
8356                     	xdef	_TIM1_OC3PreloadConfig
8357                     	xdef	_TIM1_OC2PreloadConfig
8358                     	xdef	_TIM1_OC1PreloadConfig
8359                     	xdef	_TIM1_ForcedOC3Config
8360                     	xdef	_TIM1_ForcedOC2Config
8361                     	xdef	_TIM1_ForcedOC1Config
8362                     	xdef	_TIM1_CCPreloadControl
8363                     	xdef	_TIM1_SetCompare4
8364                     	xdef	_TIM1_SetCompare3
8365                     	xdef	_TIM1_SetCompare2
8366                     	xdef	_TIM1_SetCompare1
8367                     	xdef	_TIM1_SelectOCxM
8368                     	xdef	_TIM1_CtrlPWMOutputs
8369                     	xdef	_TIM1_BDTRConfig
8370                     	xdef	_TIM1_OC3Init
8371                     	xdef	_TIM1_OC2Init
8372                     	xdef	_TIM1_OC1Init
8373                     	xdef	_TIM1_Cmd
8374                     	xdef	_TIM1_SelectOnePulseMode
8375                     	xdef	_TIM1_ARRPreloadConfig
8376                     	xdef	_TIM1_UpdateRequestConfig
8377                     	xdef	_TIM1_UpdateDisableConfig
8378                     	xdef	_TIM1_GetPrescaler
8379                     	xdef	_TIM1_GetCounter
8380                     	xdef	_TIM1_SetAutoreload
8381                     	xdef	_TIM1_SetCounter
8382                     	xdef	_TIM1_CounterModeConfig
8383                     	xdef	_TIM1_PrescalerConfig
8384                     	xdef	_TIM1_TimeBaseInit
8385                     	xdef	_TIM1_DeInit
8404                     	end
