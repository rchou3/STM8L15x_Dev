   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 142 void DAC_DeInit(void)
  43                     ; 143 {
  45                     	switch	.text
  46  0000               _DAC_DeInit:
  50                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  52  0000 725f5380      	clr	21376
  53                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  55  0004 725f5381      	clr	21377
  56                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  58  0008 725f5382      	clr	21378
  59                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  61  000c 725f5383      	clr	21379
  62                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  64  0010 725f5384      	clr	21380
  65                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  67  0014 35ff5385      	mov	21381,#255
  68                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  70  0018 725f5388      	clr	21384
  71                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  73  001c 725f5389      	clr	21385
  74                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  76  0020 725f538c      	clr	21388
  77                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  79  0024 725f538d      	clr	21389
  80                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  82  0028 725f5390      	clr	21392
  83                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  85  002c 725f5394      	clr	21396
  86                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  88  0030 725f5395      	clr	21397
  89                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  91  0034 725f5398      	clr	21400
  92                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  94  0038 725f5399      	clr	21401
  95                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  97  003c 725f539c      	clr	21404
  98                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 100  0040 725f53a0      	clr	21408
 101                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 103  0044 725f53a1      	clr	21409
 104                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0048 725f53a2      	clr	21410
 107                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 109  004c 725f53a3      	clr	21411
 110                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 112  0050 725f53a4      	clr	21412
 113                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 115  0054 725f53a5      	clr	21413
 116                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0058 725f53a6      	clr	21414
 119                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 121  005c 725f53a7      	clr	21415
 122                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 124  0060 725f53a8      	clr	21416
 125                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 127  0064 725f53a9      	clr	21417
 128                     ; 187 }
 131  0068 81            	ret
 290                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 290                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 290                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 290                     ; 211 {
 291                     	switch	.text
 292  0069               _DAC_Init:
 294  0069 89            	pushw	x
 295  006a 5203          	subw	sp,#3
 296       00000003      OFST:	set	3
 299                     ; 212   uint8_t tmpreg = 0;
 301                     ; 213   uint16_t tmpreg2 = 0;
 303                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 305                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 307                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 309                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 311  006c 9e            	ld	a,xh
 312  006d 48            	sll	a
 313  006e 5f            	clrw	x
 314  006f 97            	ld	xl,a
 315  0070 1f01          	ldw	(OFST-2,sp),x
 317                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 319  0072 1e01          	ldw	x,(OFST-2,sp)
 320  0074 d65380        	ld	a,(21376,x)
 321  0077 6b03          	ld	(OFST+0,sp),a
 323                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 325  0079 7b03          	ld	a,(OFST+0,sp)
 326  007b a4c1          	and	a,#193
 327  007d 6b03          	ld	(OFST+0,sp),a
 329                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 331  007f 7b03          	ld	a,(OFST+0,sp)
 332  0081 1a08          	or	a,(OFST+5,sp)
 333  0083 6b03          	ld	(OFST+0,sp),a
 335                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 337  0085 7b05          	ld	a,(OFST+2,sp)
 338  0087 a130          	cp	a,#48
 339  0089 2708          	jreq	L511
 340                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 342  008b 7b05          	ld	a,(OFST+2,sp)
 343  008d aa04          	or	a,#4
 344  008f 1a03          	or	a,(OFST+0,sp)
 345  0091 6b03          	ld	(OFST+0,sp),a
 347  0093               L511:
 348                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 350  0093 7b03          	ld	a,(OFST+0,sp)
 351  0095 1e01          	ldw	x,(OFST-2,sp)
 352  0097 d75380        	ld	(21376,x),a
 353                     ; 240 }
 356  009a 5b05          	addw	sp,#5
 357  009c 81            	ret
 431                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 431                     ; 255 {
 432                     	switch	.text
 433  009d               _DAC_Cmd:
 435  009d 89            	pushw	x
 436  009e 89            	pushw	x
 437       00000002      OFST:	set	2
 440                     ; 256   uint16_t cr1addr = 0;
 442                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 444                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 446                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 448  009f 9e            	ld	a,xh
 449  00a0 48            	sll	a
 450  00a1 5f            	clrw	x
 451  00a2 97            	ld	xl,a
 452  00a3 1c5380        	addw	x,#21376
 453  00a6 1f01          	ldw	(OFST-1,sp),x
 455                     ; 264   if (NewState != DISABLE)
 457  00a8 0d04          	tnz	(OFST+2,sp)
 458  00aa 2708          	jreq	L551
 459                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 461  00ac 1e01          	ldw	x,(OFST-1,sp)
 462  00ae f6            	ld	a,(x)
 463  00af aa01          	or	a,#1
 464  00b1 f7            	ld	(x),a
 466  00b2 2006          	jra	L751
 467  00b4               L551:
 468                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 470  00b4 1e01          	ldw	x,(OFST-1,sp)
 471  00b6 f6            	ld	a,(x)
 472  00b7 a4fe          	and	a,#254
 473  00b9 f7            	ld	(x),a
 474  00ba               L751:
 475                     ; 274 }
 478  00ba 5b04          	addw	sp,#4
 479  00bc 81            	ret
 525                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 525                     ; 287 {
 526                     	switch	.text
 527  00bd               _DAC_SoftwareTriggerCmd:
 529  00bd 89            	pushw	x
 530       00000000      OFST:	set	0
 533                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 535                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 537                     ; 292   if (NewState != DISABLE)
 539  00be 9f            	ld	a,xl
 540  00bf 4d            	tnz	a
 541  00c0 2714          	jreq	L302
 542                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 544  00c2 9e            	ld	a,xh
 545  00c3 5f            	clrw	x
 546  00c4 97            	ld	xl,a
 547  00c5 a601          	ld	a,#1
 548  00c7 5d            	tnzw	x
 549  00c8 2704          	jreq	L41
 550  00ca               L61:
 551  00ca 48            	sll	a
 552  00cb 5a            	decw	x
 553  00cc 26fc          	jrne	L61
 554  00ce               L41:
 555  00ce ca5384        	or	a,21380
 556  00d1 c75384        	ld	21380,a
 558  00d4 2014          	jra	L502
 559  00d6               L302:
 560                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 562  00d6 7b01          	ld	a,(OFST+1,sp)
 563  00d8 5f            	clrw	x
 564  00d9 97            	ld	xl,a
 565  00da a601          	ld	a,#1
 566  00dc 5d            	tnzw	x
 567  00dd 2704          	jreq	L02
 568  00df               L22:
 569  00df 48            	sll	a
 570  00e0 5a            	decw	x
 571  00e1 26fc          	jrne	L22
 572  00e3               L02:
 573  00e3 43            	cpl	a
 574  00e4 c45384        	and	a,21380
 575  00e7 c75384        	ld	21380,a
 576  00ea               L502:
 577                     ; 302 }
 580  00ea 85            	popw	x
 581  00eb 81            	ret
 617                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 617                     ; 312 {
 618                     	switch	.text
 619  00ec               _DAC_DualSoftwareTriggerCmd:
 623                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 625                     ; 316   if (NewState != DISABLE)
 627  00ec 4d            	tnz	a
 628  00ed 270a          	jreq	L522
 629                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 631  00ef c65384        	ld	a,21380
 632  00f2 aa03          	or	a,#3
 633  00f4 c75384        	ld	21380,a
 635  00f7 2008          	jra	L722
 636  00f9               L522:
 637                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 639  00f9 c65384        	ld	a,21380
 640  00fc a4fc          	and	a,#252
 641  00fe c75384        	ld	21380,a
 642  0101               L722:
 643                     ; 326 }
 646  0101 81            	ret
 731                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 731                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 731                     ; 344                            FunctionalState NewState)
 731                     ; 345 {
 732                     	switch	.text
 733  0102               _DAC_WaveGenerationCmd:
 735  0102 89            	pushw	x
 736  0103 88            	push	a
 737       00000001      OFST:	set	1
 740                     ; 346   uint8_t tmpreg = 0;
 742                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 744                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 746                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 748                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 750  0104 9e            	ld	a,xh
 751  0105 48            	sll	a
 752  0106 5f            	clrw	x
 753  0107 97            	ld	xl,a
 754  0108 d65380        	ld	a,(21376,x)
 755  010b a43f          	and	a,#63
 756  010d 6b01          	ld	(OFST+0,sp),a
 758                     ; 356   if (NewState != DISABLE)
 760  010f 0d06          	tnz	(OFST+5,sp)
 761  0111 2706          	jreq	L372
 762                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 764  0113 7b01          	ld	a,(OFST+0,sp)
 765  0115 1a03          	or	a,(OFST+2,sp)
 766  0117 6b01          	ld	(OFST+0,sp),a
 768  0119               L372:
 769                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 771  0119 7b02          	ld	a,(OFST+1,sp)
 772  011b 48            	sll	a
 773  011c 5f            	clrw	x
 774  011d 97            	ld	xl,a
 775  011e 7b01          	ld	a,(OFST+0,sp)
 776  0120 d75380        	ld	(21376,x),a
 777                     ; 364 }
 780  0123 5b03          	addw	sp,#3
 781  0125 81            	ret
 947                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 947                     ; 389 {
 948                     	switch	.text
 949  0126               _DAC_SetNoiseWaveLFSR:
 951  0126 89            	pushw	x
 952  0127 5203          	subw	sp,#3
 953       00000003      OFST:	set	3
 956                     ; 390   uint8_t tmpreg = 0;
 958                     ; 391   uint16_t cr2addr = 0;
 960                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 962                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 964                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 966  0129 9e            	ld	a,xh
 967  012a 48            	sll	a
 968  012b 5f            	clrw	x
 969  012c 97            	ld	xl,a
 970  012d 1c5381        	addw	x,#21377
 971  0130 1f02          	ldw	(OFST-1,sp),x
 973                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 975  0132 1e02          	ldw	x,(OFST-1,sp)
 976  0134 f6            	ld	a,(x)
 977  0135 a4f0          	and	a,#240
 978  0137 6b01          	ld	(OFST-2,sp),a
 980                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 982  0139 7b01          	ld	a,(OFST-2,sp)
 983  013b 1a05          	or	a,(OFST+2,sp)
 984  013d 1e02          	ldw	x,(OFST-1,sp)
 985  013f f7            	ld	(x),a
 986                     ; 403 }
 989  0140 5b05          	addw	sp,#5
 990  0142 81            	ret
1157                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1157                     ; 428 {
1158                     	switch	.text
1159  0143               _DAC_SetTriangleWaveAmplitude:
1161  0143 89            	pushw	x
1162  0144 5203          	subw	sp,#3
1163       00000003      OFST:	set	3
1166                     ; 429   uint8_t tmpreg = 0;
1168                     ; 430   uint16_t cr2addr = 0;
1170                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1172                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1174                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1176  0146 9e            	ld	a,xh
1177  0147 48            	sll	a
1178  0148 5f            	clrw	x
1179  0149 97            	ld	xl,a
1180  014a 1c5381        	addw	x,#21377
1181  014d 1f02          	ldw	(OFST-1,sp),x
1183                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1185  014f 1e02          	ldw	x,(OFST-1,sp)
1186  0151 f6            	ld	a,(x)
1187  0152 a4f0          	and	a,#240
1188  0154 6b01          	ld	(OFST-2,sp),a
1190                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1192  0156 7b01          	ld	a,(OFST-2,sp)
1193  0158 1a05          	or	a,(OFST+2,sp)
1194  015a 1e02          	ldw	x,(OFST-1,sp)
1195  015c f7            	ld	(x),a
1196                     ; 443 }
1199  015d 5b05          	addw	sp,#5
1200  015f 81            	ret
1272                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1272                     ; 456 {
1273                     	switch	.text
1274  0160               _DAC_SetChannel1Data:
1276  0160 88            	push	a
1277       00000000      OFST:	set	0
1280                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1282                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1284  0161 a108          	cp	a,#8
1285  0163 2712          	jreq	L505
1286                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1288  0165 5f            	clrw	x
1289  0166 97            	ld	xl,a
1290  0167 7b04          	ld	a,(OFST+4,sp)
1291  0169 d75388        	ld	(21384,x),a
1292                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1294  016c 7b01          	ld	a,(OFST+1,sp)
1295  016e 5f            	clrw	x
1296  016f 97            	ld	xl,a
1297  0170 7b05          	ld	a,(OFST+5,sp)
1298  0172 d75389        	ld	(21385,x),a
1300  0175 2005          	jra	L705
1301  0177               L505:
1302                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1304                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1306  0177 7b05          	ld	a,(OFST+5,sp)
1307  0179 c75390        	ld	21392,a
1308  017c               L705:
1309                     ; 474 }
1312  017c 84            	pop	a
1313  017d 81            	ret
1358                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1358                     ; 487 {
1359                     	switch	.text
1360  017e               _DAC_SetChannel2Data:
1362  017e 88            	push	a
1363       00000000      OFST:	set	0
1366                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1368                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1370  017f a108          	cp	a,#8
1371  0181 2712          	jreq	L335
1372                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1374  0183 5f            	clrw	x
1375  0184 97            	ld	xl,a
1376  0185 7b04          	ld	a,(OFST+4,sp)
1377  0187 d75394        	ld	(21396,x),a
1378                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1380  018a 7b01          	ld	a,(OFST+1,sp)
1381  018c 5f            	clrw	x
1382  018d 97            	ld	xl,a
1383  018e 7b05          	ld	a,(OFST+5,sp)
1384  0190 d75395        	ld	(21397,x),a
1386  0193 2005          	jra	L535
1387  0195               L335:
1388                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1390                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1392  0195 7b05          	ld	a,(OFST+5,sp)
1393  0197 c7539c        	ld	21404,a
1394  019a               L535:
1395                     ; 505 }
1398  019a 84            	pop	a
1399  019b 81            	ret
1462                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1462                     ; 523 {
1463                     	switch	.text
1464  019c               _DAC_SetDualChannelData:
1466  019c 88            	push	a
1467  019d 89            	pushw	x
1468       00000002      OFST:	set	2
1471                     ; 524   uint16_t dchxrdhrhaddr = 0;
1473                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1475                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1477  019e a108          	cp	a,#8
1478  01a0 2720          	jreq	L175
1479                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1481  01a2 5f            	clrw	x
1482  01a3 97            	ld	xl,a
1483  01a4 1c53a0        	addw	x,#21408
1484  01a7 1f01          	ldw	(OFST-1,sp),x
1486                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1488  01a9 7b08          	ld	a,(OFST+6,sp)
1489  01ab 1e01          	ldw	x,(OFST-1,sp)
1490  01ad f7            	ld	(x),a
1491                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1493  01ae 7b09          	ld	a,(OFST+7,sp)
1494  01b0 1e01          	ldw	x,(OFST-1,sp)
1495  01b2 e701          	ld	(1,x),a
1496                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1498  01b4 7b06          	ld	a,(OFST+4,sp)
1499  01b6 1e01          	ldw	x,(OFST-1,sp)
1500  01b8 e702          	ld	(2,x),a
1501                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1503  01ba 7b07          	ld	a,(OFST+5,sp)
1504  01bc 1e01          	ldw	x,(OFST-1,sp)
1505  01be e703          	ld	(3,x),a
1507  01c0 200a          	jra	L375
1508  01c2               L175:
1509                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1511                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1513  01c2 7b09          	ld	a,(OFST+7,sp)
1514  01c4 c753a8        	ld	21416,a
1515                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1517  01c7 7b07          	ld	a,(OFST+5,sp)
1518  01c9 c753a9        	ld	21417,a
1519  01cc               L375:
1520                     ; 549 }
1523  01cc 5b03          	addw	sp,#3
1524  01ce 81            	ret
1578                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1578                     ; 560 {
1579                     	switch	.text
1580  01cf               _DAC_GetDataOutputValue:
1582  01cf 89            	pushw	x
1583       00000002      OFST:	set	2
1586                     ; 561   uint16_t outputdata = 0;
1588                     ; 562   uint16_t tmp = 0;
1590                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1592                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1594  01d0 4d            	tnz	a
1595  01d1 2619          	jrne	L326
1596                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1598  01d3 c653ac        	ld	a,21420
1599  01d6 5f            	clrw	x
1600  01d7 97            	ld	xl,a
1601  01d8 4f            	clr	a
1602  01d9 02            	rlwa	x,a
1603  01da 1f01          	ldw	(OFST-1,sp),x
1605                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1607  01dc c653ad        	ld	a,21421
1608  01df 5f            	clrw	x
1609  01e0 97            	ld	xl,a
1610  01e1 01            	rrwa	x,a
1611  01e2 1a02          	or	a,(OFST+0,sp)
1612  01e4 01            	rrwa	x,a
1613  01e5 1a01          	or	a,(OFST-1,sp)
1614  01e7 01            	rrwa	x,a
1615  01e8 1f01          	ldw	(OFST-1,sp),x
1618  01ea 2017          	jra	L526
1619  01ec               L326:
1620                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1622  01ec c653b0        	ld	a,21424
1623  01ef 5f            	clrw	x
1624  01f0 97            	ld	xl,a
1625  01f1 4f            	clr	a
1626  01f2 02            	rlwa	x,a
1627  01f3 1f01          	ldw	(OFST-1,sp),x
1629                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1631  01f5 c653b1        	ld	a,21425
1632  01f8 5f            	clrw	x
1633  01f9 97            	ld	xl,a
1634  01fa 01            	rrwa	x,a
1635  01fb 1a02          	or	a,(OFST+0,sp)
1636  01fd 01            	rrwa	x,a
1637  01fe 1a01          	or	a,(OFST-1,sp)
1638  0200 01            	rrwa	x,a
1639  0201 1f01          	ldw	(OFST-1,sp),x
1641  0203               L526:
1642                     ; 581   return (uint16_t)outputdata;
1644  0203 1e01          	ldw	x,(OFST-1,sp)
1647  0205 5b02          	addw	sp,#2
1648  0207 81            	ret
1702                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1702                     ; 614 {
1703                     	switch	.text
1704  0208               _DAC_DMACmd:
1706  0208 89            	pushw	x
1707  0209 89            	pushw	x
1708       00000002      OFST:	set	2
1711                     ; 615   uint16_t cr2addr = 0;
1713                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1715                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1717                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1719  020a 9e            	ld	a,xh
1720  020b 48            	sll	a
1721  020c 5f            	clrw	x
1722  020d 97            	ld	xl,a
1723  020e 1c5381        	addw	x,#21377
1724  0211 1f01          	ldw	(OFST-1,sp),x
1726                     ; 624   if (NewState != DISABLE)
1728  0213 0d04          	tnz	(OFST+2,sp)
1729  0215 2708          	jreq	L556
1730                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1732  0217 1e01          	ldw	x,(OFST-1,sp)
1733  0219 f6            	ld	a,(x)
1734  021a aa10          	or	a,#16
1735  021c f7            	ld	(x),a
1737  021d 2006          	jra	L756
1738  021f               L556:
1739                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1741  021f 1e01          	ldw	x,(OFST-1,sp)
1742  0221 f6            	ld	a,(x)
1743  0222 a4ef          	and	a,#239
1744  0224 f7            	ld	(x),a
1745  0225               L756:
1746                     ; 634 }
1749  0225 5b04          	addw	sp,#4
1750  0227 81            	ret
1827                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1827                     ; 668 {
1828                     	switch	.text
1829  0228               _DAC_ITConfig:
1831  0228 89            	pushw	x
1832  0229 89            	pushw	x
1833       00000002      OFST:	set	2
1836                     ; 669   uint16_t cr2addr = 0;
1838                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1840                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1842                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1844                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1846  022a 9e            	ld	a,xh
1847  022b 48            	sll	a
1848  022c 5f            	clrw	x
1849  022d 97            	ld	xl,a
1850  022e 1c5381        	addw	x,#21377
1851  0231 1f01          	ldw	(OFST-1,sp),x
1853                     ; 679   if (NewState != DISABLE)
1855  0233 0d07          	tnz	(OFST+5,sp)
1856  0235 2708          	jreq	L127
1857                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1859  0237 1e01          	ldw	x,(OFST-1,sp)
1860  0239 f6            	ld	a,(x)
1861  023a 1a04          	or	a,(OFST+2,sp)
1862  023c f7            	ld	(x),a
1864  023d 2007          	jra	L327
1865  023f               L127:
1866                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1868  023f 1e01          	ldw	x,(OFST-1,sp)
1869  0241 7b04          	ld	a,(OFST+2,sp)
1870  0243 43            	cpl	a
1871  0244 f4            	and	a,(x)
1872  0245 f7            	ld	(x),a
1873  0246               L327:
1874                     ; 689 }
1877  0246 5b04          	addw	sp,#4
1878  0248 81            	ret
1976                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1976                     ; 705 {
1977                     	switch	.text
1978  0249               _DAC_GetFlagStatus:
1980  0249 89            	pushw	x
1981  024a 88            	push	a
1982       00000001      OFST:	set	1
1985                     ; 706   FlagStatus flagstatus = RESET;
1987                     ; 707   uint8_t flag = 0;
1989                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1991                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1993                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1995  024b 9e            	ld	a,xh
1996  024c 5f            	clrw	x
1997  024d 97            	ld	xl,a
1998  024e 7b03          	ld	a,(OFST+2,sp)
1999  0250 5d            	tnzw	x
2000  0251 2704          	jreq	L25
2001  0253               L45:
2002  0253 48            	sll	a
2003  0254 5a            	decw	x
2004  0255 26fc          	jrne	L45
2005  0257               L25:
2006  0257 6b01          	ld	(OFST+0,sp),a
2008                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
2010  0259 c65385        	ld	a,21381
2011  025c 1501          	bcp	a,(OFST+0,sp)
2012  025e 2706          	jreq	L577
2013                     ; 719     flagstatus = SET;
2015  0260 a601          	ld	a,#1
2016  0262 6b01          	ld	(OFST+0,sp),a
2019  0264 2002          	jra	L777
2020  0266               L577:
2021                     ; 724     flagstatus = RESET;
2023  0266 0f01          	clr	(OFST+0,sp)
2025  0268               L777:
2026                     ; 728   return  flagstatus;
2028  0268 7b01          	ld	a,(OFST+0,sp)
2031  026a 5b03          	addw	sp,#3
2032  026c 81            	ret
2086                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2086                     ; 743 {
2087                     	switch	.text
2088  026d               _DAC_ClearFlag:
2090  026d 89            	pushw	x
2091  026e 88            	push	a
2092       00000001      OFST:	set	1
2095                     ; 744   uint8_t flag = 0;
2097                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2099                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2101                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2103  026f 9e            	ld	a,xh
2104  0270 5f            	clrw	x
2105  0271 97            	ld	xl,a
2106  0272 7b03          	ld	a,(OFST+2,sp)
2107  0274 5d            	tnzw	x
2108  0275 2704          	jreq	L06
2109  0277               L26:
2110  0277 48            	sll	a
2111  0278 5a            	decw	x
2112  0279 26fc          	jrne	L26
2113  027b               L06:
2114  027b 6b01          	ld	(OFST+0,sp),a
2116                     ; 754   DAC->SR = (uint8_t)(~flag);
2118  027d 7b01          	ld	a,(OFST+0,sp)
2119  027f 43            	cpl	a
2120  0280 c75385        	ld	21381,a
2121                     ; 755 }
2124  0283 5b03          	addw	sp,#3
2125  0285 81            	ret
2208                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2208                     ; 771 {
2209                     	switch	.text
2210  0286               _DAC_GetITStatus:
2212  0286 89            	pushw	x
2213  0287 89            	pushw	x
2214       00000002      OFST:	set	2
2217                     ; 772   ITStatus itstatus = RESET;
2219                     ; 773   uint8_t enablestatus = 0;
2221                     ; 774   uint8_t flagstatus = 0;
2223                     ; 775   uint8_t tempreg = 0;
2225                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2227                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2229                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2231  0288 9e            	ld	a,xh
2232  0289 48            	sll	a
2233  028a 48            	sll	a
2234  028b 5f            	clrw	x
2235  028c 97            	ld	xl,a
2236  028d d65381        	ld	a,(21377,x)
2237  0290 6b02          	ld	(OFST+0,sp),a
2239                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2241  0292 7b03          	ld	a,(OFST+1,sp)
2242  0294 5f            	clrw	x
2243  0295 97            	ld	xl,a
2244  0296 7b04          	ld	a,(OFST+2,sp)
2245  0298 5d            	tnzw	x
2246  0299 2704          	jreq	L66
2247  029b               L07:
2248  029b 48            	sll	a
2249  029c 5a            	decw	x
2250  029d 26fc          	jrne	L07
2251  029f               L66:
2252  029f 1402          	and	a,(OFST+0,sp)
2253  02a1 6b01          	ld	(OFST-1,sp),a
2255                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2257  02a3 a605          	ld	a,#5
2258  02a5 1003          	sub	a,(OFST+1,sp)
2259  02a7 5f            	clrw	x
2260  02a8 97            	ld	xl,a
2261  02a9 7b04          	ld	a,(OFST+2,sp)
2262  02ab 5d            	tnzw	x
2263  02ac 2704          	jreq	L27
2264  02ae               L47:
2265  02ae 44            	srl	a
2266  02af 5a            	decw	x
2267  02b0 26fc          	jrne	L47
2268  02b2               L27:
2269  02b2 c45385        	and	a,21381
2270  02b5 6b02          	ld	(OFST+0,sp),a
2272                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2274  02b7 0d02          	tnz	(OFST+0,sp)
2275  02b9 270a          	jreq	L1701
2277  02bb 0d01          	tnz	(OFST-1,sp)
2278  02bd 2706          	jreq	L1701
2279                     ; 790     itstatus = SET;
2281  02bf a601          	ld	a,#1
2282  02c1 6b02          	ld	(OFST+0,sp),a
2285  02c3 2002          	jra	L3701
2286  02c5               L1701:
2287                     ; 795     itstatus = RESET;
2289  02c5 0f02          	clr	(OFST+0,sp)
2291  02c7               L3701:
2292                     ; 799   return  itstatus;
2294  02c7 7b02          	ld	a,(OFST+0,sp)
2297  02c9 5b04          	addw	sp,#4
2298  02cb 81            	ret
2344                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2344                     ; 814 {
2345                     	switch	.text
2346  02cc               _DAC_ClearITPendingBit:
2348  02cc 89            	pushw	x
2349       00000000      OFST:	set	0
2352                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2354                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2356                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2358  02cd 9e            	ld	a,xh
2359  02ce a005          	sub	a,#5
2360  02d0 40            	neg	a
2361  02d1 5f            	clrw	x
2362  02d2 97            	ld	xl,a
2363  02d3 7b02          	ld	a,(OFST+2,sp)
2364  02d5 5d            	tnzw	x
2365  02d6 2704          	jreq	L001
2366  02d8               L201:
2367  02d8 44            	srl	a
2368  02d9 5a            	decw	x
2369  02da 26fc          	jrne	L201
2370  02dc               L001:
2371  02dc 43            	cpl	a
2372  02dd c75385        	ld	21381,a
2373                     ; 821 }
2376  02e0 85            	popw	x
2377  02e1 81            	ret
2390                     	xdef	_DAC_ClearITPendingBit
2391                     	xdef	_DAC_GetITStatus
2392                     	xdef	_DAC_ClearFlag
2393                     	xdef	_DAC_GetFlagStatus
2394                     	xdef	_DAC_ITConfig
2395                     	xdef	_DAC_DMACmd
2396                     	xdef	_DAC_GetDataOutputValue
2397                     	xdef	_DAC_SetDualChannelData
2398                     	xdef	_DAC_SetChannel2Data
2399                     	xdef	_DAC_SetChannel1Data
2400                     	xdef	_DAC_SetTriangleWaveAmplitude
2401                     	xdef	_DAC_SetNoiseWaveLFSR
2402                     	xdef	_DAC_WaveGenerationCmd
2403                     	xdef	_DAC_DualSoftwareTriggerCmd
2404                     	xdef	_DAC_SoftwareTriggerCmd
2405                     	xdef	_DAC_Cmd
2406                     	xdef	_DAC_Init
2407                     	xdef	_DAC_DeInit
2426                     	end
