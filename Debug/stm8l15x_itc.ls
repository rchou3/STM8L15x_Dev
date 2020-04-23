   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 56 uint8_t ITC_GetCPUCC(void)
  43                     ; 57 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 59   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 60   _asm("pop a");
  58  0001 84            pop a
  60                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 87 void ITC_DeInit(void)
  86                     ; 88 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 97 }
 119  0023 81            	ret
 144                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 105 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 470                     .const:	section	.text
 471  0000               L22:
 472  0000 004d          	dc.w	L14
 473  0002 004d          	dc.w	L14
 474  0004 004d          	dc.w	L14
 475  0006 0056          	dc.w	L34
 476  0008 0056          	dc.w	L34
 477  000a 0056          	dc.w	L34
 478  000c 0056          	dc.w	L34
 479  000e 005f          	dc.w	L54
 480  0010 005f          	dc.w	L54
 481  0012 005f          	dc.w	L54
 482  0014 005f          	dc.w	L54
 483  0016 0068          	dc.w	L74
 484  0018 0068          	dc.w	L74
 485  001a 0068          	dc.w	L74
 486  001c 0068          	dc.w	L74
 487  001e 0071          	dc.w	L15
 488  0020 0071          	dc.w	L15
 489  0022 0071          	dc.w	L15
 490  0024 0071          	dc.w	L15
 491  0026 007a          	dc.w	L35
 492  0028 007a          	dc.w	L35
 493  002a 007a          	dc.w	L35
 494  002c 007a          	dc.w	L35
 495  002e 0083          	dc.w	L55
 496  0030 0083          	dc.w	L55
 497  0032 0083          	dc.w	L55
 498  0034 0083          	dc.w	L55
 499  0036 008c          	dc.w	L75
 500  0038 008c          	dc.w	L75
 501                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 501                     ; 115 {
 502                     	switch	.text
 503  0029               _ITC_GetSoftwarePriority:
 505  0029 88            	push	a
 506  002a 89            	pushw	x
 507       00000002      OFST:	set	2
 510                     ; 116   uint8_t Value = 0;
 512  002b 0f02          	clr	(OFST+0,sp)
 514                     ; 117   uint8_t Mask = 0;
 516                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 518                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 520  002d a403          	and	a,#3
 521  002f 48            	sll	a
 522  0030 5f            	clrw	x
 523  0031 97            	ld	xl,a
 524  0032 a603          	ld	a,#3
 525  0034 5d            	tnzw	x
 526  0035 2704          	jreq	L41
 527  0037               L61:
 528  0037 48            	sll	a
 529  0038 5a            	decw	x
 530  0039 26fc          	jrne	L61
 531  003b               L41:
 532  003b 6b01          	ld	(OFST-1,sp),a
 534                     ; 125   switch (IRQn)
 536  003d 7b03          	ld	a,(OFST+1,sp)
 538                     ; 223     default:
 538                     ; 224       break;
 539  003f 4a            	dec	a
 540  0040 a11d          	cp	a,#29
 541  0042 2407          	jruge	L02
 542  0044 5f            	clrw	x
 543  0045 97            	ld	xl,a
 544  0046 58            	sllw	x
 545  0047 de0000        	ldw	x,(L22,x)
 546  004a fc            	jp	(x)
 547  004b               L02:
 548  004b 2046          	jra	L522
 549  004d               L14:
 550                     ; 127     case FLASH_IRQn:
 550                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 550                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 550                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 552  004d c67f70        	ld	a,32624
 553  0050 1401          	and	a,(OFST-1,sp)
 554  0052 6b02          	ld	(OFST+0,sp),a
 556                     ; 131       break;
 558  0054 203d          	jra	L522
 559  0056               L34:
 560                     ; 133     case EXTIE_F_PVD_IRQn:
 560                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 560                     ; 135     case RTC_IRQn:
 560                     ; 136     case EXTIB_IRQn:
 560                     ; 137     case EXTID_IRQn:
 560                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 560                     ; 139     case RTC_CSSLSE_IRQn:
 560                     ; 140     case EXTIB_IRQn:
 560                     ; 141     case EXTID_IRQn:
 560                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 560                     ; 143     case RTC_CSSLSE_IRQn:
 560                     ; 144     case EXTIB_G_IRQn:
 560                     ; 145     case EXTID_H_IRQn:
 560                     ; 146 #endif  /* STM8L15X_MD */
 560                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 562  0056 c67f71        	ld	a,32625
 563  0059 1401          	and	a,(OFST-1,sp)
 564  005b 6b02          	ld	(OFST+0,sp),a
 566                     ; 148       break;
 568  005d 2034          	jra	L522
 569  005f               L54:
 570                     ; 150     case EXTI0_IRQn:
 570                     ; 151     case EXTI1_IRQn:
 570                     ; 152     case EXTI2_IRQn:
 570                     ; 153     case EXTI3_IRQn:
 570                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 572  005f c67f72        	ld	a,32626
 573  0062 1401          	and	a,(OFST-1,sp)
 574  0064 6b02          	ld	(OFST+0,sp),a
 576                     ; 155       break;
 578  0066 202b          	jra	L522
 579  0068               L74:
 580                     ; 157     case EXTI4_IRQn:
 580                     ; 158     case EXTI5_IRQn:
 580                     ; 159     case EXTI6_IRQn:
 580                     ; 160     case EXTI7_IRQn:
 580                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 582  0068 c67f73        	ld	a,32627
 583  006b 1401          	and	a,(OFST-1,sp)
 584  006d 6b02          	ld	(OFST+0,sp),a
 586                     ; 162       break;
 588  006f 2022          	jra	L522
 589  0071               L15:
 590                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 590                     ; 168 #endif /* STM8L15X_LD */		
 590                     ; 169     case ADC1_COMP_IRQn:
 590                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 590                     ; 171     case LCD_IRQn:
 590                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 590                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 590                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 590                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 590                     ; 176     case LCD_AES_IRQn:
 590                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 590                     ; 178 #endif  /* STM8L15X_MD */
 590                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 592  0071 c67f74        	ld	a,32628
 593  0074 1401          	and	a,(OFST-1,sp)
 594  0076 6b02          	ld	(OFST+0,sp),a
 596                     ; 180       break;
 598  0078 2019          	jra	L522
 599  007a               L35:
 600                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 600                     ; 184 #endif /* STM8L15X_LD */		
 600                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 600                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 600                     ; 187     case TIM2_CC_IRQn:
 600                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 600                     ; 189     case TIM3_CC_IRQn:
 600                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 600                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 600                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 600                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 600                     ; 194 #endif  /* STM8L15X_MD */
 600                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 602  007a c67f75        	ld	a,32629
 603  007d 1401          	and	a,(OFST-1,sp)
 604  007f 6b02          	ld	(OFST+0,sp),a
 606                     ; 196       break;
 608  0081 2010          	jra	L522
 609  0083               L55:
 610                     ; 199     case TIM1_CC_IRQn:
 610                     ; 200 #endif /* STM8L15X_LD */	
 610                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 610                     ; 202     case SPI1_IRQn:
 610                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 610                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 610                     ; 205     case USART1_TX_IRQn:
 610                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 610                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 610                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 610                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 612  0083 c67f76        	ld	a,32630
 613  0086 1401          	and	a,(OFST-1,sp)
 614  0088 6b02          	ld	(OFST+0,sp),a
 616                     ; 210       break;
 618  008a 2007          	jra	L522
 619  008c               L75:
 620                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 620                     ; 218     case I2C1_SPI2_IRQn:
 620                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 620                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 622  008c c67f77        	ld	a,32631
 623  008f 1401          	and	a,(OFST-1,sp)
 624  0091 6b02          	ld	(OFST+0,sp),a
 626                     ; 221       break;
 628  0093               L16:
 629                     ; 223     default:
 629                     ; 224       break;
 631  0093               L522:
 632                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 634  0093 7b03          	ld	a,(OFST+1,sp)
 635  0095 a403          	and	a,#3
 636  0097 48            	sll	a
 637  0098 5f            	clrw	x
 638  0099 97            	ld	xl,a
 639  009a 7b02          	ld	a,(OFST+0,sp)
 640  009c 5d            	tnzw	x
 641  009d 2704          	jreq	L42
 642  009f               L62:
 643  009f 44            	srl	a
 644  00a0 5a            	decw	x
 645  00a1 26fc          	jrne	L62
 646  00a3               L42:
 647  00a3 6b02          	ld	(OFST+0,sp),a
 649                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 651  00a5 7b02          	ld	a,(OFST+0,sp)
 654  00a7 5b03          	addw	sp,#3
 655  00a9 81            	ret
 719                     	switch	.const
 720  003a               L44:
 721  003a 00e2          	dc.w	L722
 722  003c 00e2          	dc.w	L722
 723  003e 00e2          	dc.w	L722
 724  0040 00f4          	dc.w	L132
 725  0042 00f4          	dc.w	L132
 726  0044 00f4          	dc.w	L132
 727  0046 00f4          	dc.w	L132
 728  0048 0106          	dc.w	L332
 729  004a 0106          	dc.w	L332
 730  004c 0106          	dc.w	L332
 731  004e 0106          	dc.w	L332
 732  0050 0118          	dc.w	L532
 733  0052 0118          	dc.w	L532
 734  0054 0118          	dc.w	L532
 735  0056 0118          	dc.w	L532
 736  0058 012a          	dc.w	L732
 737  005a 012a          	dc.w	L732
 738  005c 012a          	dc.w	L732
 739  005e 012a          	dc.w	L732
 740  0060 013c          	dc.w	L142
 741  0062 013c          	dc.w	L142
 742  0064 013c          	dc.w	L142
 743  0066 013c          	dc.w	L142
 744  0068 014e          	dc.w	L342
 745  006a 014e          	dc.w	L342
 746  006c 014e          	dc.w	L342
 747  006e 014e          	dc.w	L342
 748  0070 0160          	dc.w	L542
 749  0072 0160          	dc.w	L542
 750                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 750                     ; 251 {
 751                     	switch	.text
 752  00aa               _ITC_SetSoftwarePriority:
 754  00aa 89            	pushw	x
 755  00ab 89            	pushw	x
 756       00000002      OFST:	set	2
 759                     ; 252   uint8_t Mask = 0;
 761                     ; 253   uint8_t NewPriority = 0;
 763                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 765                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 767                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 769                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 771  00ac 9e            	ld	a,xh
 772  00ad a403          	and	a,#3
 773  00af 48            	sll	a
 774  00b0 5f            	clrw	x
 775  00b1 97            	ld	xl,a
 776  00b2 a603          	ld	a,#3
 777  00b4 5d            	tnzw	x
 778  00b5 2704          	jreq	L23
 779  00b7               L43:
 780  00b7 48            	sll	a
 781  00b8 5a            	decw	x
 782  00b9 26fc          	jrne	L43
 783  00bb               L23:
 784  00bb 43            	cpl	a
 785  00bc 6b01          	ld	(OFST-1,sp),a
 787                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 789  00be 7b03          	ld	a,(OFST+1,sp)
 790  00c0 a403          	and	a,#3
 791  00c2 48            	sll	a
 792  00c3 5f            	clrw	x
 793  00c4 97            	ld	xl,a
 794  00c5 7b04          	ld	a,(OFST+2,sp)
 795  00c7 5d            	tnzw	x
 796  00c8 2704          	jreq	L63
 797  00ca               L04:
 798  00ca 48            	sll	a
 799  00cb 5a            	decw	x
 800  00cc 26fc          	jrne	L04
 801  00ce               L63:
 802  00ce 6b02          	ld	(OFST+0,sp),a
 804                     ; 268   switch (IRQn)
 806  00d0 7b03          	ld	a,(OFST+1,sp)
 808                     ; 372     default:
 808                     ; 373       break;
 809  00d2 4a            	dec	a
 810  00d3 a11d          	cp	a,#29
 811  00d5 2407          	jruge	L24
 812  00d7 5f            	clrw	x
 813  00d8 97            	ld	xl,a
 814  00d9 58            	sllw	x
 815  00da de003a        	ldw	x,(L44,x)
 816  00dd fc            	jp	(x)
 817  00de               L24:
 818  00de ac700170      	jpf	L503
 819  00e2               L722:
 820                     ; 270     case FLASH_IRQn:
 820                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 820                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 820                     ; 273       ITC->ISPR1 &= Mask;
 822  00e2 c67f70        	ld	a,32624
 823  00e5 1401          	and	a,(OFST-1,sp)
 824  00e7 c77f70        	ld	32624,a
 825                     ; 274       ITC->ISPR1 |= NewPriority;
 827  00ea c67f70        	ld	a,32624
 828  00ed 1a02          	or	a,(OFST+0,sp)
 829  00ef c77f70        	ld	32624,a
 830                     ; 275       break;
 832  00f2 207c          	jra	L503
 833  00f4               L132:
 834                     ; 277     case EXTIE_F_PVD_IRQn:
 834                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 834                     ; 279     case RTC_IRQn:
 834                     ; 280     case EXTIB_IRQn:
 834                     ; 281     case EXTID_IRQn:
 834                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 834                     ; 283     case RTC_CSSLSE_IRQn:
 834                     ; 284     case EXTIB_IRQn:
 834                     ; 285     case EXTID_IRQn:
 834                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 834                     ; 287     case RTC_CSSLSE_IRQn:
 834                     ; 288     case EXTIB_G_IRQn:
 834                     ; 289     case EXTID_H_IRQn:
 834                     ; 290 #endif  /* STM8L15X_MD */
 834                     ; 291       ITC->ISPR2 &= Mask;
 836  00f4 c67f71        	ld	a,32625
 837  00f7 1401          	and	a,(OFST-1,sp)
 838  00f9 c77f71        	ld	32625,a
 839                     ; 292       ITC->ISPR2 |= NewPriority;
 841  00fc c67f71        	ld	a,32625
 842  00ff 1a02          	or	a,(OFST+0,sp)
 843  0101 c77f71        	ld	32625,a
 844                     ; 293       break;
 846  0104 206a          	jra	L503
 847  0106               L332:
 848                     ; 295     case EXTI0_IRQn:
 848                     ; 296     case EXTI1_IRQn:
 848                     ; 297     case EXTI2_IRQn:
 848                     ; 298     case EXTI3_IRQn:
 848                     ; 299       ITC->ISPR3 &= Mask;
 850  0106 c67f72        	ld	a,32626
 851  0109 1401          	and	a,(OFST-1,sp)
 852  010b c77f72        	ld	32626,a
 853                     ; 300       ITC->ISPR3 |= NewPriority;
 855  010e c67f72        	ld	a,32626
 856  0111 1a02          	or	a,(OFST+0,sp)
 857  0113 c77f72        	ld	32626,a
 858                     ; 301       break;
 860  0116 2058          	jra	L503
 861  0118               L532:
 862                     ; 303     case EXTI4_IRQn:
 862                     ; 304     case EXTI5_IRQn:
 862                     ; 305     case EXTI6_IRQn:
 862                     ; 306     case EXTI7_IRQn:
 862                     ; 307       ITC->ISPR4 &= Mask;
 864  0118 c67f73        	ld	a,32627
 865  011b 1401          	and	a,(OFST-1,sp)
 866  011d c77f73        	ld	32627,a
 867                     ; 308       ITC->ISPR4 |= NewPriority;
 869  0120 c67f73        	ld	a,32627
 870  0123 1a02          	or	a,(OFST+0,sp)
 871  0125 c77f73        	ld	32627,a
 872                     ; 309       break;
 874  0128 2046          	jra	L503
 875  012a               L732:
 876                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 876                     ; 312 #else
 876                     ; 313     case SWITCH_CSS_IRQn:
 876                     ; 314 #endif /*	STM8L15X_LD	*/
 876                     ; 315     case ADC1_COMP_IRQn:
 876                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 876                     ; 317     case LCD_IRQn:
 876                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 876                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 876                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 876                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 876                     ; 322     case LCD_AES_IRQn:
 876                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 876                     ; 324 #endif  /* STM8L15X_MD */
 876                     ; 325       ITC->ISPR5 &= Mask;
 878  012a c67f74        	ld	a,32628
 879  012d 1401          	and	a,(OFST-1,sp)
 880  012f c77f74        	ld	32628,a
 881                     ; 326       ITC->ISPR5 |= NewPriority;
 883  0132 c67f74        	ld	a,32628
 884  0135 1a02          	or	a,(OFST+0,sp)
 885  0137 c77f74        	ld	32628,a
 886                     ; 327       break;
 888  013a 2034          	jra	L503
 889  013c               L142:
 890                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 890                     ; 330 #endif  /* STM8L15X_LD */
 890                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 890                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 890                     ; 333     case TIM2_CC_IRQn:
 890                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 890                     ; 335     case TIM3_CC_IRQn:
 890                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 890                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 890                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 890                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 890                     ; 340 #endif  /* STM8L15X_MD */
 890                     ; 341       ITC->ISPR6 &= Mask;
 892  013c c67f75        	ld	a,32629
 893  013f 1401          	and	a,(OFST-1,sp)
 894  0141 c77f75        	ld	32629,a
 895                     ; 342       ITC->ISPR6 |= NewPriority;
 897  0144 c67f75        	ld	a,32629
 898  0147 1a02          	or	a,(OFST+0,sp)
 899  0149 c77f75        	ld	32629,a
 900                     ; 343       break;
 902  014c 2022          	jra	L503
 903  014e               L342:
 904                     ; 346     case TIM1_CC_IRQn:
 904                     ; 347 #endif  /* STM8L15X_LD */
 904                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 904                     ; 349     case SPI1_IRQn:
 904                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 904                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 904                     ; 352     case USART1_TX_IRQn:
 904                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 904                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 904                     ; 355 #endif  /* STM8L15X_MD */
 904                     ; 356       ITC->ISPR7 &= Mask;
 906  014e c67f76        	ld	a,32630
 907  0151 1401          	and	a,(OFST-1,sp)
 908  0153 c77f76        	ld	32630,a
 909                     ; 357       ITC->ISPR7 |= NewPriority;
 911  0156 c67f76        	ld	a,32630
 912  0159 1a02          	or	a,(OFST+0,sp)
 913  015b c77f76        	ld	32630,a
 914                     ; 358       break;
 916  015e 2010          	jra	L503
 917  0160               L542:
 918                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 918                     ; 366     case I2C1_SPI2_IRQn:
 918                     ; 367 #endif  /* STM8L15X_MD */
 918                     ; 368       ITC->ISPR8 &= Mask;
 920  0160 c67f77        	ld	a,32631
 921  0163 1401          	and	a,(OFST-1,sp)
 922  0165 c77f77        	ld	32631,a
 923                     ; 369       ITC->ISPR8 |= NewPriority;
 925  0168 c67f77        	ld	a,32631
 926  016b 1a02          	or	a,(OFST+0,sp)
 927  016d c77f77        	ld	32631,a
 928                     ; 370       break;
 930  0170               L742:
 931                     ; 372     default:
 931                     ; 373       break;
 933  0170               L503:
 934                     ; 375 }
 937  0170 5b04          	addw	sp,#4
 938  0172 81            	ret
 951                     	xdef	_ITC_GetSoftwarePriority
 952                     	xdef	_ITC_SetSoftwarePriority
 953                     	xdef	_ITC_GetSoftIntStatus
 954                     	xdef	_ITC_GetCPUCC
 955                     	xdef	_ITC_DeInit
 974                     	end
