   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 95 void WFE_DeInit(void)
  43                     ; 96 {
  45                     	switch	.text
  46  0000               _WFE_DeInit:
  50                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  52  0000 725f50a6      	clr	20646
  53                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  55  0004 725f50a7      	clr	20647
  56                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  58  0008 725f50a8      	clr	20648
  59                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  61  000c 725f50a9      	clr	20649
  62                     ; 101 }
  65  0010 81            	ret
 389                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 389                     ; 142 {
 390                     	switch	.text
 391  0011               _WFE_WakeUpSourceEventCmd:
 393  0011 89            	pushw	x
 394  0012 88            	push	a
 395       00000001      OFST:	set	1
 398                     ; 143   uint8_t register_index = 0;
 400                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 402                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 404                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 406  0013 9e            	ld	a,xh
 407  0014 6b01          	ld	(OFST+0,sp),a
 409                     ; 151   if (NewState != DISABLE)
 411  0016 0d06          	tnz	(OFST+5,sp)
 412  0018 273c          	jreq	L502
 413                     ; 153     switch (register_index)
 415  001a 7b01          	ld	a,(OFST+0,sp)
 417                     ; 171       default:
 417                     ; 172         break;
 418  001c 4a            	dec	a
 419  001d 270b          	jreq	L12
 420  001f 4a            	dec	a
 421  0020 2712          	jreq	L32
 422  0022 4a            	dec	a
 423  0023 2719          	jreq	L52
 424  0025 4a            	dec	a
 425  0026 2720          	jreq	L72
 426  0028 2045          	jra	L312
 427  002a               L12:
 428                     ; 155       case 1:
 428                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 430  002a c650a6        	ld	a,20646
 431  002d 1a03          	or	a,(OFST+2,sp)
 432  002f c750a6        	ld	20646,a
 433                     ; 157         break;
 435  0032 203b          	jra	L312
 436  0034               L32:
 437                     ; 159       case 2:
 437                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 439  0034 c650a7        	ld	a,20647
 440  0037 1a03          	or	a,(OFST+2,sp)
 441  0039 c750a7        	ld	20647,a
 442                     ; 161         break;
 444  003c 2031          	jra	L312
 445  003e               L52:
 446                     ; 163       case 3:
 446                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 448  003e c650a8        	ld	a,20648
 449  0041 1a03          	or	a,(OFST+2,sp)
 450  0043 c750a8        	ld	20648,a
 451                     ; 165         break;
 453  0046 2027          	jra	L312
 454  0048               L72:
 455                     ; 167       case 4:
 455                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 457  0048 c650a9        	ld	a,20649
 458  004b 1a03          	or	a,(OFST+2,sp)
 459  004d c750a9        	ld	20649,a
 460                     ; 169         break;
 462  0050 201d          	jra	L312
 463  0052               L13:
 464                     ; 171       default:
 464                     ; 172         break;
 466  0052 201b          	jra	L312
 467  0054               L112:
 469  0054 2019          	jra	L312
 470  0056               L502:
 471                     ; 177     switch (register_index)
 473  0056 7b01          	ld	a,(OFST+0,sp)
 475                     ; 195       default:
 475                     ; 196         break;
 476  0058 4a            	dec	a
 477  0059 270b          	jreq	L33
 478  005b 4a            	dec	a
 479  005c 2714          	jreq	L53
 480  005e 4a            	dec	a
 481  005f 271c          	jreq	L73
 482  0061 4a            	dec	a
 483  0062 2724          	jreq	L14
 484  0064 2009          	jra	L312
 485  0066               L33:
 486                     ; 179       case 1:
 486                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 488  0066 7b03          	ld	a,(OFST+2,sp)
 489  0068 43            	cpl	a
 490  0069 c450a6        	and	a,20646
 491  006c c750a6        	ld	20646,a
 492                     ; 181         break;
 493  006f               L312:
 494                     ; 199 }
 497  006f 5b03          	addw	sp,#3
 498  0071 81            	ret
 499  0072               L53:
 500                     ; 183       case 2:
 500                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 502  0072 7b03          	ld	a,(OFST+2,sp)
 503  0074 43            	cpl	a
 504  0075 c450a7        	and	a,20647
 505  0078 c750a7        	ld	20647,a
 506                     ; 185         break;
 508  007b 20f2          	jra	L312
 509  007d               L73:
 510                     ; 187       case 3:
 510                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 512  007d 7b03          	ld	a,(OFST+2,sp)
 513  007f 43            	cpl	a
 514  0080 c450a8        	and	a,20648
 515  0083 c750a8        	ld	20648,a
 516                     ; 189         break;
 518  0086 20e7          	jra	L312
 519  0088               L14:
 520                     ; 191       case 4:
 520                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 522  0088 7b03          	ld	a,(OFST+2,sp)
 523  008a 43            	cpl	a
 524  008b c450a9        	and	a,20649
 525  008e c750a9        	ld	20649,a
 526                     ; 193         break;
 528  0091 20dc          	jra	L312
 529  0093               L34:
 530                     ; 195       default:
 530                     ; 196         break;
 532  0093 20da          	jra	L312
 533  0095               L712:
 534  0095 20d8          	jra	L312
 581                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 581                     ; 238 {
 582                     	switch	.text
 583  0097               _WFE_GetWakeUpSourceEventStatus:
 585  0097 89            	pushw	x
 586  0098 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 239   FunctionalState status = DISABLE;
 592  0099 0f01          	clr	(OFST+0,sp)
 594                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 596                     ; 243   switch (WFE_Source)
 599                     ; 326     default:
 599                     ; 327       break;
 600  009b 1d0101        	subw	x,#257
 601  009e 2603          	jrne	L21
 602  00a0 cc013e        	jp	L122
 603  00a3               L21:
 604  00a3 5a            	decw	x
 605  00a4 2603          	jrne	L41
 606  00a6 cc013e        	jp	L122
 607  00a9               L41:
 608  00a9 1d0002        	subw	x,#2
 609  00ac 2603          	jrne	L61
 610  00ae cc013e        	jp	L122
 611  00b1               L61:
 612  00b1 1d0004        	subw	x,#4
 613  00b4 2603          	jrne	L02
 614  00b6 cc013e        	jp	L122
 615  00b9               L02:
 616  00b9 1d0008        	subw	x,#8
 617  00bc 2602          	jrne	L22
 618  00be 207e          	jp	L122
 619  00c0               L22:
 620  00c0 1d0010        	subw	x,#16
 621  00c3 2779          	jreq	L122
 622  00c5 1d0020        	subw	x,#32
 623  00c8 2774          	jreq	L122
 624  00ca 1d0040        	subw	x,#64
 625  00cd 276f          	jreq	L122
 626  00cf 1d0081        	subw	x,#129
 627  00d2 277b          	jreq	L322
 628  00d4 5a            	decw	x
 629  00d5 2778          	jreq	L322
 630  00d7 1d0002        	subw	x,#2
 631  00da 2773          	jreq	L322
 632  00dc 1d0004        	subw	x,#4
 633  00df 276e          	jreq	L322
 634  00e1 1d0008        	subw	x,#8
 635  00e4 2769          	jreq	L322
 636  00e6 1d0010        	subw	x,#16
 637  00e9 2764          	jreq	L322
 638  00eb 1d0020        	subw	x,#32
 639  00ee 275f          	jreq	L322
 640  00f0 1d0040        	subw	x,#64
 641  00f3 275a          	jreq	L322
 642  00f5 1d0081        	subw	x,#129
 643  00f8 2766          	jreq	L522
 644  00fa 5a            	decw	x
 645  00fb 2763          	jreq	L522
 646  00fd 1d0002        	subw	x,#2
 647  0100 275e          	jreq	L522
 648  0102 1d0004        	subw	x,#4
 649  0105 2759          	jreq	L522
 650  0107 1d0008        	subw	x,#8
 651  010a 2754          	jreq	L522
 652  010c 1d0010        	subw	x,#16
 653  010f 274f          	jreq	L522
 654  0111 1d0020        	subw	x,#32
 655  0114 274a          	jreq	L522
 656  0116 1d0040        	subw	x,#64
 657  0119 2745          	jreq	L522
 658  011b 1d0081        	subw	x,#129
 659  011e 2751          	jreq	L722
 660  0120 5a            	decw	x
 661  0121 274e          	jreq	L722
 662  0123 1d0002        	subw	x,#2
 663  0126 2749          	jreq	L722
 664  0128 1d0004        	subw	x,#4
 665  012b 2744          	jreq	L722
 666  012d 1d0008        	subw	x,#8
 667  0130 273f          	jreq	L722
 668  0132 1d0010        	subw	x,#16
 669  0135 273a          	jreq	L722
 670  0137 1d0020        	subw	x,#32
 671  013a 2735          	jreq	L722
 672  013c 2042          	jra	L752
 673  013e               L122:
 674                     ; 245     case WFE_Source_TIM2_EV0:
 674                     ; 246     case WFE_Source_TIM2_EV1:
 674                     ; 247     case WFE_Source_TIM1_EV0:
 674                     ; 248     case WFE_Source_TIM1_EV1:
 674                     ; 249     case WFE_Source_EXTI_EV0:
 674                     ; 250     case WFE_Source_EXTI_EV1:
 674                     ; 251     case WFE_Source_EXTI_EV2:
 674                     ; 252     case WFE_Source_EXTI_EV3:
 674                     ; 253 
 674                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 676  013e c650a6        	ld	a,20646
 677  0141 1503          	bcp	a,(OFST+2,sp)
 678  0143 2706          	jreq	L162
 679                     ; 257         status = ENABLE;
 681  0145 a601          	ld	a,#1
 682  0147 6b01          	ld	(OFST+0,sp),a
 685  0149 2035          	jra	L752
 686  014b               L162:
 687                     ; 262         status = DISABLE;
 689  014b 0f01          	clr	(OFST+0,sp)
 691  014d 2031          	jra	L752
 692  014f               L322:
 693                     ; 266     case WFE_Source_EXTI_EV4:
 693                     ; 267     case WFE_Source_EXTI_EV5:
 693                     ; 268     case WFE_Source_EXTI_EV6:
 693                     ; 269     case WFE_Source_EXTI_EV7:
 693                     ; 270     case WFE_Source_EXTI_EVB_G:
 693                     ; 271     case WFE_Source_EXTI_EVD_H:
 693                     ; 272     case WFE_Source_EXTI_EVE_F:
 693                     ; 273     case WFE_Source_ADC1_COMP_EV:
 693                     ; 274 
 693                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 695  014f c650a7        	ld	a,20647
 696  0152 1503          	bcp	a,(OFST+2,sp)
 697  0154 2706          	jreq	L562
 698                     ; 278         status = ENABLE;
 700  0156 a601          	ld	a,#1
 701  0158 6b01          	ld	(OFST+0,sp),a
 704  015a 2024          	jra	L752
 705  015c               L562:
 706                     ; 283         status = DISABLE;
 708  015c 0f01          	clr	(OFST+0,sp)
 710  015e 2020          	jra	L752
 711  0160               L522:
 712                     ; 286     case WFE_Source_TIM3_EV0:
 712                     ; 287     case WFE_Source_TIM3_EV1:
 712                     ; 288     case WFE_Source_TIM4_EV:
 712                     ; 289     case WFE_Source_SPI1_EV:
 712                     ; 290     case WFE_Source_I2C1_EV:
 712                     ; 291     case WFE_Source_USART1_EV:
 712                     ; 292     case WFE_Source_DMA1CH01_EV:
 712                     ; 293     case WFE_Source_DMA1CH23_EV:
 712                     ; 294 
 712                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 714  0160 c650a8        	ld	a,20648
 715  0163 1503          	bcp	a,(OFST+2,sp)
 716  0165 2706          	jreq	L172
 717                     ; 298         status = ENABLE;
 719  0167 a601          	ld	a,#1
 720  0169 6b01          	ld	(OFST+0,sp),a
 723  016b 2013          	jra	L752
 724  016d               L172:
 725                     ; 303         status = DISABLE;
 727  016d 0f01          	clr	(OFST+0,sp)
 729  016f 200f          	jra	L752
 730  0171               L722:
 731                     ; 307     case WFE_Source_TIM5_EV0:
 731                     ; 308     case WFE_Source_TIM5_EV1:
 731                     ; 309     case WFE_Source_AES_EV:
 731                     ; 310     case WFE_Source_SPI2_EV:
 731                     ; 311     case WFE_Source_USART2_EV:
 731                     ; 312     case WFE_Source_USART3_EV:
 731                     ; 313     case WFE_Source_RTC_CSS_EV:
 731                     ; 314 
 731                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 733  0171 c650a9        	ld	a,20649
 734  0174 1503          	bcp	a,(OFST+2,sp)
 735  0176 2706          	jreq	L572
 736                     ; 318         status = ENABLE;
 738  0178 a601          	ld	a,#1
 739  017a 6b01          	ld	(OFST+0,sp),a
 742  017c 2002          	jra	L752
 743  017e               L572:
 744                     ; 323         status = DISABLE;
 746  017e 0f01          	clr	(OFST+0,sp)
 748  0180               L132:
 749                     ; 326     default:
 749                     ; 327       break;
 751  0180               L752:
 752                     ; 329   return status;
 754  0180 7b01          	ld	a,(OFST+0,sp)
 757  0182 5b03          	addw	sp,#3
 758  0184 81            	ret
 771                     	xdef	_WFE_GetWakeUpSourceEventStatus
 772                     	xdef	_WFE_WakeUpSourceEventCmd
 773                     	xdef	_WFE_DeInit
 792                     	end
