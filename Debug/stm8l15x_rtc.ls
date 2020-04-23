   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  96                     ; 232 ErrorStatus RTC_DeInit(void)
  96                     ; 233 {
  98                     	switch	.text
  99  0000               _RTC_DeInit:
 101  0000 5205          	subw	sp,#5
 102       00000005      OFST:	set	5
 105                     ; 234   ErrorStatus status = ERROR;
 107                     ; 235   uint16_t wutwfcount = 0;
 109  0002 5f            	clrw	x
 110  0003 1f02          	ldw	(OFST-3,sp),x
 112                     ; 236   uint16_t recalpfcount = 0;
 114  0005 5f            	clrw	x
 115  0006 1f04          	ldw	(OFST-1,sp),x
 117                     ; 239   RTC->WPR = 0xCA;
 119  0008 35ca5159      	mov	20825,#202
 120                     ; 240   RTC->WPR = 0x53;
 122  000c 35535159      	mov	20825,#83
 123                     ; 243   if (RTC_EnterInitMode() == ERROR)
 125  0010 cd0161        	call	_RTC_EnterInitMode
 127  0013 4d            	tnz	a
 128  0014 260b          	jrne	L35
 129                     ; 245     status = ERROR;
 131  0016 0f01          	clr	(OFST-4,sp)
 133                     ; 247     RTC->WPR = 0xFF; 
 135  0018 35ff5159      	mov	20825,#255
 137  001c               L55:
 138                     ; 343   return (ErrorStatus)status;
 140  001c 7b01          	ld	a,(OFST-4,sp)
 143  001e 5b05          	addw	sp,#5
 144  0020 81            	ret
 145  0021               L35:
 146                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 148  0021 725f5140      	clr	20800
 149                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 151  0025 725f5141      	clr	20801
 152                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 154  0029 725f5142      	clr	20802
 155                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 157  002d 35015144      	mov	20804,#1
 158                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 160  0031 35215145      	mov	20805,#33
 161                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 163  0035 725f5146      	clr	20806
 164                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 166  0039 725f5150      	clr	20816
 167                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 169  003d 35ff5151      	mov	20817,#255
 170                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 172  0041 357f5152      	mov	20818,#127
 173                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 175  0045 725f516c      	clr	20844
 176                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 178  0049 725f516d      	clr	20845
 179                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 181  004d 725f5148      	clr	20808
 182                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 184  0051 725f5149      	clr	20809
 185                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 187  0055 725f514a      	clr	20810
 189  0059 200b          	jra	L36
 190  005b               L75:
 191                     ; 278       wutwfcount++;
 193  005b 1e02          	ldw	x,(OFST-3,sp)
 194  005d 1c0001        	addw	x,#1
 195  0060 1f02          	ldw	(OFST-3,sp),x
 197                     ; 279       RTC->ISR1 = 0;
 199  0062 725f514c      	clr	20812
 200  0066               L36:
 201                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 203  0066 c6514c        	ld	a,20812
 204  0069 a504          	bcp	a,#4
 205  006b 2607          	jrne	L76
 207  006d 1e02          	ldw	x,(OFST-3,sp)
 208  006f a3ffff        	cpw	x,#65535
 209  0072 26e7          	jrne	L75
 210  0074               L76:
 211                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 213  0074 c6514c        	ld	a,20812
 214  0077 a504          	bcp	a,#4
 215  0079 2608          	jrne	L17
 216                     ; 284       status = ERROR;
 218  007b 0f01          	clr	(OFST-4,sp)
 220                     ; 286       RTC->WPR = 0xFF; 
 222  007d 35ff5159      	mov	20825,#255
 224  0081 2099          	jra	L55
 225  0083               L17:
 226                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 228  0083 725f5148      	clr	20808
 229                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 231  0087 35ff5154      	mov	20820,#255
 232                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 234  008b 35ff5155      	mov	20821,#255
 235                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 237  008f 725f515c      	clr	20828
 238                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 240  0093 725f515d      	clr	20829
 241                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 243  0097 725f515e      	clr	20830
 244                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 246  009b 725f515f      	clr	20831
 247                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 249  009f 725f5164      	clr	20836
 250                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 252  00a3 725f5165      	clr	20837
 253                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 255  00a7 725f5166      	clr	20838
 256                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 258  00ab 725f514c      	clr	20812
 259                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 261  00af 725f514d      	clr	20813
 262                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 264  00b3 c6514c        	ld	a,20812
 265  00b6 a502          	bcp	a,#2
 266  00b8 2717          	jreq	L57
 268  00ba 2007          	jra	L101
 269  00bc               L77:
 270                     ; 315           recalpfcount++;
 272  00bc 1e04          	ldw	x,(OFST-1,sp)
 273  00be 1c0001        	addw	x,#1
 274  00c1 1f04          	ldw	(OFST-1,sp),x
 276  00c3               L101:
 277                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 279  00c3 c6514c        	ld	a,20812
 280  00c6 a502          	bcp	a,#2
 281  00c8 2707          	jreq	L57
 283  00ca 1e04          	ldw	x,(OFST-1,sp)
 284  00cc a3ffff        	cpw	x,#65535
 285  00cf 26eb          	jrne	L77
 286  00d1               L57:
 287                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 289  00d1 c6514c        	ld	a,20812
 290  00d4 a502          	bcp	a,#2
 291  00d6 2618          	jrne	L701
 292                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 294  00d8 725f516a      	clr	20842
 295                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 297  00dc 725f516b      	clr	20843
 298                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 300  00e0 cd01a1        	call	_RTC_WaitForSynchro
 302  00e3 4d            	tnz	a
 303  00e4 2604          	jrne	L111
 304                     ; 325           status = ERROR;
 306  00e6 0f01          	clr	(OFST-4,sp)
 309  00e8 2008          	jra	L511
 310  00ea               L111:
 311                     ; 329           status = SUCCESS;
 313  00ea a601          	ld	a,#1
 314  00ec 6b01          	ld	(OFST-4,sp),a
 316  00ee 2002          	jra	L511
 317  00f0               L701:
 318                     ; 334         status = ERROR;
 320  00f0 0f01          	clr	(OFST-4,sp)
 322  00f2               L511:
 323                     ; 338       RTC->WPR = 0xFF; 
 325  00f2 35ff5159      	mov	20825,#255
 326  00f6 ac1c001c      	jpf	L55
 426                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 426                     ; 360 {
 427                     	switch	.text
 428  00fa               _RTC_Init:
 430  00fa 89            	pushw	x
 431  00fb 88            	push	a
 432       00000001      OFST:	set	1
 435                     ; 361   ErrorStatus status = ERROR;
 437                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 439                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 441                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 443                     ; 369   RTC->WPR = 0xCA;
 445  00fc 35ca5159      	mov	20825,#202
 446                     ; 370   RTC->WPR = 0x53;
 448  0100 35535159      	mov	20825,#83
 449                     ; 373   if (RTC_EnterInitMode() == ERROR)
 451  0104 ad5b          	call	_RTC_EnterInitMode
 453  0106 4d            	tnz	a
 454  0107 2604          	jrne	L761
 455                     ; 375     status = ERROR;
 457  0109 0f01          	clr	(OFST+0,sp)
 460  010b 202d          	jra	L171
 461  010d               L761:
 462                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 464  010d 721d5148      	bres	20808,#6
 465                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 467  0111 1e02          	ldw	x,(OFST+1,sp)
 468  0113 c65148        	ld	a,20808
 469  0116 fa            	or	a,(x)
 470  0117 c75148        	ld	20808,a
 471                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 473  011a 1e02          	ldw	x,(OFST+1,sp)
 474  011c ee02          	ldw	x,(2,x)
 475  011e 4f            	clr	a
 476  011f 01            	rrwa	x,a
 477  0120 9f            	ld	a,xl
 478  0121 c75150        	ld	20816,a
 479                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 481  0124 1e02          	ldw	x,(OFST+1,sp)
 482  0126 e603          	ld	a,(3,x)
 483  0128 c75151        	ld	20817,a
 484                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 486  012b 1e02          	ldw	x,(OFST+1,sp)
 487  012d e601          	ld	a,(1,x)
 488  012f c75152        	ld	20818,a
 489                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 491  0132 721f514c      	bres	20812,#7
 492                     ; 393     status = SUCCESS;
 494  0136 a601          	ld	a,#1
 495  0138 6b01          	ld	(OFST+0,sp),a
 497  013a               L171:
 498                     ; 397   RTC->WPR = 0xFF; 
 500  013a 35ff5159      	mov	20825,#255
 501                     ; 400   return (ErrorStatus)(status);
 503  013e 7b01          	ld	a,(OFST+0,sp)
 506  0140 5b03          	addw	sp,#3
 507  0142 81            	ret
 544                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 544                     ; 411 {
 545                     	switch	.text
 546  0143               _RTC_StructInit:
 550                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 552  0143 7f            	clr	(x)
 553                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 555  0144 a67f          	ld	a,#127
 556  0146 e701          	ld	(1,x),a
 557                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 559  0148 90ae00ff      	ldw	y,#255
 560  014c ef02          	ldw	(2,x),y
 561                     ; 420 }
 564  014e 81            	ret
 620                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 620                     ; 431 {
 621                     	switch	.text
 622  014f               _RTC_WriteProtectionCmd:
 626                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 628                     ; 435   if (NewState != DISABLE)
 630  014f 4d            	tnz	a
 631  0150 2706          	jreq	L142
 632                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 634  0152 35ff5159      	mov	20825,#255
 636  0156 2008          	jra	L342
 637  0158               L142:
 638                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 640  0158 35ca5159      	mov	20825,#202
 641                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 643  015c 35535159      	mov	20825,#83
 644  0160               L342:
 645                     ; 446 }
 648  0160 81            	ret
 693                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 693                     ; 459 {
 694                     	switch	.text
 695  0161               _RTC_EnterInitMode:
 697  0161 5203          	subw	sp,#3
 698       00000003      OFST:	set	3
 701                     ; 460   ErrorStatus status = ERROR;
 703                     ; 461   uint16_t initfcount = 0;
 705  0163 5f            	clrw	x
 706  0164 1f02          	ldw	(OFST-1,sp),x
 708                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 710  0166 c6514c        	ld	a,20812
 711  0169 a540          	bcp	a,#64
 712  016b 261b          	jrne	L762
 713                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 715  016d 3580514c      	mov	20812,#128
 717  0171 2007          	jra	L572
 718  0173               L172:
 719                     ; 472       initfcount++;
 721  0173 1e02          	ldw	x,(OFST-1,sp)
 722  0175 1c0001        	addw	x,#1
 723  0178 1f02          	ldw	(OFST-1,sp),x
 725  017a               L572:
 726                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 728  017a c6514c        	ld	a,20812
 729  017d a540          	bcp	a,#64
 730  017f 2607          	jrne	L762
 732  0181 1e02          	ldw	x,(OFST-1,sp)
 733  0183 a3ffff        	cpw	x,#65535
 734  0186 26eb          	jrne	L172
 735  0188               L762:
 736                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 738  0188 c6514c        	ld	a,20812
 739  018b a540          	bcp	a,#64
 740  018d 2604          	jrne	L303
 741                     ; 478     status = ERROR;
 743  018f 0f01          	clr	(OFST-2,sp)
 746  0191 2004          	jra	L503
 747  0193               L303:
 748                     ; 482     status = SUCCESS;
 750  0193 a601          	ld	a,#1
 751  0195 6b01          	ld	(OFST-2,sp),a
 753  0197               L503:
 754                     ; 485   return (ErrorStatus)status;
 756  0197 7b01          	ld	a,(OFST-2,sp)
 759  0199 5b03          	addw	sp,#3
 760  019b 81            	ret
 783                     ; 498 void RTC_ExitInitMode(void)
 783                     ; 499 {
 784                     	switch	.text
 785  019c               _RTC_ExitInitMode:
 789                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 791  019c 721f514c      	bres	20812,#7
 792                     ; 502 }
 795  01a0 81            	ret
 840                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 840                     ; 528 {
 841                     	switch	.text
 842  01a1               _RTC_WaitForSynchro:
 844  01a1 5203          	subw	sp,#3
 845       00000003      OFST:	set	3
 848                     ; 529   uint16_t rsfcount = 0;
 850  01a3 5f            	clrw	x
 851  01a4 1f02          	ldw	(OFST-1,sp),x
 853                     ; 530   ErrorStatus status = ERROR;
 855                     ; 533   RTC->WPR = 0xCA;
 857  01a6 35ca5159      	mov	20825,#202
 858                     ; 534   RTC->WPR = 0x53;
 860  01aa 35535159      	mov	20825,#83
 861                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 863  01ae c6514c        	ld	a,20812
 864  01b1 a45f          	and	a,#95
 865  01b3 c7514c        	ld	20812,a
 867  01b6 2007          	jra	L343
 868  01b8               L143:
 869                     ; 542     rsfcount++;
 871  01b8 1e02          	ldw	x,(OFST-1,sp)
 872  01ba 1c0001        	addw	x,#1
 873  01bd 1f02          	ldw	(OFST-1,sp),x
 875  01bf               L343:
 876                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 878  01bf c6514c        	ld	a,20812
 879  01c2 a520          	bcp	a,#32
 880  01c4 2607          	jrne	L743
 882  01c6 1e02          	ldw	x,(OFST-1,sp)
 883  01c8 a3ffff        	cpw	x,#65535
 884  01cb 26eb          	jrne	L143
 885  01cd               L743:
 886                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 888  01cd c6514c        	ld	a,20812
 889  01d0 a520          	bcp	a,#32
 890  01d2 2706          	jreq	L153
 891                     ; 548     status = SUCCESS;
 893  01d4 a601          	ld	a,#1
 894  01d6 6b01          	ld	(OFST-2,sp),a
 897  01d8 2002          	jra	L353
 898  01da               L153:
 899                     ; 552     status = ERROR;
 901  01da 0f01          	clr	(OFST-2,sp)
 903  01dc               L353:
 904                     ; 556   RTC->WPR = 0xFF; 
 906  01dc 35ff5159      	mov	20825,#255
 907                     ; 558   return (ErrorStatus)status;
 909  01e0 7b01          	ld	a,(OFST-2,sp)
 912  01e2 5b03          	addw	sp,#3
 913  01e4 81            	ret
 948                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 948                     ; 569 {
 949                     	switch	.text
 950  01e5               _RTC_RatioCmd:
 954                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 956                     ; 574   RTC->WPR = 0xCA;
 958  01e5 35ca5159      	mov	20825,#202
 959                     ; 575   RTC->WPR = 0x53;
 961  01e9 35535159      	mov	20825,#83
 962                     ; 577   if (NewState != DISABLE)
 964  01ed 4d            	tnz	a
 965  01ee 2706          	jreq	L373
 966                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 968  01f0 721a5148      	bset	20808,#5
 970  01f4 2004          	jra	L573
 971  01f6               L373:
 972                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 974  01f6 721b5148      	bres	20808,#5
 975  01fa               L573:
 976                     ; 589   RTC->WPR = 0xFF; 
 978  01fa 35ff5159      	mov	20825,#255
 979                     ; 590 }
 982  01fe 81            	ret
1018                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1018                     ; 599 {
1019                     	switch	.text
1020  01ff               _RTC_BypassShadowCmd:
1024                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1026                     ; 604   RTC->WPR = 0xCA;
1028  01ff 35ca5159      	mov	20825,#202
1029                     ; 605   RTC->WPR = 0x53;
1031  0203 35535159      	mov	20825,#83
1032                     ; 607   if (NewState != DISABLE)
1034  0207 4d            	tnz	a
1035  0208 2706          	jreq	L514
1036                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1038  020a 72185148      	bset	20808,#4
1040  020e 2004          	jra	L714
1041  0210               L514:
1042                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1044  0210 72195148      	bres	20808,#4
1045  0214               L714:
1046                     ; 619   RTC->WPR = 0xFF; 
1048  0214 35ff5159      	mov	20825,#255
1049                     ; 620 }
1052  0218 81            	ret
1200                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1200                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1200                     ; 661 {
1201                     	switch	.text
1202  0219               _RTC_SetTime:
1204  0219 88            	push	a
1205  021a 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 662   ErrorStatus status = ERROR;
1211                     ; 663   uint8_t temp = 0;
1213                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1215                     ; 668   if (RTC_Format == RTC_Format_BIN)
1217  021b 4d            	tnz	a
1218  021c 2609          	jrne	L315
1219                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1221  021e c65148        	ld	a,20808
1222  0221 a540          	bcp	a,#64
1223  0223 2700          	jreq	L515
1224                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1226                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1229  0225               L515:
1230                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1232                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1234                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1237  0225 2007          	jra	L125
1238  0227               L315:
1239                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1241  0227 c65148        	ld	a,20808
1242  022a a540          	bcp	a,#64
1243  022c 2700          	jreq	L325
1244                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1246                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1249  022e               L325:
1250                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1252                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1254                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1256  022e               L125:
1257                     ; 701   RTC->WPR = 0xCA;
1259  022e 35ca5159      	mov	20825,#202
1260                     ; 702   RTC->WPR = 0x53;
1262  0232 35535159      	mov	20825,#83
1263                     ; 705   if (RTC_EnterInitMode() == ERROR)
1265  0236 cd0161        	call	_RTC_EnterInitMode
1267  0239 4d            	tnz	a
1268  023a 2608          	jrne	L725
1269                     ; 707     status = ERROR;
1271  023c 0f01          	clr	(OFST+0,sp)
1273                     ; 709     RTC->WPR = 0xFF; 
1275  023e 35ff5159      	mov	20825,#255
1277  0242 2072          	jra	L135
1278  0244               L725:
1279                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1281  0244 c65148        	ld	a,20808
1282  0247 a540          	bcp	a,#64
1283  0249 2708          	jreq	L335
1284                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1286                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1288  024b 1e05          	ldw	x,(OFST+4,sp)
1289  024d e603          	ld	a,(3,x)
1290  024f 6b01          	ld	(OFST+0,sp),a
1293  0251 2002          	jra	L535
1294  0253               L335:
1295                     ; 721       temp = 0;
1297  0253 0f01          	clr	(OFST+0,sp)
1299  0255               L535:
1300                     ; 724     if (RTC_Format != RTC_Format_BIN)
1302  0255 0d02          	tnz	(OFST+1,sp)
1303  0257 2718          	jreq	L735
1304                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1306  0259 1e05          	ldw	x,(OFST+4,sp)
1307  025b e602          	ld	a,(2,x)
1308  025d c75140        	ld	20800,a
1309                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1311  0260 1e05          	ldw	x,(OFST+4,sp)
1312  0262 e601          	ld	a,(1,x)
1313  0264 c75141        	ld	20801,a
1314                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1316  0267 1e05          	ldw	x,(OFST+4,sp)
1317  0269 f6            	ld	a,(x)
1318  026a 1a01          	or	a,(OFST+0,sp)
1319  026c c75142        	ld	20802,a
1321  026f 201f          	jra	L145
1322  0271               L735:
1323                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1325  0271 1e05          	ldw	x,(OFST+4,sp)
1326  0273 e602          	ld	a,(2,x)
1327  0275 cd0994        	call	L3_ByteToBcd2
1329  0278 c75140        	ld	20800,a
1330                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1332  027b 1e05          	ldw	x,(OFST+4,sp)
1333  027d e601          	ld	a,(1,x)
1334  027f cd0994        	call	L3_ByteToBcd2
1336  0282 c75141        	ld	20801,a
1337                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1339  0285 1e05          	ldw	x,(OFST+4,sp)
1340  0287 f6            	ld	a,(x)
1341  0288 cd0994        	call	L3_ByteToBcd2
1343  028b 1a01          	or	a,(OFST+0,sp)
1344  028d c75142        	ld	20802,a
1345  0290               L145:
1346                     ; 737     (void)(RTC->DR3);
1348  0290 c65146        	ld	a,20806
1349                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1351  0293 721f514c      	bres	20812,#7
1352                     ; 743     RTC->WPR = 0xFF; 
1354  0297 35ff5159      	mov	20825,#255
1355                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1357  029b c65148        	ld	a,20808
1358  029e a510          	bcp	a,#16
1359  02a0 2610          	jrne	L345
1360                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1362  02a2 cd01a1        	call	_RTC_WaitForSynchro
1364  02a5 4d            	tnz	a
1365  02a6 2604          	jrne	L545
1366                     ; 750         status = ERROR;
1368  02a8 0f01          	clr	(OFST+0,sp)
1371  02aa 200a          	jra	L135
1372  02ac               L545:
1373                     ; 754         status = SUCCESS;
1375  02ac a601          	ld	a,#1
1376  02ae 6b01          	ld	(OFST+0,sp),a
1378  02b0 2004          	jra	L135
1379  02b2               L345:
1380                     ; 759       status = SUCCESS;
1382  02b2 a601          	ld	a,#1
1383  02b4 6b01          	ld	(OFST+0,sp),a
1385  02b6               L135:
1386                     ; 763   return (ErrorStatus)status;
1388  02b6 7b01          	ld	a,(OFST+0,sp)
1391  02b8 85            	popw	x
1392  02b9 81            	ret
1429                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1429                     ; 776 {
1430                     	switch	.text
1431  02ba               _RTC_TimeStructInit:
1435                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1437  02ba 6f03          	clr	(3,x)
1438                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1440  02bc 7f            	clr	(x)
1441                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1443  02bd 6f01          	clr	(1,x)
1444                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1446  02bf 6f02          	clr	(2,x)
1447                     ; 782 }
1450  02c1 81            	ret
1507                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1507                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1507                     ; 800 {
1508                     	switch	.text
1509  02c2               _RTC_GetTime:
1511  02c2 88            	push	a
1512  02c3 88            	push	a
1513       00000001      OFST:	set	1
1516                     ; 801   uint8_t  tmpreg = 0;
1518                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1520                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1522  02c4 1e05          	ldw	x,(OFST+4,sp)
1523  02c6 c65140        	ld	a,20800
1524  02c9 e702          	ld	(2,x),a
1525                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1527  02cb 1e05          	ldw	x,(OFST+4,sp)
1528  02cd c65141        	ld	a,20801
1529  02d0 e701          	ld	(1,x),a
1530                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1532  02d2 c65142        	ld	a,20802
1533  02d5 6b01          	ld	(OFST+0,sp),a
1535                     ; 817   (void) (RTC->DR3) ;
1537  02d7 c65146        	ld	a,20806
1538                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1540  02da 7b01          	ld	a,(OFST+0,sp)
1541  02dc a4bf          	and	a,#191
1542  02de 1e05          	ldw	x,(OFST+4,sp)
1543  02e0 f7            	ld	(x),a
1544                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1546  02e1 7b01          	ld	a,(OFST+0,sp)
1547  02e3 a440          	and	a,#64
1548  02e5 1e05          	ldw	x,(OFST+4,sp)
1549  02e7 e703          	ld	(3,x),a
1550                     ; 827   if (RTC_Format == RTC_Format_BIN)
1552  02e9 0d02          	tnz	(OFST+1,sp)
1553  02eb 261f          	jrne	L326
1554                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1556  02ed 1e05          	ldw	x,(OFST+4,sp)
1557  02ef f6            	ld	a,(x)
1558  02f0 cd09b3        	call	L5_Bcd2ToByte
1560  02f3 1e05          	ldw	x,(OFST+4,sp)
1561  02f5 f7            	ld	(x),a
1562                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1564  02f6 1e05          	ldw	x,(OFST+4,sp)
1565  02f8 e601          	ld	a,(1,x)
1566  02fa cd09b3        	call	L5_Bcd2ToByte
1568  02fd 1e05          	ldw	x,(OFST+4,sp)
1569  02ff e701          	ld	(1,x),a
1570                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1572  0301 1e05          	ldw	x,(OFST+4,sp)
1573  0303 e602          	ld	a,(2,x)
1574  0305 cd09b3        	call	L5_Bcd2ToByte
1576  0308 1e05          	ldw	x,(OFST+4,sp)
1577  030a e702          	ld	(2,x),a
1578  030c               L326:
1579                     ; 834 }
1582  030c 85            	popw	x
1583  030d 81            	ret
1635                     ; 845 uint16_t RTC_GetSubSecond(void)
1635                     ; 846 {
1636                     	switch	.text
1637  030e               _RTC_GetSubSecond:
1639  030e 5206          	subw	sp,#6
1640       00000006      OFST:	set	6
1643                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1647                     ; 848   uint16_t ssrreg = 0;
1649                     ; 851   ssrhreg = RTC->SSRH;
1651  0310 c65157        	ld	a,20823
1652  0313 6b03          	ld	(OFST-3,sp),a
1654                     ; 852   ssrlreg = RTC->SSRL;
1656  0315 c65158        	ld	a,20824
1657  0318 6b04          	ld	(OFST-2,sp),a
1659                     ; 855   (void) (RTC->DR3);
1661  031a c65146        	ld	a,20806
1662                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1664  031d 7b04          	ld	a,(OFST-2,sp)
1665  031f 5f            	clrw	x
1666  0320 97            	ld	xl,a
1667  0321 1f01          	ldw	(OFST-5,sp),x
1669  0323 7b03          	ld	a,(OFST-3,sp)
1670  0325 5f            	clrw	x
1671  0326 97            	ld	xl,a
1672  0327 4f            	clr	a
1673  0328 02            	rlwa	x,a
1674  0329 01            	rrwa	x,a
1675  032a 1a02          	or	a,(OFST-4,sp)
1676  032c 01            	rrwa	x,a
1677  032d 1a01          	or	a,(OFST-5,sp)
1678  032f 01            	rrwa	x,a
1679  0330 1f05          	ldw	(OFST-1,sp),x
1681                     ; 859   return (uint16_t)(ssrreg);
1683  0332 1e05          	ldw	x,(OFST-1,sp)
1686  0334 5b06          	addw	sp,#6
1687  0336 81            	ret
1939                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1939                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1939                     ; 878 {
1940                     	switch	.text
1941  0337               _RTC_SetDate:
1943  0337 88            	push	a
1944  0338 89            	pushw	x
1945       00000002      OFST:	set	2
1948                     ; 879   ErrorStatus status = ERROR;
1950                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1952  0339 4d            	tnz	a
1953  033a 2616          	jrne	L1001
1955  033c 1e06          	ldw	x,(OFST+4,sp)
1956  033e e601          	ld	a,(1,x)
1957  0340 a410          	and	a,#16
1958  0342 a110          	cp	a,#16
1959  0344 260c          	jrne	L1001
1960                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1962  0346 1e06          	ldw	x,(OFST+4,sp)
1963  0348 e601          	ld	a,(1,x)
1964  034a a4ef          	and	a,#239
1965  034c ab0a          	add	a,#10
1966  034e 1e06          	ldw	x,(OFST+4,sp)
1967  0350 e701          	ld	(1,x),a
1968  0352               L1001:
1969                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1971                     ; 888   if (RTC_Format == RTC_Format_BIN)
1973  0352 0d03          	tnz	(OFST+1,sp)
1974  0354 2600          	jrne	L3001
1975                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1977                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1979                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1981                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1983                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1986  0356               L3001:
1987                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1989                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1991                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1993                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1995                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1997                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1999                     ; 907   RTC->WPR = 0xCA;
2001  0356 35ca5159      	mov	20825,#202
2002                     ; 908   RTC->WPR = 0x53;
2004  035a 35535159      	mov	20825,#83
2005                     ; 911   if (RTC_EnterInitMode() == ERROR)
2007  035e cd0161        	call	_RTC_EnterInitMode
2009  0361 4d            	tnz	a
2010  0362 2608          	jrne	L7001
2011                     ; 913     status = ERROR;
2013  0364 0f02          	clr	(OFST+0,sp)
2015                     ; 915     RTC->WPR = 0xFF; 
2017  0366 35ff5159      	mov	20825,#255
2019  036a 2073          	jra	L1101
2020  036c               L7001:
2021                     ; 919     (void)(RTC->TR1);
2023  036c c65140        	ld	a,20800
2024                     ; 922     if (RTC_Format != RTC_Format_BIN)
2026  036f 0d03          	tnz	(OFST+1,sp)
2027  0371 271f          	jreq	L3101
2028                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2030  0373 1e06          	ldw	x,(OFST+4,sp)
2031  0375 e602          	ld	a,(2,x)
2032  0377 c75144        	ld	20804,a
2033                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2035  037a 1e06          	ldw	x,(OFST+4,sp)
2036  037c f6            	ld	a,(x)
2037  037d 97            	ld	xl,a
2038  037e a620          	ld	a,#32
2039  0380 42            	mul	x,a
2040  0381 9f            	ld	a,xl
2041  0382 1e06          	ldw	x,(OFST+4,sp)
2042  0384 ea01          	or	a,(1,x)
2043  0386 c75145        	ld	20805,a
2044                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2046  0389 1e06          	ldw	x,(OFST+4,sp)
2047  038b e603          	ld	a,(3,x)
2048  038d c75146        	ld	20806,a
2050  0390 202a          	jra	L5101
2051  0392               L3101:
2052                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2054  0392 1e06          	ldw	x,(OFST+4,sp)
2055  0394 e602          	ld	a,(2,x)
2056  0396 cd0994        	call	L3_ByteToBcd2
2058  0399 c75144        	ld	20804,a
2059                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2061  039c 1e06          	ldw	x,(OFST+4,sp)
2062  039e f6            	ld	a,(x)
2063  039f 97            	ld	xl,a
2064  03a0 a620          	ld	a,#32
2065  03a2 42            	mul	x,a
2066  03a3 9f            	ld	a,xl
2067  03a4 6b01          	ld	(OFST-1,sp),a
2069  03a6 1e06          	ldw	x,(OFST+4,sp)
2070  03a8 e601          	ld	a,(1,x)
2071  03aa cd0994        	call	L3_ByteToBcd2
2073  03ad 1a01          	or	a,(OFST-1,sp)
2074  03af c75145        	ld	20805,a
2075                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2077  03b2 1e06          	ldw	x,(OFST+4,sp)
2078  03b4 e603          	ld	a,(3,x)
2079  03b6 cd0994        	call	L3_ByteToBcd2
2081  03b9 c75146        	ld	20806,a
2082  03bc               L5101:
2083                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2085  03bc 721f514c      	bres	20812,#7
2086                     ; 939     RTC->WPR = 0xFF; 
2088  03c0 35ff5159      	mov	20825,#255
2089                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2091  03c4 c65148        	ld	a,20808
2092  03c7 a510          	bcp	a,#16
2093  03c9 2610          	jrne	L7101
2094                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2096  03cb cd01a1        	call	_RTC_WaitForSynchro
2098  03ce 4d            	tnz	a
2099  03cf 2604          	jrne	L1201
2100                     ; 946         status = ERROR;
2102  03d1 0f02          	clr	(OFST+0,sp)
2105  03d3 200a          	jra	L1101
2106  03d5               L1201:
2107                     ; 950         status = SUCCESS;
2109  03d5 a601          	ld	a,#1
2110  03d7 6b02          	ld	(OFST+0,sp),a
2112  03d9 2004          	jra	L1101
2113  03db               L7101:
2114                     ; 955       status = SUCCESS;
2116  03db a601          	ld	a,#1
2117  03dd 6b02          	ld	(OFST+0,sp),a
2119  03df               L1101:
2120                     ; 959   return (ErrorStatus)status;
2122  03df 7b02          	ld	a,(OFST+0,sp)
2125  03e1 5b03          	addw	sp,#3
2126  03e3 81            	ret
2163                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2163                     ; 969 {
2164                     	switch	.text
2165  03e4               _RTC_DateStructInit:
2169                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2171  03e4 a601          	ld	a,#1
2172  03e6 f7            	ld	(x),a
2173                     ; 972   RTC_DateStruct->RTC_Date = 1;
2175  03e7 a601          	ld	a,#1
2176  03e9 e702          	ld	(2,x),a
2177                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2179  03eb a601          	ld	a,#1
2180  03ed e701          	ld	(1,x),a
2181                     ; 974   RTC_DateStruct->RTC_Year = 0;
2183  03ef 6f03          	clr	(3,x)
2184                     ; 975 }
2187  03f1 81            	ret
2244                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2244                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2244                     ; 990 {
2245                     	switch	.text
2246  03f2               _RTC_GetDate:
2248  03f2 88            	push	a
2249  03f3 88            	push	a
2250       00000001      OFST:	set	1
2253                     ; 991   uint8_t tmpreg = 0;
2255                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2257                     ; 997   (void) (RTC->TR1) ;
2259  03f4 c65140        	ld	a,20800
2260                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2262  03f7 1e05          	ldw	x,(OFST+4,sp)
2263  03f9 c65144        	ld	a,20804
2264  03fc e702          	ld	(2,x),a
2265                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2267  03fe c65145        	ld	a,20805
2268  0401 6b01          	ld	(OFST+0,sp),a
2270                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2272  0403 1e05          	ldw	x,(OFST+4,sp)
2273  0405 c65146        	ld	a,20806
2274  0408 e703          	ld	(3,x),a
2275                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2277  040a 7b01          	ld	a,(OFST+0,sp)
2278  040c a41f          	and	a,#31
2279  040e 1e05          	ldw	x,(OFST+4,sp)
2280  0410 e701          	ld	(1,x),a
2281                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2283  0412 7b01          	ld	a,(OFST+0,sp)
2284  0414 a4e0          	and	a,#224
2285  0416 4e            	swap	a
2286  0417 44            	srl	a
2287  0418 a407          	and	a,#7
2288  041a 1e05          	ldw	x,(OFST+4,sp)
2289  041c f7            	ld	(x),a
2290                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2292  041d 0d02          	tnz	(OFST+1,sp)
2293  041f 2621          	jrne	L7701
2294                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2296  0421 1e05          	ldw	x,(OFST+4,sp)
2297  0423 e603          	ld	a,(3,x)
2298  0425 cd09b3        	call	L5_Bcd2ToByte
2300  0428 1e05          	ldw	x,(OFST+4,sp)
2301  042a e703          	ld	(3,x),a
2302                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2304  042c 1e05          	ldw	x,(OFST+4,sp)
2305  042e e601          	ld	a,(1,x)
2306  0430 cd09b3        	call	L5_Bcd2ToByte
2308  0433 1e05          	ldw	x,(OFST+4,sp)
2309  0435 e701          	ld	(1,x),a
2310                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2312  0437 1e05          	ldw	x,(OFST+4,sp)
2313  0439 e602          	ld	a,(2,x)
2314  043b cd09b3        	call	L5_Bcd2ToByte
2316  043e 1e05          	ldw	x,(OFST+4,sp)
2317  0440 e702          	ld	(2,x),a
2318  0442               L7701:
2319                     ; 1014 }
2322  0442 85            	popw	x
2323  0443 81            	ret
2472                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2472                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2472                     ; 1046 {
2473                     	switch	.text
2474  0444               _RTC_SetAlarm:
2476  0444 88            	push	a
2477  0445 5205          	subw	sp,#5
2478       00000005      OFST:	set	5
2481                     ; 1047   uint8_t tmpreg1 = 0;
2483                     ; 1048   uint8_t tmpreg2 = 0;
2485                     ; 1049   uint8_t tmpreg3 = 0;
2487                     ; 1050   uint8_t tmpreg4 = 0;
2489                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2491                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2493                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2495                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2497                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2499  0447 4d            	tnz	a
2500  0448 2609          	jrne	L5711
2501                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2503  044a c65148        	ld	a,20808
2504  044d a540          	bcp	a,#64
2505  044f 2700          	jreq	L7711
2506                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2508                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2511  0451               L7711:
2512                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2514                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2516                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2519  0451 2007          	jra	L3021
2520  0453               L5711:
2521                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2523  0453 c65148        	ld	a,20808
2524  0456 a540          	bcp	a,#64
2525  0458 2700          	jreq	L5021
2526                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2528                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2531  045a               L5021:
2532                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2534                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2536                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2538  045a               L3021:
2539                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2541  045a 1e09          	ldw	x,(OFST+4,sp)
2542  045c e604          	ld	a,(4,x)
2543  045e a510          	bcp	a,#16
2544  0460 2608          	jrne	L1121
2545                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2547  0462 1e09          	ldw	x,(OFST+4,sp)
2548  0464 e605          	ld	a,(5,x)
2549  0466 a140          	cp	a,#64
2550  0468 2600          	jrne	L3121
2551                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2554  046a               L3121:
2555                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2557                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2559  046a               L1121:
2560                     ; 1108   RTC->WPR = 0xCA;
2562  046a 35ca5159      	mov	20825,#202
2563                     ; 1109   RTC->WPR = 0x53;
2565  046e 35535159      	mov	20825,#83
2566                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2568  0472 0d06          	tnz	(OFST+1,sp)
2569  0474 2747          	jreq	L7121
2570                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2570                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2572  0476 1e09          	ldw	x,(OFST+4,sp)
2573  0478 e604          	ld	a,(4,x)
2574  047a a480          	and	a,#128
2575  047c 1e09          	ldw	x,(OFST+4,sp)
2576  047e ea02          	or	a,(2,x)
2577  0480 6b02          	ld	(OFST-3,sp),a
2579                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2579                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2581  0482 1e09          	ldw	x,(OFST+4,sp)
2582  0484 e604          	ld	a,(4,x)
2583  0486 48            	sll	a
2584  0487 a480          	and	a,#128
2585  0489 1e09          	ldw	x,(OFST+4,sp)
2586  048b ea01          	or	a,(1,x)
2587  048d 6b03          	ld	(OFST-2,sp),a
2589                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2589                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2589                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2591  048f 1e09          	ldw	x,(OFST+4,sp)
2592  0491 e604          	ld	a,(4,x)
2593  0493 48            	sll	a
2594  0494 48            	sll	a
2595  0495 a480          	and	a,#128
2596  0497 6b01          	ld	(OFST-4,sp),a
2598  0499 1e09          	ldw	x,(OFST+4,sp)
2599  049b e603          	ld	a,(3,x)
2600  049d 1e09          	ldw	x,(OFST+4,sp)
2601  049f fa            	or	a,(x)
2602  04a0 1a01          	or	a,(OFST-4,sp)
2603  04a2 6b04          	ld	(OFST-1,sp),a
2605                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2605                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2605                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2607  04a4 1e09          	ldw	x,(OFST+4,sp)
2608  04a6 e604          	ld	a,(4,x)
2609  04a8 48            	sll	a
2610  04a9 48            	sll	a
2611  04aa 48            	sll	a
2612  04ab a480          	and	a,#128
2613  04ad 6b01          	ld	(OFST-4,sp),a
2615  04af 1e09          	ldw	x,(OFST+4,sp)
2616  04b1 e605          	ld	a,(5,x)
2617  04b3 1e09          	ldw	x,(OFST+4,sp)
2618  04b5 ea06          	or	a,(6,x)
2619  04b7 1a01          	or	a,(OFST-4,sp)
2620  04b9 6b05          	ld	(OFST+0,sp),a
2623  04bb 2059          	jra	L1221
2624  04bd               L7121:
2625                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2625                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2627  04bd 1e09          	ldw	x,(OFST+4,sp)
2628  04bf e604          	ld	a,(4,x)
2629  04c1 a480          	and	a,#128
2630  04c3 6b01          	ld	(OFST-4,sp),a
2632  04c5 1e09          	ldw	x,(OFST+4,sp)
2633  04c7 e602          	ld	a,(2,x)
2634  04c9 cd0994        	call	L3_ByteToBcd2
2636  04cc 1a01          	or	a,(OFST-4,sp)
2637  04ce 6b02          	ld	(OFST-3,sp),a
2639                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2639                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2641  04d0 1e09          	ldw	x,(OFST+4,sp)
2642  04d2 e604          	ld	a,(4,x)
2643  04d4 48            	sll	a
2644  04d5 a480          	and	a,#128
2645  04d7 6b01          	ld	(OFST-4,sp),a
2647  04d9 1e09          	ldw	x,(OFST+4,sp)
2648  04db e601          	ld	a,(1,x)
2649  04dd cd0994        	call	L3_ByteToBcd2
2651  04e0 1a01          	or	a,(OFST-4,sp)
2652  04e2 6b03          	ld	(OFST-2,sp),a
2654                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2654                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2654                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2656  04e4 1e09          	ldw	x,(OFST+4,sp)
2657  04e6 e604          	ld	a,(4,x)
2658  04e8 48            	sll	a
2659  04e9 48            	sll	a
2660  04ea a480          	and	a,#128
2661  04ec 6b01          	ld	(OFST-4,sp),a
2663  04ee 1e09          	ldw	x,(OFST+4,sp)
2664  04f0 f6            	ld	a,(x)
2665  04f1 cd0994        	call	L3_ByteToBcd2
2667  04f4 1e09          	ldw	x,(OFST+4,sp)
2668  04f6 ea03          	or	a,(3,x)
2669  04f8 1a01          	or	a,(OFST-4,sp)
2670  04fa 6b04          	ld	(OFST-1,sp),a
2672                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2672                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2672                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2674  04fc 1e09          	ldw	x,(OFST+4,sp)
2675  04fe e604          	ld	a,(4,x)
2676  0500 48            	sll	a
2677  0501 48            	sll	a
2678  0502 48            	sll	a
2679  0503 a480          	and	a,#128
2680  0505 6b01          	ld	(OFST-4,sp),a
2682  0507 1e09          	ldw	x,(OFST+4,sp)
2683  0509 e606          	ld	a,(6,x)
2684  050b cd0994        	call	L3_ByteToBcd2
2686  050e 1e09          	ldw	x,(OFST+4,sp)
2687  0510 ea05          	or	a,(5,x)
2688  0512 1a01          	or	a,(OFST-4,sp)
2689  0514 6b05          	ld	(OFST+0,sp),a
2691  0516               L1221:
2692                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2694  0516 7b02          	ld	a,(OFST-3,sp)
2695  0518 c7515c        	ld	20828,a
2696                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2698  051b 7b03          	ld	a,(OFST-2,sp)
2699  051d c7515d        	ld	20829,a
2700                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2702  0520 7b04          	ld	a,(OFST-1,sp)
2703  0522 c7515e        	ld	20830,a
2704                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2706  0525 7b05          	ld	a,(OFST+0,sp)
2707  0527 c7515f        	ld	20831,a
2708                     ; 1154   RTC->WPR = 0xFF; 
2710  052a 35ff5159      	mov	20825,#255
2711                     ; 1155 }
2714  052e 5b06          	addw	sp,#6
2715  0530 81            	ret
2753                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2753                     ; 1166 {
2754                     	switch	.text
2755  0531               _RTC_AlarmStructInit:
2759                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2761  0531 6f03          	clr	(3,x)
2762                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2764  0533 7f            	clr	(x)
2765                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2767  0534 6f01          	clr	(1,x)
2768                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2770  0536 6f02          	clr	(2,x)
2771                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2773  0538 6f05          	clr	(5,x)
2774                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2776  053a a601          	ld	a,#1
2777  053c e706          	ld	(6,x),a
2778                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2780  053e a6f0          	ld	a,#240
2781  0540 e704          	ld	(4,x),a
2782                     ; 1179 }
2785  0542 81            	ret
2878                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2878                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2878                     ; 1190 {
2879                     	switch	.text
2880  0543               _RTC_GetAlarm:
2882  0543 88            	push	a
2883  0544 5204          	subw	sp,#4
2884       00000004      OFST:	set	4
2887                     ; 1191   uint8_t tmpreg1 = 0;
2889                     ; 1192   uint8_t tmpreg2 = 0;
2891                     ; 1193   uint8_t tmpreg3 = 0;
2893                     ; 1194   uint8_t tmpreg4 = 0;
2895                     ; 1195   uint8_t alarmmask = 0;
2897                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2899                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2901  0546 c6515c        	ld	a,20828
2902  0549 6b04          	ld	(OFST+0,sp),a
2904                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2906  054b c6515d        	ld	a,20829
2907  054e 6b01          	ld	(OFST-3,sp),a
2909                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2911  0550 c6515e        	ld	a,20830
2912  0553 6b02          	ld	(OFST-2,sp),a
2914                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2916  0555 c6515f        	ld	a,20831
2917  0558 6b03          	ld	(OFST-1,sp),a
2919                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2921  055a 7b04          	ld	a,(OFST+0,sp)
2922  055c a47f          	and	a,#127
2923  055e 1e08          	ldw	x,(OFST+4,sp)
2924  0560 e702          	ld	(2,x),a
2925                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2927  0562 7b04          	ld	a,(OFST+0,sp)
2928  0564 a480          	and	a,#128
2929  0566 6b04          	ld	(OFST+0,sp),a
2931                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2933  0568 7b01          	ld	a,(OFST-3,sp)
2934  056a a47f          	and	a,#127
2935  056c 1e08          	ldw	x,(OFST+4,sp)
2936  056e e701          	ld	(1,x),a
2937                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2939  0570 7b01          	ld	a,(OFST-3,sp)
2940  0572 a480          	and	a,#128
2941  0574 44            	srl	a
2942  0575 1a04          	or	a,(OFST+0,sp)
2943  0577 6b04          	ld	(OFST+0,sp),a
2945                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2947  0579 7b02          	ld	a,(OFST-2,sp)
2948  057b a43f          	and	a,#63
2949  057d 1e08          	ldw	x,(OFST+4,sp)
2950  057f f7            	ld	(x),a
2951                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2953  0580 7b02          	ld	a,(OFST-2,sp)
2954  0582 a440          	and	a,#64
2955  0584 1e08          	ldw	x,(OFST+4,sp)
2956  0586 e703          	ld	(3,x),a
2957                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2959  0588 7b02          	ld	a,(OFST-2,sp)
2960  058a a480          	and	a,#128
2961  058c 44            	srl	a
2962  058d 44            	srl	a
2963  058e 1a04          	or	a,(OFST+0,sp)
2964  0590 6b04          	ld	(OFST+0,sp),a
2966                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2968  0592 7b03          	ld	a,(OFST-1,sp)
2969  0594 a43f          	and	a,#63
2970  0596 1e08          	ldw	x,(OFST+4,sp)
2971  0598 e706          	ld	(6,x),a
2972                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2974  059a 7b03          	ld	a,(OFST-1,sp)
2975  059c a440          	and	a,#64
2976  059e 1e08          	ldw	x,(OFST+4,sp)
2977  05a0 e705          	ld	(5,x),a
2978                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2980  05a2 7b03          	ld	a,(OFST-1,sp)
2981  05a4 a480          	and	a,#128
2982  05a6 44            	srl	a
2983  05a7 44            	srl	a
2984  05a8 44            	srl	a
2985  05a9 1a04          	or	a,(OFST+0,sp)
2986  05ab 6b04          	ld	(OFST+0,sp),a
2988                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2990  05ad 7b04          	ld	a,(OFST+0,sp)
2991  05af 1e08          	ldw	x,(OFST+4,sp)
2992  05b1 e704          	ld	(4,x),a
2993                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2995  05b3 0d05          	tnz	(OFST+1,sp)
2996  05b5 262a          	jrne	L3131
2997                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2999  05b7 1e08          	ldw	x,(OFST+4,sp)
3000  05b9 f6            	ld	a,(x)
3001  05ba cd09b3        	call	L5_Bcd2ToByte
3003  05bd 1e08          	ldw	x,(OFST+4,sp)
3004  05bf f7            	ld	(x),a
3005                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
3007  05c0 1e08          	ldw	x,(OFST+4,sp)
3008  05c2 e601          	ld	a,(1,x)
3009  05c4 cd09b3        	call	L5_Bcd2ToByte
3011  05c7 1e08          	ldw	x,(OFST+4,sp)
3012  05c9 e701          	ld	(1,x),a
3013                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
3015  05cb 1e08          	ldw	x,(OFST+4,sp)
3016  05cd e602          	ld	a,(2,x)
3017  05cf cd09b3        	call	L5_Bcd2ToByte
3019  05d2 1e08          	ldw	x,(OFST+4,sp)
3020  05d4 e702          	ld	(2,x),a
3021                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
3023  05d6 1e08          	ldw	x,(OFST+4,sp)
3024  05d8 e606          	ld	a,(6,x)
3025  05da cd09b3        	call	L5_Bcd2ToByte
3027  05dd 1e08          	ldw	x,(OFST+4,sp)
3028  05df e706          	ld	(6,x),a
3029  05e1               L3131:
3030                     ; 1233 }
3033  05e1 5b05          	addw	sp,#5
3034  05e3 81            	ret
3098                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3098                     ; 1243 {
3099                     	switch	.text
3100  05e4               _RTC_AlarmCmd:
3102  05e4 5203          	subw	sp,#3
3103       00000003      OFST:	set	3
3106                     ; 1244   __IO uint16_t alrawfcount = 0;
3108  05e6 5f            	clrw	x
3109  05e7 1f01          	ldw	(OFST-2,sp),x
3111                     ; 1245   ErrorStatus status = ERROR;
3113                     ; 1246   uint8_t temp1 = 0;
3115                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3117                     ; 1252   RTC->WPR = 0xCA;
3119  05e9 35ca5159      	mov	20825,#202
3120                     ; 1253   RTC->WPR = 0x53;
3122  05ed 35535159      	mov	20825,#83
3123                     ; 1256   if (NewState != DISABLE)
3125  05f1 4d            	tnz	a
3126  05f2 2711          	jreq	L7431
3127                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3129  05f4 72105149      	bset	20809,#0
3130                     ; 1259     status = SUCCESS;
3132  05f8 a601          	ld	a,#1
3133  05fa 6b03          	ld	(OFST+0,sp),a
3136  05fc               L1531:
3137                     ; 1283   RTC->WPR = 0xFF; 
3139  05fc 35ff5159      	mov	20825,#255
3140                     ; 1286   return (ErrorStatus)status;
3142  0600 7b03          	ld	a,(OFST+0,sp)
3145  0602 5b03          	addw	sp,#3
3146  0604 81            	ret
3147  0605               L7431:
3148                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3150  0605 72115149      	bres	20809,#0
3151                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3153  0609 c6514c        	ld	a,20812
3154  060c a401          	and	a,#1
3155  060e 6b03          	ld	(OFST+0,sp),a
3158  0610 2007          	jra	L7531
3159  0612               L3531:
3160                     ; 1269       alrawfcount++;
3162  0612 1e01          	ldw	x,(OFST-2,sp)
3163  0614 1c0001        	addw	x,#1
3164  0617 1f01          	ldw	(OFST-2,sp),x
3166  0619               L7531:
3167                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3169  0619 1e01          	ldw	x,(OFST-2,sp)
3170  061b a3ffff        	cpw	x,#65535
3171  061e 2704          	jreq	L3631
3173  0620 0d03          	tnz	(OFST+0,sp)
3174  0622 27ee          	jreq	L3531
3175  0624               L3631:
3176                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3178  0624 c6514c        	ld	a,20812
3179  0627 a501          	bcp	a,#1
3180  0629 2604          	jrne	L5631
3181                     ; 1274       status = ERROR;
3183  062b 0f03          	clr	(OFST+0,sp)
3186  062d 20cd          	jra	L1531
3187  062f               L5631:
3188                     ; 1278       status = SUCCESS;
3190  062f a601          	ld	a,#1
3191  0631 6b03          	ld	(OFST+0,sp),a
3193  0633 20c7          	jra	L1531
3394                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3394                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3394                     ; 1300 {
3395                     	switch	.text
3396  0635               _RTC_AlarmSubSecondConfig:
3398  0635 89            	pushw	x
3399  0636 88            	push	a
3400       00000001      OFST:	set	1
3403                     ; 1301   uint8_t alarmstatus = 0;
3405                     ; 1302   ErrorStatus status = ERROR;
3407                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3409                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3411                     ; 1309   RTC->WPR = 0xCA;
3413  0637 35ca5159      	mov	20825,#202
3414                     ; 1310   RTC->WPR = 0x53;
3416  063b 35535159      	mov	20825,#83
3417                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3419  063f c6514c        	ld	a,20812
3420  0642 a540          	bcp	a,#64
3421  0644 2626          	jrne	L7641
3422                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3424  0646 c65149        	ld	a,20809
3425  0649 aa01          	or	a,#1
3426  064b 6b01          	ld	(OFST+0,sp),a
3428                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3430  064d 72115149      	bres	20809,#0
3431                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3433  0651 9e            	ld	a,xh
3434  0652 c75164        	ld	20836,a
3435                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3437  0655 9f            	ld	a,xl
3438  0656 c75165        	ld	20837,a
3439                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3441  0659 7b06          	ld	a,(OFST+5,sp)
3442  065b c75166        	ld	20838,a
3443                     ; 1327     RTC->CR2 |= alarmstatus;
3445  065e c65149        	ld	a,20809
3446  0661 1a01          	or	a,(OFST+0,sp)
3447  0663 c75149        	ld	20809,a
3448                     ; 1329     status = SUCCESS;
3450  0666 a601          	ld	a,#1
3451  0668 6b01          	ld	(OFST+0,sp),a
3454  066a 2002          	jra	L1741
3455  066c               L7641:
3456                     ; 1333     status = ERROR;
3458  066c 0f01          	clr	(OFST+0,sp)
3460  066e               L1741:
3461                     ; 1337   RTC->WPR = 0xFF; 
3463  066e 35ff5159      	mov	20825,#255
3464                     ; 1339   return (ErrorStatus)status;
3466  0672 7b01          	ld	a,(OFST+0,sp)
3469  0674 5b03          	addw	sp,#3
3470  0676 81            	ret
3560                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3560                     ; 1370 {
3561                     	switch	.text
3562  0677               _RTC_WakeUpClockConfig:
3564  0677 88            	push	a
3565       00000000      OFST:	set	0
3568                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3570                     ; 1376   RTC->WPR = 0xCA;
3572  0678 35ca5159      	mov	20825,#202
3573                     ; 1377   RTC->WPR = 0x53;
3575  067c 35535159      	mov	20825,#83
3576                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3578  0680 72155149      	bres	20809,#2
3579                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3581  0684 c65148        	ld	a,20808
3582  0687 a4f8          	and	a,#248
3583  0689 c75148        	ld	20808,a
3584                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3586  068c c65148        	ld	a,20808
3587  068f 1a01          	or	a,(OFST+1,sp)
3588  0691 c75148        	ld	20808,a
3589                     ; 1389   RTC->WPR = 0xFF; 
3591  0694 35ff5159      	mov	20825,#255
3592                     ; 1390 }
3595  0698 84            	pop	a
3596  0699 81            	ret
3631                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3631                     ; 1401 {
3632                     	switch	.text
3633  069a               _RTC_SetWakeUpCounter:
3637                     ; 1403   RTC->WPR = 0xCA;
3639  069a 35ca5159      	mov	20825,#202
3640                     ; 1404   RTC->WPR = 0x53;
3642  069e 35535159      	mov	20825,#83
3643                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3645  06a2 9e            	ld	a,xh
3646  06a3 c75154        	ld	20820,a
3647                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3649  06a6 9f            	ld	a,xl
3650  06a7 c75155        	ld	20821,a
3651                     ; 1412   RTC->WPR = 0xFF; 
3653  06aa 35ff5159      	mov	20825,#255
3654                     ; 1413 }
3657  06ae 81            	ret
3692                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3692                     ; 1421 {
3693                     	switch	.text
3694  06af               _RTC_GetWakeUpCounter:
3696  06af 89            	pushw	x
3697       00000002      OFST:	set	2
3700                     ; 1422   uint16_t tmpreg = 0;
3702                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3704  06b0 c65154        	ld	a,20820
3705  06b3 5f            	clrw	x
3706  06b4 97            	ld	xl,a
3707  06b5 4f            	clr	a
3708  06b6 02            	rlwa	x,a
3709  06b7 1f01          	ldw	(OFST-1,sp),x
3711                     ; 1426   tmpreg |= RTC->WUTRL;
3713  06b9 c65155        	ld	a,20821
3714  06bc 5f            	clrw	x
3715  06bd 97            	ld	xl,a
3716  06be 01            	rrwa	x,a
3717  06bf 1a02          	or	a,(OFST+0,sp)
3718  06c1 01            	rrwa	x,a
3719  06c2 1a01          	or	a,(OFST-1,sp)
3720  06c4 01            	rrwa	x,a
3721  06c5 1f01          	ldw	(OFST-1,sp),x
3723                     ; 1429   return (uint16_t)tmpreg;
3725  06c7 1e01          	ldw	x,(OFST-1,sp)
3728  06c9 5b02          	addw	sp,#2
3729  06cb 81            	ret
3784                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3784                     ; 1441 {
3785                     	switch	.text
3786  06cc               _RTC_WakeUpCmd:
3788  06cc 5203          	subw	sp,#3
3789       00000003      OFST:	set	3
3792                     ; 1442   ErrorStatus status = ERROR;
3794                     ; 1443   uint16_t wutwfcount = 0;
3796  06ce 5f            	clrw	x
3797  06cf 1f02          	ldw	(OFST-1,sp),x
3799                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3801                     ; 1449   RTC->WPR = 0xCA;
3803  06d1 35ca5159      	mov	20825,#202
3804                     ; 1450   RTC->WPR = 0x53;
3806  06d5 35535159      	mov	20825,#83
3807                     ; 1452   if (NewState != DISABLE)
3809  06d9 4d            	tnz	a
3810  06da 2711          	jreq	L3161
3811                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3813  06dc 72145149      	bset	20809,#2
3814                     ; 1457     status = SUCCESS;
3816  06e0 a601          	ld	a,#1
3817  06e2 6b01          	ld	(OFST-2,sp),a
3820  06e4               L5161:
3821                     ; 1482   RTC->WPR = 0xFF; 
3823  06e4 35ff5159      	mov	20825,#255
3824                     ; 1485   return (ErrorStatus)status;
3826  06e8 7b01          	ld	a,(OFST-2,sp)
3829  06ea 5b03          	addw	sp,#3
3830  06ec 81            	ret
3831  06ed               L3161:
3832                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3834  06ed 72155149      	bres	20809,#2
3836  06f1 2007          	jra	L1261
3837  06f3               L7161:
3838                     ; 1467       wutwfcount++;
3840  06f3 1e02          	ldw	x,(OFST-1,sp)
3841  06f5 1c0001        	addw	x,#1
3842  06f8 1f02          	ldw	(OFST-1,sp),x
3844  06fa               L1261:
3845                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3847  06fa c6514c        	ld	a,20812
3848  06fd a504          	bcp	a,#4
3849  06ff 2607          	jrne	L5261
3851  0701 1e02          	ldw	x,(OFST-1,sp)
3852  0703 a3ffff        	cpw	x,#65535
3853  0706 26eb          	jrne	L7161
3854  0708               L5261:
3855                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3857  0708 c6514c        	ld	a,20812
3858  070b a504          	bcp	a,#4
3859  070d 2604          	jrne	L7261
3860                     ; 1473       status = ERROR;
3862  070f 0f01          	clr	(OFST-2,sp)
3865  0711 20d1          	jra	L5161
3866  0713               L7261:
3867                     ; 1477       status = SUCCESS;
3869  0713 a601          	ld	a,#1
3870  0715 6b01          	ld	(OFST-2,sp),a
3872  0717 20cb          	jra	L5161
3962                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3962                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3962                     ; 1524 {
3963                     	switch	.text
3964  0719               _RTC_DayLightSavingConfig:
3966  0719 89            	pushw	x
3967       00000000      OFST:	set	0
3970                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3972                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3974                     ; 1530   RTC->WPR = 0xCA;
3976  071a 35ca5159      	mov	20825,#202
3977                     ; 1531   RTC->WPR = 0x53;
3979  071e 35535159      	mov	20825,#83
3980                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3982  0722 7215514a      	bres	20810,#2
3983                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3985  0726 9f            	ld	a,xl
3986  0727 1a01          	or	a,(OFST+1,sp)
3987  0729 ca514a        	or	a,20810
3988  072c c7514a        	ld	20810,a
3989                     ; 1540   RTC->WPR = 0xFF; 
3991  072f 35ff5159      	mov	20825,#255
3992                     ; 1541 }
3995  0733 85            	popw	x
3996  0734 81            	ret
4021                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
4021                     ; 1550 {
4022                     	switch	.text
4023  0735               _RTC_GetStoreOperation:
4027                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4029  0735 c6514a        	ld	a,20810
4030  0738 a404          	and	a,#4
4033  073a 81            	ret
4127                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4127                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4127                     ; 1589 {
4128                     	switch	.text
4129  073b               _RTC_OutputConfig:
4131  073b 89            	pushw	x
4132       00000000      OFST:	set	0
4135                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4137                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4139                     ; 1595   RTC->WPR = 0xCA;
4141  073c 35ca5159      	mov	20825,#202
4142                     ; 1596   RTC->WPR = 0x53;
4144  0740 35535159      	mov	20825,#83
4145                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4147  0744 c6514a        	ld	a,20810
4148  0747 a48f          	and	a,#143
4149  0749 c7514a        	ld	20810,a
4150                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4152  074c 9f            	ld	a,xl
4153  074d 1a01          	or	a,(OFST+1,sp)
4154  074f ca514a        	or	a,20810
4155  0752 c7514a        	ld	20810,a
4156                     ; 1605   RTC->WPR = 0xFF; 
4158  0755 35ff5159      	mov	20825,#255
4159                     ; 1606 }
4162  0759 85            	popw	x
4163  075a 81            	ret
4258                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4258                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4258                     ; 1641 {
4259                     	switch	.text
4260  075b               _RTC_SynchroShiftConfig:
4262  075b 88            	push	a
4263  075c 5203          	subw	sp,#3
4264       00000003      OFST:	set	3
4267                     ; 1642   uint8_t shiftrhreg = 0;
4269                     ; 1643   ErrorStatus status = ERROR;
4271                     ; 1644   uint16_t shpfcount = 0;
4273  075e 5f            	clrw	x
4274  075f 1f02          	ldw	(OFST-1,sp),x
4276                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4278                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4280                     ; 1651   RTC->WPR = 0xCA;
4282  0761 35ca5159      	mov	20825,#202
4283                     ; 1652   RTC->WPR = 0x53;
4285  0765 35535159      	mov	20825,#83
4286                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4288  0769 c6514c        	ld	a,20812
4289  076c a508          	bcp	a,#8
4290  076e 2717          	jreq	L7102
4292  0770 2007          	jra	L3202
4293  0772               L1202:
4294                     ; 1660       shpfcount++;
4296  0772 1e02          	ldw	x,(OFST-1,sp)
4297  0774 1c0001        	addw	x,#1
4298  0777 1f02          	ldw	(OFST-1,sp),x
4300  0779               L3202:
4301                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4303  0779 c6514c        	ld	a,20812
4304  077c a508          	bcp	a,#8
4305  077e 2707          	jreq	L7102
4307  0780 1e02          	ldw	x,(OFST-1,sp)
4308  0782 a3ffff        	cpw	x,#65535
4309  0785 26eb          	jrne	L1202
4310  0787               L7102:
4311                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4313  0787 c6514c        	ld	a,20812
4314  078a a508          	bcp	a,#8
4315  078c 2616          	jrne	L1302
4316                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4318  078e 7b07          	ld	a,(OFST+4,sp)
4319  0790 1a04          	or	a,(OFST+1,sp)
4320  0792 6b01          	ld	(OFST-2,sp),a
4322                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4324  0794 7b01          	ld	a,(OFST-2,sp)
4325  0796 c7515a        	ld	20826,a
4326                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4328  0799 7b08          	ld	a,(OFST+5,sp)
4329  079b c7515b        	ld	20827,a
4330                     ; 1672     status = SUCCESS;
4332  079e a601          	ld	a,#1
4333  07a0 6b01          	ld	(OFST-2,sp),a
4336  07a2 2002          	jra	L3302
4337  07a4               L1302:
4338                     ; 1676     status = ERROR;
4340  07a4 0f01          	clr	(OFST-2,sp)
4342  07a6               L3302:
4343                     ; 1680   RTC->WPR = 0xFF; 
4345  07a6 35ff5159      	mov	20825,#255
4346                     ; 1682   return (ErrorStatus)(status);
4348  07aa 7b01          	ld	a,(OFST-2,sp)
4351  07ac 5b04          	addw	sp,#4
4352  07ae 81            	ret
4482                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4482                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4482                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4482                     ; 1721 {
4483                     	switch	.text
4484  07af               _RTC_SmoothCalibConfig:
4486  07af 89            	pushw	x
4487  07b0 5203          	subw	sp,#3
4488       00000003      OFST:	set	3
4491                     ; 1722   ErrorStatus status = ERROR;
4493                     ; 1723   uint16_t recalpfcount = 0;
4495  07b2 5f            	clrw	x
4496  07b3 1f02          	ldw	(OFST-1,sp),x
4498                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4500                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4502                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4504                     ; 1731   RTC->WPR = 0xCA;
4506  07b5 35ca5159      	mov	20825,#202
4507                     ; 1732   RTC->WPR = 0x53;
4509  07b9 35535159      	mov	20825,#83
4510                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4512  07bd c6514c        	ld	a,20812
4513  07c0 a502          	bcp	a,#2
4514  07c2 2717          	jreq	L5112
4516  07c4 2007          	jra	L1212
4517  07c6               L7112:
4518                     ; 1740       recalpfcount++;
4520  07c6 1e02          	ldw	x,(OFST-1,sp)
4521  07c8 1c0001        	addw	x,#1
4522  07cb 1f02          	ldw	(OFST-1,sp),x
4524  07cd               L1212:
4525                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4527  07cd c6514c        	ld	a,20812
4528  07d0 a502          	bcp	a,#2
4529  07d2 2707          	jreq	L5112
4531  07d4 1e02          	ldw	x,(OFST-1,sp)
4532  07d6 a3ffff        	cpw	x,#65535
4533  07d9 26eb          	jrne	L7112
4534  07db               L5112:
4535                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4537  07db c6514c        	ld	a,20812
4538  07de a502          	bcp	a,#2
4539  07e0 2614          	jrne	L7212
4540                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4540                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4540                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4542  07e2 7b04          	ld	a,(OFST+1,sp)
4543  07e4 1a05          	or	a,(OFST+2,sp)
4544  07e6 1a08          	or	a,(OFST+5,sp)
4545  07e8 c7516a        	ld	20842,a
4546                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4548  07eb 7b09          	ld	a,(OFST+6,sp)
4549  07ed c7516b        	ld	20843,a
4550                     ; 1754     status = SUCCESS;
4552  07f0 a601          	ld	a,#1
4553  07f2 6b01          	ld	(OFST-2,sp),a
4556  07f4 2002          	jra	L1312
4557  07f6               L7212:
4558                     ; 1758     status = ERROR;
4560  07f6 0f01          	clr	(OFST-2,sp)
4562  07f8               L1312:
4563                     ; 1762   RTC->WPR = 0xFF; 
4565  07f8 35ff5159      	mov	20825,#255
4566                     ; 1764   return (ErrorStatus)(status);
4568  07fc 7b01          	ld	a,(OFST-2,sp)
4571  07fe 5b05          	addw	sp,#5
4572  0800 81            	ret
4630                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4630                     ; 1791 {
4631                     	switch	.text
4632  0801               _RTC_CalibOutputConfig:
4636                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4638                     ; 1796   RTC->WPR = 0xCA;
4640  0801 35ca5159      	mov	20825,#202
4641                     ; 1797   RTC->WPR = 0x53;
4643  0805 35535159      	mov	20825,#83
4644                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4646  0809 4d            	tnz	a
4647  080a 2706          	jreq	L1612
4648                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4650  080c 7216514a      	bset	20810,#3
4652  0810 2004          	jra	L3612
4653  0812               L1612:
4654                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4656  0812 7217514a      	bres	20810,#3
4657  0816               L3612:
4658                     ; 1811   RTC->WPR = 0xFF; 
4660  0816 35ff5159      	mov	20825,#255
4661                     ; 1812 }
4664  081a 81            	ret
4699                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4699                     ; 1821 {
4700                     	switch	.text
4701  081b               _RTC_CalibOutputCmd:
4705                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4707                     ; 1826   RTC->WPR = 0xCA;
4709  081b 35ca5159      	mov	20825,#202
4710                     ; 1827   RTC->WPR = 0x53;
4712  081f 35535159      	mov	20825,#83
4713                     ; 1829   if (NewState != DISABLE)
4715  0823 4d            	tnz	a
4716  0824 2706          	jreq	L3022
4717                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4719  0826 721e514a      	bset	20810,#7
4721  082a 2004          	jra	L5022
4722  082c               L3022:
4723                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4725  082c 721f514a      	bres	20810,#7
4726  0830               L5022:
4727                     ; 1841   RTC->WPR = 0xFF; 
4729  0830 35ff5159      	mov	20825,#255
4730                     ; 1842 }
4733  0834 81            	ret
4828                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4828                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4828                     ; 1873 {
4829                     	switch	.text
4830  0835               _RTC_TamperLevelConfig:
4832  0835 89            	pushw	x
4833       00000000      OFST:	set	0
4836                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4838                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4840                     ; 1879   RTC->WPR = 0xCA;
4842  0836 35ca5159      	mov	20825,#202
4843                     ; 1880   RTC->WPR = 0x53;
4845  083a 35535159      	mov	20825,#83
4846                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4848  083e 9f            	ld	a,xl
4849  083f 4d            	tnz	a
4850  0840 270a          	jreq	L3522
4851                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4853  0842 9e            	ld	a,xh
4854  0843 48            	sll	a
4855  0844 ca516c        	or	a,20844
4856  0847 c7516c        	ld	20844,a
4858  084a 200a          	jra	L5522
4859  084c               L3522:
4860                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4862  084c 7b01          	ld	a,(OFST+1,sp)
4863  084e 48            	sll	a
4864  084f 43            	cpl	a
4865  0850 c4516c        	and	a,20844
4866  0853 c7516c        	ld	20844,a
4867  0856               L5522:
4868                     ; 1894   RTC->WPR = 0xFF; 
4870  0856 35ff5159      	mov	20825,#255
4871                     ; 1895 }
4874  085a 85            	popw	x
4875  085b 81            	ret
4949                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4949                     ; 1904 {
4950                     	switch	.text
4951  085c               _RTC_TamperFilterConfig:
4953  085c 88            	push	a
4954       00000000      OFST:	set	0
4957                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4959                     ; 1910   RTC->WPR = 0xCA;
4961  085d 35ca5159      	mov	20825,#202
4962                     ; 1911   RTC->WPR = 0x53;
4964  0861 35535159      	mov	20825,#83
4965                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4967  0865 c6516d        	ld	a,20845
4968  0868 a4e7          	and	a,#231
4969  086a c7516d        	ld	20845,a
4970                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4972  086d c6516d        	ld	a,20845
4973  0870 1a01          	or	a,(OFST+1,sp)
4974  0872 c7516d        	ld	20845,a
4975                     ; 1920   RTC->WPR = 0xFF; 
4977  0875 35ff5159      	mov	20825,#255
4978                     ; 1922 }
4981  0879 84            	pop	a
4982  087a 81            	ret
5095                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5095                     ; 1932 {
5096                     	switch	.text
5097  087b               _RTC_TamperSamplingFreqConfig:
5099  087b 88            	push	a
5100       00000000      OFST:	set	0
5103                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5105                     ; 1937   RTC->WPR = 0xCA;
5107  087c 35ca5159      	mov	20825,#202
5108                     ; 1938   RTC->WPR = 0x53;
5110  0880 35535159      	mov	20825,#83
5111                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5113  0884 c6516d        	ld	a,20845
5114  0887 a4f8          	and	a,#248
5115  0889 c7516d        	ld	20845,a
5116                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5118  088c c6516d        	ld	a,20845
5119  088f 1a01          	or	a,(OFST+1,sp)
5120  0891 c7516d        	ld	20845,a
5121                     ; 1947   RTC->WPR = 0xFF; 
5123  0894 35ff5159      	mov	20825,#255
5124                     ; 1948 }
5127  0898 84            	pop	a
5128  0899 81            	ret
5211                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5211                     ; 1959 {
5212                     	switch	.text
5213  089a               _RTC_TamperPinsPrechargeDuration:
5215  089a 88            	push	a
5216       00000000      OFST:	set	0
5219                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5221                     ; 1964   RTC->WPR = 0xCA;
5223  089b 35ca5159      	mov	20825,#202
5224                     ; 1965   RTC->WPR = 0x53;
5226  089f 35535159      	mov	20825,#83
5227                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5229  08a3 c6516d        	ld	a,20845
5230  08a6 a41f          	and	a,#31
5231  08a8 c7516d        	ld	20845,a
5232                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5234  08ab c6516d        	ld	a,20845
5235  08ae 1a01          	or	a,(OFST+1,sp)
5236  08b0 c7516d        	ld	20845,a
5237                     ; 1974   RTC->WPR = 0xFF; 
5239  08b3 35ff5159      	mov	20825,#255
5240                     ; 1975 }
5243  08b7 84            	pop	a
5244  08b8 81            	ret
5289                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5289                     ; 1988                    FunctionalState NewState)
5289                     ; 1989 {
5290                     	switch	.text
5291  08b9               _RTC_TamperCmd:
5293  08b9 89            	pushw	x
5294       00000000      OFST:	set	0
5297                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5299                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5301                     ; 1996   RTC->WPR = 0xCA;
5303  08ba 35ca5159      	mov	20825,#202
5304                     ; 1997   RTC->WPR = 0x53;
5306  08be 35535159      	mov	20825,#83
5307                     ; 2000   if (NewState != DISABLE)
5309  08c2 9f            	ld	a,xl
5310  08c3 4d            	tnz	a
5311  08c4 2709          	jreq	L1342
5312                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5314  08c6 9e            	ld	a,xh
5315  08c7 ca516c        	or	a,20844
5316  08ca c7516c        	ld	20844,a
5318  08cd 2009          	jra	L3342
5319  08cf               L1342:
5320                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5322  08cf 7b01          	ld	a,(OFST+1,sp)
5323  08d1 43            	cpl	a
5324  08d2 c4516c        	and	a,20844
5325  08d5 c7516c        	ld	20844,a
5326  08d8               L3342:
5327                     ; 2013   RTC->WPR = 0xFF; 
5329  08d8 35ff5159      	mov	20825,#255
5330                     ; 2014 }
5333  08dc 85            	popw	x
5334  08dd 81            	ret
5406                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5406                     ; 2059 {
5407                     	switch	.text
5408  08de               _RTC_ITConfig:
5410  08de 89            	pushw	x
5411       00000000      OFST:	set	0
5414                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5416                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5418                     ; 2065   RTC->WPR = 0xCA;
5420  08df 35ca5159      	mov	20825,#202
5421                     ; 2066   RTC->WPR = 0x53;
5423  08e3 35535159      	mov	20825,#83
5424                     ; 2068   if (NewState != DISABLE)
5426  08e7 0d05          	tnz	(OFST+5,sp)
5427  08e9 2715          	jreq	L1742
5428                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5430  08eb 9f            	ld	a,xl
5431  08ec a4f0          	and	a,#240
5432  08ee ca5149        	or	a,20809
5433  08f1 c75149        	ld	20809,a
5434                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5436  08f4 7b02          	ld	a,(OFST+2,sp)
5437  08f6 a401          	and	a,#1
5438  08f8 ca516c        	or	a,20844
5439  08fb c7516c        	ld	20844,a
5441  08fe 2016          	jra	L3742
5442  0900               L1742:
5443                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5445  0900 7b02          	ld	a,(OFST+2,sp)
5446  0902 a4f0          	and	a,#240
5447  0904 43            	cpl	a
5448  0905 c45149        	and	a,20809
5449  0908 c75149        	ld	20809,a
5450                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5452  090b 7b02          	ld	a,(OFST+2,sp)
5453  090d a401          	and	a,#1
5454  090f 43            	cpl	a
5455  0910 c4516c        	and	a,20844
5456  0913 c7516c        	ld	20844,a
5457  0916               L3742:
5458                     ; 2082   RTC->WPR = 0xFF; 
5460  0916 35ff5159      	mov	20825,#255
5461                     ; 2083 }
5464  091a 85            	popw	x
5465  091b 81            	ret
5639                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5639                     ; 2091 {
5640                     	switch	.text
5641  091c               _RTC_GetFlagStatus:
5643  091c 89            	pushw	x
5644  091d 5203          	subw	sp,#3
5645       00000003      OFST:	set	3
5648                     ; 2092   FlagStatus flagstatus = RESET;
5650                     ; 2093   uint16_t tmpreg1 = 0;
5652                     ; 2094   uint16_t tmpreg2 = 0;
5654                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5656                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5658  091f c6514c        	ld	a,20812
5659  0922 5f            	clrw	x
5660  0923 97            	ld	xl,a
5661  0924 4f            	clr	a
5662  0925 02            	rlwa	x,a
5663  0926 1f02          	ldw	(OFST-1,sp),x
5665                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5667  0928 c6514d        	ld	a,20813
5668  092b 5f            	clrw	x
5669  092c 97            	ld	xl,a
5670  092d 01            	rrwa	x,a
5671  092e 1a03          	or	a,(OFST+0,sp)
5672  0930 01            	rrwa	x,a
5673  0931 1a02          	or	a,(OFST-1,sp)
5674  0933 01            	rrwa	x,a
5675  0934 1f02          	ldw	(OFST-1,sp),x
5677                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5679  0936 1e02          	ldw	x,(OFST-1,sp)
5680  0938 01            	rrwa	x,a
5681  0939 1405          	and	a,(OFST+2,sp)
5682  093b 01            	rrwa	x,a
5683  093c 1404          	and	a,(OFST+1,sp)
5684  093e 01            	rrwa	x,a
5685  093f a30000        	cpw	x,#0
5686  0942 2706          	jreq	L3752
5687                     ; 2106     flagstatus = SET;
5689  0944 a601          	ld	a,#1
5690  0946 6b01          	ld	(OFST-2,sp),a
5693  0948 2002          	jra	L5752
5694  094a               L3752:
5695                     ; 2110     flagstatus = RESET;
5697  094a 0f01          	clr	(OFST-2,sp)
5699  094c               L5752:
5700                     ; 2112   return (FlagStatus)flagstatus;
5702  094c 7b01          	ld	a,(OFST-2,sp)
5705  094e 5b05          	addw	sp,#5
5706  0950 81            	ret
5741                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5741                     ; 2123 {
5742                     	switch	.text
5743  0951               _RTC_ClearFlag:
5745  0951 89            	pushw	x
5746       00000000      OFST:	set	0
5749                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5751                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5753  0952 9f            	ld	a,xl
5754  0953 43            	cpl	a
5755  0954 c7514d        	ld	20813,a
5756                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5758  0957 7b01          	ld	a,(OFST+1,sp)
5759  0959 43            	cpl	a
5760  095a a47f          	and	a,#127
5761  095c c7514c        	ld	20812,a
5762                     ; 2130 }
5765  095f 85            	popw	x
5766  0960 81            	ret
5830                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5830                     ; 2139 {
5831                     	switch	.text
5832  0961               _RTC_GetITStatus:
5834  0961 89            	pushw	x
5835  0962 89            	pushw	x
5836       00000002      OFST:	set	2
5839                     ; 2140   ITStatus itstatus = RESET;
5841                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5845                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5847                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5849  0963 9f            	ld	a,xl
5850  0964 c45149        	and	a,20809
5851  0967 6b01          	ld	(OFST-1,sp),a
5853                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5855  0969 1e03          	ldw	x,(OFST+1,sp)
5856  096b 54            	srlw	x
5857  096c 54            	srlw	x
5858  096d 54            	srlw	x
5859  096e 54            	srlw	x
5860  096f 9f            	ld	a,xl
5861  0970 c4514d        	and	a,20813
5862  0973 6b02          	ld	(OFST+0,sp),a
5864                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5866  0975 0d01          	tnz	(OFST-1,sp)
5867  0977 270a          	jreq	L7462
5869  0979 0d02          	tnz	(OFST+0,sp)
5870  097b 2706          	jreq	L7462
5871                     ; 2155     itstatus = SET;
5873  097d a601          	ld	a,#1
5874  097f 6b02          	ld	(OFST+0,sp),a
5877  0981 2002          	jra	L1562
5878  0983               L7462:
5879                     ; 2159     itstatus = RESET;
5881  0983 0f02          	clr	(OFST+0,sp)
5883  0985               L1562:
5884                     ; 2162   return (ITStatus)itstatus;
5886  0985 7b02          	ld	a,(OFST+0,sp)
5889  0987 5b04          	addw	sp,#4
5890  0989 81            	ret
5926                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5926                     ; 2173 {
5927                     	switch	.text
5928  098a               _RTC_ClearITPendingBit:
5932                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5934                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5936  098a 54            	srlw	x
5937  098b 54            	srlw	x
5938  098c 54            	srlw	x
5939  098d 54            	srlw	x
5940  098e 9f            	ld	a,xl
5941  098f 43            	cpl	a
5942  0990 c7514d        	ld	20813,a
5943                     ; 2179 }
5946  0993 81            	ret
5989                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5989                     ; 2203 {
5990                     	switch	.text
5991  0994               L3_ByteToBcd2:
5993  0994 88            	push	a
5994  0995 88            	push	a
5995       00000001      OFST:	set	1
5998                     ; 2204   uint8_t bcdhigh = 0;
6000  0996 0f01          	clr	(OFST+0,sp)
6003  0998 2008          	jra	L7172
6004  099a               L3172:
6005                     ; 2208     bcdhigh++;
6007  099a 0c01          	inc	(OFST+0,sp)
6009                     ; 2209     Value -= 10;
6011  099c 7b02          	ld	a,(OFST+1,sp)
6012  099e a00a          	sub	a,#10
6013  09a0 6b02          	ld	(OFST+1,sp),a
6014  09a2               L7172:
6015                     ; 2206   while (Value >= 10)
6017  09a2 7b02          	ld	a,(OFST+1,sp)
6018  09a4 a10a          	cp	a,#10
6019  09a6 24f2          	jruge	L3172
6020                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
6022  09a8 7b01          	ld	a,(OFST+0,sp)
6023  09aa 97            	ld	xl,a
6024  09ab a610          	ld	a,#16
6025  09ad 42            	mul	x,a
6026  09ae 9f            	ld	a,xl
6027  09af 1a02          	or	a,(OFST+1,sp)
6030  09b1 85            	popw	x
6031  09b2 81            	ret
6074                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
6074                     ; 2221 {
6075                     	switch	.text
6076  09b3               L5_Bcd2ToByte:
6078  09b3 88            	push	a
6079  09b4 88            	push	a
6080       00000001      OFST:	set	1
6083                     ; 2222   uint8_t tmp = 0;
6085                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6087  09b5 a4f0          	and	a,#240
6088  09b7 4e            	swap	a
6089  09b8 a40f          	and	a,#15
6090  09ba 97            	ld	xl,a
6091  09bb a60a          	ld	a,#10
6092  09bd 42            	mul	x,a
6093  09be 9f            	ld	a,xl
6094  09bf 6b01          	ld	(OFST+0,sp),a
6096                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6098  09c1 7b02          	ld	a,(OFST+1,sp)
6099  09c3 a40f          	and	a,#15
6100  09c5 1b01          	add	a,(OFST+0,sp)
6103  09c7 85            	popw	x
6104  09c8 81            	ret
6117                     	xdef	_RTC_ClearITPendingBit
6118                     	xdef	_RTC_GetITStatus
6119                     	xdef	_RTC_ClearFlag
6120                     	xdef	_RTC_GetFlagStatus
6121                     	xdef	_RTC_ITConfig
6122                     	xdef	_RTC_TamperCmd
6123                     	xdef	_RTC_TamperPinsPrechargeDuration
6124                     	xdef	_RTC_TamperSamplingFreqConfig
6125                     	xdef	_RTC_TamperFilterConfig
6126                     	xdef	_RTC_TamperLevelConfig
6127                     	xdef	_RTC_CalibOutputCmd
6128                     	xdef	_RTC_CalibOutputConfig
6129                     	xdef	_RTC_SmoothCalibConfig
6130                     	xdef	_RTC_SynchroShiftConfig
6131                     	xdef	_RTC_OutputConfig
6132                     	xdef	_RTC_GetStoreOperation
6133                     	xdef	_RTC_DayLightSavingConfig
6134                     	xdef	_RTC_WakeUpCmd
6135                     	xdef	_RTC_GetWakeUpCounter
6136                     	xdef	_RTC_SetWakeUpCounter
6137                     	xdef	_RTC_WakeUpClockConfig
6138                     	xdef	_RTC_AlarmSubSecondConfig
6139                     	xdef	_RTC_AlarmCmd
6140                     	xdef	_RTC_GetAlarm
6141                     	xdef	_RTC_AlarmStructInit
6142                     	xdef	_RTC_SetAlarm
6143                     	xdef	_RTC_GetDate
6144                     	xdef	_RTC_DateStructInit
6145                     	xdef	_RTC_SetDate
6146                     	xdef	_RTC_GetSubSecond
6147                     	xdef	_RTC_GetTime
6148                     	xdef	_RTC_TimeStructInit
6149                     	xdef	_RTC_SetTime
6150                     	xdef	_RTC_BypassShadowCmd
6151                     	xdef	_RTC_RatioCmd
6152                     	xdef	_RTC_WaitForSynchro
6153                     	xdef	_RTC_ExitInitMode
6154                     	xdef	_RTC_EnterInitMode
6155                     	xdef	_RTC_WriteProtectionCmd
6156                     	xdef	_RTC_StructInit
6157                     	xdef	_RTC_Init
6158                     	xdef	_RTC_DeInit
6177                     	end
