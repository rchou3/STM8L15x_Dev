   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 199                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 199                     ; 142 {
 201                     	switch	.text
 202  0000               _I2C_DeInit:
 206                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 208  0000 7f            	clr	(x)
 209                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 211  0001 6f01          	clr	(1,x)
 212                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 214  0003 6f02          	clr	(2,x)
 215                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 217  0005 6f03          	clr	(3,x)
 218                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 220  0007 6f04          	clr	(4,x)
 221                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 223  0009 6f05          	clr	(5,x)
 224                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 226  000b 6f0a          	clr	(10,x)
 227                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 229  000d 6f0b          	clr	(11,x)
 230                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 232  000f 6f0c          	clr	(12,x)
 233                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 235  0011 a602          	ld	a,#2
 236  0013 e70d          	ld	(13,x),a
 237                     ; 153 }
 240  0015 81            	ret
 464                     .const:	section	.text
 465  0000               L01:
 466  0000 000f4240      	dc.l	1000000
 467  0004               L21:
 468  0004 000186a1      	dc.l	100001
 469  0008               L41:
 470  0008 00000004      	dc.l	4
 471                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 471                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 471                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 471                     ; 187 {
 472                     	switch	.text
 473  0016               _I2C_Init:
 475  0016 89            	pushw	x
 476  0017 520c          	subw	sp,#12
 477       0000000c      OFST:	set	12
 480                     ; 188   uint32_t result = 0x0004;
 482                     ; 189   uint16_t tmpval = 0;
 484                     ; 190   uint8_t tmpccrh = 0;
 486  0019 0f07          	clr	(OFST-5,sp)
 488                     ; 191   uint8_t input_clock = 0;
 490                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 492                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 494                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 496                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 498                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 500                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 502                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 504  001b cd0000        	call	_CLK_GetClockFreq
 506  001e ae0000        	ldw	x,#L01
 507  0021 cd0000        	call	c_ludv
 509  0024 b603          	ld	a,c_lreg+3
 510  0026 6b08          	ld	(OFST-4,sp),a
 512                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 514  0028 1e0d          	ldw	x,(OFST+1,sp)
 515  002a e602          	ld	a,(2,x)
 516  002c a4c0          	and	a,#192
 517  002e e702          	ld	(2,x),a
 518                     ; 209   I2Cx->FREQR |= input_clock;
 520  0030 1e0d          	ldw	x,(OFST+1,sp)
 521  0032 e602          	ld	a,(2,x)
 522  0034 1a08          	or	a,(OFST-4,sp)
 523  0036 e702          	ld	(2,x),a
 524                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 526  0038 1e0d          	ldw	x,(OFST+1,sp)
 527  003a f6            	ld	a,(x)
 528  003b a4fe          	and	a,#254
 529  003d f7            	ld	(x),a
 530                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 532  003e 1e0d          	ldw	x,(OFST+1,sp)
 533  0040 e60c          	ld	a,(12,x)
 534  0042 a430          	and	a,#48
 535  0044 e70c          	ld	(12,x),a
 536                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 538  0046 1e0d          	ldw	x,(OFST+1,sp)
 539  0048 6f0b          	clr	(11,x)
 540                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 542  004a 96            	ldw	x,sp
 543  004b 1c0011        	addw	x,#OFST+5
 544  004e cd0000        	call	c_ltor
 546  0051 ae0004        	ldw	x,#L21
 547  0054 cd0000        	call	c_lcmp
 549  0057 2403          	jruge	L61
 550  0059 cc00f7        	jp	L362
 551  005c               L61:
 552                     ; 223     tmpccrh = I2C_CCRH_FS;
 554  005c a680          	ld	a,#128
 555  005e 6b07          	ld	(OFST-5,sp),a
 557                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 559  0060 0d18          	tnz	(OFST+12,sp)
 560  0062 2633          	jrne	L562
 561                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 563  0064 96            	ldw	x,sp
 564  0065 1c0011        	addw	x,#OFST+5
 565  0068 cd0000        	call	c_ltor
 567  006b a603          	ld	a,#3
 568  006d cd0000        	call	c_smul
 570  0070 96            	ldw	x,sp
 571  0071 1c0001        	addw	x,#OFST-11
 572  0074 cd0000        	call	c_rtol
 575  0077 7b08          	ld	a,(OFST-4,sp)
 576  0079 b703          	ld	c_lreg+3,a
 577  007b 3f02          	clr	c_lreg+2
 578  007d 3f01          	clr	c_lreg+1
 579  007f 3f00          	clr	c_lreg
 580  0081 ae0000        	ldw	x,#L01
 581  0084 cd0000        	call	c_lmul
 583  0087 96            	ldw	x,sp
 584  0088 1c0001        	addw	x,#OFST-11
 585  008b cd0000        	call	c_ludv
 587  008e 96            	ldw	x,sp
 588  008f 1c0009        	addw	x,#OFST-3
 589  0092 cd0000        	call	c_rtol
 593  0095 2037          	jra	L762
 594  0097               L562:
 595                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 597  0097 96            	ldw	x,sp
 598  0098 1c0011        	addw	x,#OFST+5
 599  009b cd0000        	call	c_ltor
 601  009e a619          	ld	a,#25
 602  00a0 cd0000        	call	c_smul
 604  00a3 96            	ldw	x,sp
 605  00a4 1c0001        	addw	x,#OFST-11
 606  00a7 cd0000        	call	c_rtol
 609  00aa 7b08          	ld	a,(OFST-4,sp)
 610  00ac b703          	ld	c_lreg+3,a
 611  00ae 3f02          	clr	c_lreg+2
 612  00b0 3f01          	clr	c_lreg+1
 613  00b2 3f00          	clr	c_lreg
 614  00b4 ae0000        	ldw	x,#L01
 615  00b7 cd0000        	call	c_lmul
 617  00ba 96            	ldw	x,sp
 618  00bb 1c0001        	addw	x,#OFST-11
 619  00be cd0000        	call	c_ludv
 621  00c1 96            	ldw	x,sp
 622  00c2 1c0009        	addw	x,#OFST-3
 623  00c5 cd0000        	call	c_rtol
 626                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 628  00c8 7b07          	ld	a,(OFST-5,sp)
 629  00ca aa40          	or	a,#64
 630  00cc 6b07          	ld	(OFST-5,sp),a
 632  00ce               L762:
 633                     ; 239     if (result < (uint16_t)0x01)
 635  00ce 96            	ldw	x,sp
 636  00cf 1c0009        	addw	x,#OFST-3
 637  00d2 cd0000        	call	c_lzmp
 639  00d5 260a          	jrne	L172
 640                     ; 242       result = (uint16_t)0x0001;
 642  00d7 ae0001        	ldw	x,#1
 643  00da 1f0b          	ldw	(OFST-1,sp),x
 644  00dc ae0000        	ldw	x,#0
 645  00df 1f09          	ldw	(OFST-3,sp),x
 647  00e1               L172:
 648                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 650  00e1 7b08          	ld	a,(OFST-4,sp)
 651  00e3 97            	ld	xl,a
 652  00e4 a603          	ld	a,#3
 653  00e6 42            	mul	x,a
 654  00e7 a60a          	ld	a,#10
 655  00e9 cd0000        	call	c_sdivx
 657  00ec 5c            	incw	x
 658  00ed 1f05          	ldw	(OFST-7,sp),x
 660                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 662  00ef 7b06          	ld	a,(OFST-6,sp)
 663  00f1 1e0d          	ldw	x,(OFST+1,sp)
 664  00f3 e70d          	ld	(13,x),a
 666  00f5 205c          	jra	L372
 667  00f7               L362:
 668                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 670  00f7 96            	ldw	x,sp
 671  00f8 1c0011        	addw	x,#OFST+5
 672  00fb cd0000        	call	c_ltor
 674  00fe 3803          	sll	c_lreg+3
 675  0100 3902          	rlc	c_lreg+2
 676  0102 3901          	rlc	c_lreg+1
 677  0104 3900          	rlc	c_lreg
 678  0106 96            	ldw	x,sp
 679  0107 1c0001        	addw	x,#OFST-11
 680  010a cd0000        	call	c_rtol
 683  010d 7b08          	ld	a,(OFST-4,sp)
 684  010f b703          	ld	c_lreg+3,a
 685  0111 3f02          	clr	c_lreg+2
 686  0113 3f01          	clr	c_lreg+1
 687  0115 3f00          	clr	c_lreg
 688  0117 ae0000        	ldw	x,#L01
 689  011a cd0000        	call	c_lmul
 691  011d 96            	ldw	x,sp
 692  011e 1c0001        	addw	x,#OFST-11
 693  0121 cd0000        	call	c_ludv
 695  0124 b602          	ld	a,c_lreg+2
 696  0126 97            	ld	xl,a
 697  0127 b603          	ld	a,c_lreg+3
 698  0129 cd0000        	call	c_uitol
 700  012c 96            	ldw	x,sp
 701  012d 1c0009        	addw	x,#OFST-3
 702  0130 cd0000        	call	c_rtol
 705                     ; 259     if (result < (uint16_t)0x0004)
 707  0133 96            	ldw	x,sp
 708  0134 1c0009        	addw	x,#OFST-3
 709  0137 cd0000        	call	c_ltor
 711  013a ae0008        	ldw	x,#L41
 712  013d cd0000        	call	c_lcmp
 714  0140 240a          	jruge	L572
 715                     ; 262       result = (uint16_t)0x0004;
 717  0142 ae0004        	ldw	x,#4
 718  0145 1f0b          	ldw	(OFST-1,sp),x
 719  0147 ae0000        	ldw	x,#0
 720  014a 1f09          	ldw	(OFST-3,sp),x
 722  014c               L572:
 723                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 725  014c 7b08          	ld	a,(OFST-4,sp)
 726  014e 4c            	inc	a
 727  014f 1e0d          	ldw	x,(OFST+1,sp)
 728  0151 e70d          	ld	(13,x),a
 729  0153               L372:
 730                     ; 273   I2Cx->CCRL = (uint8_t)result;
 732  0153 7b0c          	ld	a,(OFST+0,sp)
 733  0155 1e0d          	ldw	x,(OFST+1,sp)
 734  0157 e70b          	ld	(11,x),a
 735                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 737  0159 7b07          	ld	a,(OFST-5,sp)
 738  015b 1e0d          	ldw	x,(OFST+1,sp)
 739  015d e70c          	ld	(12,x),a
 740                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 742  015f 1e0d          	ldw	x,(OFST+1,sp)
 743  0161 7b17          	ld	a,(OFST+11,sp)
 744  0163 aa01          	or	a,#1
 745  0165 fa            	or	a,(x)
 746  0166 f7            	ld	(x),a
 747                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 749  0167 1e0d          	ldw	x,(OFST+1,sp)
 750  0169 e601          	ld	a,(1,x)
 751  016b 1a19          	or	a,(OFST+13,sp)
 752  016d e701          	ld	(1,x),a
 753                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 755  016f 7b16          	ld	a,(OFST+10,sp)
 756  0171 1e0d          	ldw	x,(OFST+1,sp)
 757  0173 e703          	ld	(3,x),a
 758                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 758                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 760  0175 1e15          	ldw	x,(OFST+9,sp)
 761  0177 4f            	clr	a
 762  0178 01            	rrwa	x,a
 763  0179 48            	sll	a
 764  017a 59            	rlcw	x
 765  017b 01            	rrwa	x,a
 766  017c a406          	and	a,#6
 767  017e 5f            	clrw	x
 768  017f 6b04          	ld	(OFST-8,sp),a
 770  0181 7b1a          	ld	a,(OFST+14,sp)
 771  0183 aa40          	or	a,#64
 772  0185 1a04          	or	a,(OFST-8,sp)
 773  0187 1e0d          	ldw	x,(OFST+1,sp)
 774  0189 e704          	ld	(4,x),a
 775                     ; 286 }
 778  018b 5b0e          	addw	sp,#14
 779  018d 81            	ret
 846                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 846                     ; 296 {
 847                     	switch	.text
 848  018e               _I2C_Cmd:
 850  018e 89            	pushw	x
 851       00000000      OFST:	set	0
 854                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 856                     ; 301   if (NewState != DISABLE)
 858  018f 0d05          	tnz	(OFST+5,sp)
 859  0191 2706          	jreq	L333
 860                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 862  0193 f6            	ld	a,(x)
 863  0194 aa01          	or	a,#1
 864  0196 f7            	ld	(x),a
 866  0197 2006          	jra	L533
 867  0199               L333:
 868                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 870  0199 1e01          	ldw	x,(OFST+1,sp)
 871  019b f6            	ld	a,(x)
 872  019c a4fe          	and	a,#254
 873  019e f7            	ld	(x),a
 874  019f               L533:
 875                     ; 311 }
 878  019f 85            	popw	x
 879  01a0 81            	ret
 926                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 926                     ; 321 {
 927                     	switch	.text
 928  01a1               _I2C_GeneralCallCmd:
 930  01a1 89            	pushw	x
 931       00000000      OFST:	set	0
 934                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 936                     ; 326   if (NewState != DISABLE)
 938  01a2 0d05          	tnz	(OFST+5,sp)
 939  01a4 2706          	jreq	L363
 940                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 942  01a6 f6            	ld	a,(x)
 943  01a7 aa40          	or	a,#64
 944  01a9 f7            	ld	(x),a
 946  01aa 2006          	jra	L563
 947  01ac               L363:
 948                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 950  01ac 1e01          	ldw	x,(OFST+1,sp)
 951  01ae f6            	ld	a,(x)
 952  01af a4bf          	and	a,#191
 953  01b1 f7            	ld	(x),a
 954  01b2               L563:
 955                     ; 336 }
 958  01b2 85            	popw	x
 959  01b3 81            	ret
1006                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
1006                     ; 348 {
1007                     	switch	.text
1008  01b4               _I2C_GenerateSTART:
1010  01b4 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1016                     ; 353   if (NewState != DISABLE)
1018  01b5 0d05          	tnz	(OFST+5,sp)
1019  01b7 2708          	jreq	L314
1020                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1022  01b9 e601          	ld	a,(1,x)
1023  01bb aa01          	or	a,#1
1024  01bd e701          	ld	(1,x),a
1026  01bf 2008          	jra	L514
1027  01c1               L314:
1028                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1030  01c1 1e01          	ldw	x,(OFST+1,sp)
1031  01c3 e601          	ld	a,(1,x)
1032  01c5 a4fe          	and	a,#254
1033  01c7 e701          	ld	(1,x),a
1034  01c9               L514:
1035                     ; 363 }
1038  01c9 85            	popw	x
1039  01ca 81            	ret
1086                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1086                     ; 373 {
1087                     	switch	.text
1088  01cb               _I2C_GenerateSTOP:
1090  01cb 89            	pushw	x
1091       00000000      OFST:	set	0
1094                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1096                     ; 378   if (NewState != DISABLE)
1098  01cc 0d05          	tnz	(OFST+5,sp)
1099  01ce 2708          	jreq	L344
1100                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1102  01d0 e601          	ld	a,(1,x)
1103  01d2 aa02          	or	a,#2
1104  01d4 e701          	ld	(1,x),a
1106  01d6 2008          	jra	L544
1107  01d8               L344:
1108                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1110  01d8 1e01          	ldw	x,(OFST+1,sp)
1111  01da e601          	ld	a,(1,x)
1112  01dc a4fd          	and	a,#253
1113  01de e701          	ld	(1,x),a
1114  01e0               L544:
1115                     ; 388 }
1118  01e0 85            	popw	x
1119  01e1 81            	ret
1167                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1167                     ; 398 {
1168                     	switch	.text
1169  01e2               _I2C_SoftwareResetCmd:
1171  01e2 89            	pushw	x
1172       00000000      OFST:	set	0
1175                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1177                     ; 402   if (NewState != DISABLE)
1179  01e3 0d05          	tnz	(OFST+5,sp)
1180  01e5 2708          	jreq	L374
1181                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1183  01e7 e601          	ld	a,(1,x)
1184  01e9 aa80          	or	a,#128
1185  01eb e701          	ld	(1,x),a
1187  01ed 2008          	jra	L574
1188  01ef               L374:
1189                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1191  01ef 1e01          	ldw	x,(OFST+1,sp)
1192  01f1 e601          	ld	a,(1,x)
1193  01f3 a47f          	and	a,#127
1194  01f5 e701          	ld	(1,x),a
1195  01f7               L574:
1196                     ; 412 }
1199  01f7 85            	popw	x
1200  01f8 81            	ret
1248                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1248                     ; 422 {
1249                     	switch	.text
1250  01f9               _I2C_StretchClockCmd:
1252  01f9 89            	pushw	x
1253       00000000      OFST:	set	0
1256                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1258                     ; 426   if (NewState != DISABLE)
1260  01fa 0d05          	tnz	(OFST+5,sp)
1261  01fc 2706          	jreq	L325
1262                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1264  01fe f6            	ld	a,(x)
1265  01ff a47f          	and	a,#127
1266  0201 f7            	ld	(x),a
1268  0202 2006          	jra	L525
1269  0204               L325:
1270                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1272  0204 1e01          	ldw	x,(OFST+1,sp)
1273  0206 f6            	ld	a,(x)
1274  0207 aa80          	or	a,#128
1275  0209 f7            	ld	(x),a
1276  020a               L525:
1277                     ; 437 }
1280  020a 85            	popw	x
1281  020b 81            	ret
1328                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1328                     ; 447 {
1329                     	switch	.text
1330  020c               _I2C_ARPCmd:
1332  020c 89            	pushw	x
1333       00000000      OFST:	set	0
1336                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1338                     ; 451   if (NewState != DISABLE)
1340  020d 0d05          	tnz	(OFST+5,sp)
1341  020f 2706          	jreq	L355
1342                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1344  0211 f6            	ld	a,(x)
1345  0212 aa10          	or	a,#16
1346  0214 f7            	ld	(x),a
1348  0215 2006          	jra	L555
1349  0217               L355:
1350                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1352  0217 1e01          	ldw	x,(OFST+1,sp)
1353  0219 f6            	ld	a,(x)
1354  021a a4ef          	and	a,#239
1355  021c f7            	ld	(x),a
1356  021d               L555:
1357                     ; 462 }
1360  021d 85            	popw	x
1361  021e 81            	ret
1409                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1409                     ; 472 {
1410                     	switch	.text
1411  021f               _I2C_AcknowledgeConfig:
1413  021f 89            	pushw	x
1414       00000000      OFST:	set	0
1417                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1419                     ; 476   if (NewState != DISABLE)
1421  0220 0d05          	tnz	(OFST+5,sp)
1422  0222 2708          	jreq	L306
1423                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1425  0224 e601          	ld	a,(1,x)
1426  0226 aa04          	or	a,#4
1427  0228 e701          	ld	(1,x),a
1429  022a 2008          	jra	L506
1430  022c               L306:
1431                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1433  022c 1e01          	ldw	x,(OFST+1,sp)
1434  022e e601          	ld	a,(1,x)
1435  0230 a4fb          	and	a,#251
1436  0232 e701          	ld	(1,x),a
1437  0234               L506:
1438                     ; 486 }
1441  0234 85            	popw	x
1442  0235 81            	ret
1498                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1498                     ; 495 {
1499                     	switch	.text
1500  0236               _I2C_OwnAddress2Config:
1502  0236 89            	pushw	x
1503  0237 88            	push	a
1504       00000001      OFST:	set	1
1507                     ; 496   uint8_t tmpreg = 0;
1509                     ; 499   tmpreg = I2Cx->OAR2;
1511  0238 e605          	ld	a,(5,x)
1512  023a 6b01          	ld	(OFST+0,sp),a
1514                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1516  023c 7b01          	ld	a,(OFST+0,sp)
1517  023e a401          	and	a,#1
1518  0240 6b01          	ld	(OFST+0,sp),a
1520                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1522  0242 7b06          	ld	a,(OFST+5,sp)
1523  0244 a4fe          	and	a,#254
1524  0246 1a01          	or	a,(OFST+0,sp)
1525  0248 6b01          	ld	(OFST+0,sp),a
1527                     ; 508   I2Cx->OAR2 = tmpreg;
1529  024a 7b01          	ld	a,(OFST+0,sp)
1530  024c 1e02          	ldw	x,(OFST+1,sp)
1531  024e e705          	ld	(5,x),a
1532                     ; 509 }
1535  0250 5b03          	addw	sp,#3
1536  0252 81            	ret
1583                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1583                     ; 519 {
1584                     	switch	.text
1585  0253               _I2C_DualAddressCmd:
1587  0253 89            	pushw	x
1588       00000000      OFST:	set	0
1591                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1593                     ; 523   if (NewState != DISABLE)
1595  0254 0d05          	tnz	(OFST+5,sp)
1596  0256 2708          	jreq	L366
1597                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1599  0258 e605          	ld	a,(5,x)
1600  025a aa01          	or	a,#1
1601  025c e705          	ld	(5,x),a
1603  025e 2008          	jra	L566
1604  0260               L366:
1605                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1607  0260 1e01          	ldw	x,(OFST+1,sp)
1608  0262 e605          	ld	a,(5,x)
1609  0264 a4fe          	and	a,#254
1610  0266 e705          	ld	(5,x),a
1611  0268               L566:
1612                     ; 533 }
1615  0268 85            	popw	x
1616  0269 81            	ret
1686                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1686                     ; 546 {
1687                     	switch	.text
1688  026a               _I2C_AckPositionConfig:
1690  026a 89            	pushw	x
1691       00000000      OFST:	set	0
1694                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1696                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1698  026b e601          	ld	a,(1,x)
1699  026d a4f7          	and	a,#247
1700  026f e701          	ld	(1,x),a
1701                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1703  0271 e601          	ld	a,(1,x)
1704  0273 1a05          	or	a,(OFST+5,sp)
1705  0275 e701          	ld	(1,x),a
1706                     ; 554 }
1709  0277 85            	popw	x
1710  0278 81            	ret
1779                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1779                     ; 566 {
1780                     	switch	.text
1781  0279               _I2C_SMBusAlertConfig:
1783  0279 89            	pushw	x
1784       00000000      OFST:	set	0
1787                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1789                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1791  027a 0d05          	tnz	(OFST+5,sp)
1792  027c 2708          	jreq	L757
1793                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1795  027e e601          	ld	a,(1,x)
1796  0280 aa20          	or	a,#32
1797  0282 e701          	ld	(1,x),a
1799  0284 2008          	jra	L167
1800  0286               L757:
1801                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1803  0286 1e01          	ldw	x,(OFST+1,sp)
1804  0288 e601          	ld	a,(1,x)
1805  028a a4df          	and	a,#223
1806  028c e701          	ld	(1,x),a
1807  028e               L167:
1808                     ; 581 }
1811  028e 85            	popw	x
1812  028f 81            	ret
1860                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1860                     ; 593 {
1861                     	switch	.text
1862  0290               _I2C_FastModeDutyCycleConfig:
1864  0290 89            	pushw	x
1865       00000000      OFST:	set	0
1868                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1870                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1872  0291 7b05          	ld	a,(OFST+5,sp)
1873  0293 a140          	cp	a,#64
1874  0295 2608          	jrne	L7001
1875                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1877  0297 e60c          	ld	a,(12,x)
1878  0299 aa40          	or	a,#64
1879  029b e70c          	ld	(12,x),a
1881  029d 2008          	jra	L1101
1882  029f               L7001:
1883                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1885  029f 1e01          	ldw	x,(OFST+1,sp)
1886  02a1 e60c          	ld	a,(12,x)
1887  02a3 a4bf          	and	a,#191
1888  02a5 e70c          	ld	(12,x),a
1889  02a7               L1101:
1890                     ; 608 }
1893  02a7 85            	popw	x
1894  02a8 81            	ret
1973                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1973                     ; 622 {
1974                     	switch	.text
1975  02a9               _I2C_Send7bitAddress:
1977  02a9 89            	pushw	x
1978       00000000      OFST:	set	0
1981                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1983                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1985                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1987  02aa 0d06          	tnz	(OFST+6,sp)
1988  02ac 2708          	jreq	L3501
1989                     ; 631     Address |= OAR1_ADD0_Set;
1991  02ae 7b05          	ld	a,(OFST+5,sp)
1992  02b0 aa01          	or	a,#1
1993  02b2 6b05          	ld	(OFST+5,sp),a
1995  02b4 2006          	jra	L5501
1996  02b6               L3501:
1997                     ; 636     Address &= OAR1_ADD0_Reset;
1999  02b6 7b05          	ld	a,(OFST+5,sp)
2000  02b8 a4fe          	and	a,#254
2001  02ba 6b05          	ld	(OFST+5,sp),a
2002  02bc               L5501:
2003                     ; 639   I2Cx->DR = Address;
2005  02bc 7b05          	ld	a,(OFST+5,sp)
2006  02be 1e01          	ldw	x,(OFST+1,sp)
2007  02c0 e706          	ld	(6,x),a
2008                     ; 640 }
2011  02c2 85            	popw	x
2012  02c3 81            	ret
2058                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2058                     ; 665 {
2059                     	switch	.text
2060  02c4               _I2C_SendData:
2062  02c4 89            	pushw	x
2063       00000000      OFST:	set	0
2066                     ; 667   I2Cx->DR = Data;
2068  02c5 7b05          	ld	a,(OFST+5,sp)
2069  02c7 1e01          	ldw	x,(OFST+1,sp)
2070  02c9 e706          	ld	(6,x),a
2071                     ; 668 }
2074  02cb 85            	popw	x
2075  02cc 81            	ret
2112                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2112                     ; 677 {
2113                     	switch	.text
2114  02cd               _I2C_ReceiveData:
2118                     ; 679   return ((uint8_t)I2Cx->DR);
2120  02cd e606          	ld	a,(6,x)
2123  02cf 81            	ret
2170                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2170                     ; 706 {
2171                     	switch	.text
2172  02d0               _I2C_TransmitPEC:
2174  02d0 89            	pushw	x
2175       00000000      OFST:	set	0
2178                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2180                     ; 710   if (NewState != DISABLE)
2182  02d1 0d05          	tnz	(OFST+5,sp)
2183  02d3 2708          	jreq	L7411
2184                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2186  02d5 e601          	ld	a,(1,x)
2187  02d7 aa10          	or	a,#16
2188  02d9 e701          	ld	(1,x),a
2190  02db 2008          	jra	L1511
2191  02dd               L7411:
2192                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2194  02dd 1e01          	ldw	x,(OFST+1,sp)
2195  02df e601          	ld	a,(1,x)
2196  02e1 a4ef          	and	a,#239
2197  02e3 e701          	ld	(1,x),a
2198  02e5               L1511:
2199                     ; 720 }
2202  02e5 85            	popw	x
2203  02e6 81            	ret
2250                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2250                     ; 730 {
2251                     	switch	.text
2252  02e7               _I2C_CalculatePEC:
2254  02e7 89            	pushw	x
2255       00000000      OFST:	set	0
2258                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2260                     ; 734   if (NewState != DISABLE)
2262  02e8 0d05          	tnz	(OFST+5,sp)
2263  02ea 2706          	jreq	L7711
2264                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2266  02ec f6            	ld	a,(x)
2267  02ed aa20          	or	a,#32
2268  02ef f7            	ld	(x),a
2270  02f0 2006          	jra	L1021
2271  02f2               L7711:
2272                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2274  02f2 1e01          	ldw	x,(OFST+1,sp)
2275  02f4 f6            	ld	a,(x)
2276  02f5 a4df          	and	a,#223
2277  02f7 f7            	ld	(x),a
2278  02f8               L1021:
2279                     ; 744 }
2282  02f8 85            	popw	x
2283  02f9 81            	ret
2353                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2353                     ; 756 {
2354                     	switch	.text
2355  02fa               _I2C_PECPositionConfig:
2357  02fa 89            	pushw	x
2358       00000000      OFST:	set	0
2361                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2363                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2365  02fb e601          	ld	a,(1,x)
2366  02fd a4f7          	and	a,#247
2367  02ff e701          	ld	(1,x),a
2368                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2370  0301 e601          	ld	a,(1,x)
2371  0303 1a05          	or	a,(OFST+5,sp)
2372  0305 e701          	ld	(1,x),a
2373                     ; 764 }
2376  0307 85            	popw	x
2377  0308 81            	ret
2414                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2414                     ; 773 {
2415                     	switch	.text
2416  0309               _I2C_GetPEC:
2420                     ; 775   return (I2Cx->PECR);
2422  0309 e60e          	ld	a,(14,x)
2425  030b 81            	ret
2472                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2472                     ; 804 {
2473                     	switch	.text
2474  030c               _I2C_DMACmd:
2476  030c 89            	pushw	x
2477       00000000      OFST:	set	0
2480                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2482                     ; 808   if (NewState != DISABLE)
2484  030d 0d05          	tnz	(OFST+5,sp)
2485  030f 2708          	jreq	L3031
2486                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2488  0311 e60a          	ld	a,(10,x)
2489  0313 aa08          	or	a,#8
2490  0315 e70a          	ld	(10,x),a
2492  0317 2008          	jra	L5031
2493  0319               L3031:
2494                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2496  0319 1e01          	ldw	x,(OFST+1,sp)
2497  031b e60a          	ld	a,(10,x)
2498  031d a4f7          	and	a,#247
2499  031f e70a          	ld	(10,x),a
2500  0321               L5031:
2501                     ; 818 }
2504  0321 85            	popw	x
2505  0322 81            	ret
2553                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2553                     ; 828 {
2554                     	switch	.text
2555  0323               _I2C_DMALastTransferCmd:
2557  0323 89            	pushw	x
2558       00000000      OFST:	set	0
2561                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2563                     ; 832   if (NewState != DISABLE)
2565  0324 0d05          	tnz	(OFST+5,sp)
2566  0326 2708          	jreq	L3331
2567                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2569  0328 e60a          	ld	a,(10,x)
2570  032a aa10          	or	a,#16
2571  032c e70a          	ld	(10,x),a
2573  032e 2008          	jra	L5331
2574  0330               L3331:
2575                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2577  0330 1e01          	ldw	x,(OFST+1,sp)
2578  0332 e60a          	ld	a,(10,x)
2579  0334 a4ef          	and	a,#239
2580  0336 e70a          	ld	(10,x),a
2581  0338               L5331:
2582                     ; 842 }
2585  0338 85            	popw	x
2586  0339 81            	ret
2775                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2775                     ; 955 {
2776                     	switch	.text
2777  033a               _I2C_ITConfig:
2779  033a 89            	pushw	x
2780       00000000      OFST:	set	0
2783                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2785                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2787                     ; 960   if (NewState != DISABLE)
2789  033b 0d07          	tnz	(OFST+7,sp)
2790  033d 2708          	jreq	L7341
2791                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2793  033f e60a          	ld	a,(10,x)
2794  0341 1a06          	or	a,(OFST+6,sp)
2795  0343 e70a          	ld	(10,x),a
2797  0345 2009          	jra	L1441
2798  0347               L7341:
2799                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2801  0347 1e01          	ldw	x,(OFST+1,sp)
2802  0349 7b06          	ld	a,(OFST+6,sp)
2803  034b 43            	cpl	a
2804  034c e40a          	and	a,(10,x)
2805  034e e70a          	ld	(10,x),a
2806  0350               L1441:
2807                     ; 970 }
2810  0350 85            	popw	x
2811  0351 81            	ret
2972                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2972                     ; 995 {
2973                     	switch	.text
2974  0352               _I2C_ReadRegister:
2976  0352 89            	pushw	x
2977  0353 5204          	subw	sp,#4
2978       00000004      OFST:	set	4
2981                     ; 996   __IO uint16_t tmp = 0;
2983  0355 5f            	clrw	x
2984  0356 1f03          	ldw	(OFST-1,sp),x
2986                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2988                     ; 1000   tmp = (uint16_t) I2Cx;
2990  0358 1e05          	ldw	x,(OFST+1,sp)
2991  035a 1f03          	ldw	(OFST-1,sp),x
2993                     ; 1001   tmp += I2C_Register;
2995  035c 7b09          	ld	a,(OFST+5,sp)
2996  035e 5f            	clrw	x
2997  035f 97            	ld	xl,a
2998  0360 1f01          	ldw	(OFST-3,sp),x
3000  0362 1e03          	ldw	x,(OFST-1,sp)
3001  0364 72fb01        	addw	x,(OFST-3,sp)
3002  0367 1f03          	ldw	(OFST-1,sp),x
3004                     ; 1004   return (*(__IO uint8_t *) tmp);
3006  0369 1e03          	ldw	x,(OFST-1,sp)
3007  036b f6            	ld	a,(x)
3010  036c 5b06          	addw	sp,#6
3011  036e 81            	ret
3265                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3265                     ; 1045 {
3266                     	switch	.text
3267  036f               _I2C_CheckEvent:
3269  036f 89            	pushw	x
3270  0370 5206          	subw	sp,#6
3271       00000006      OFST:	set	6
3274                     ; 1046   __IO uint16_t lastevent = 0x00;
3276  0372 5f            	clrw	x
3277  0373 1f04          	ldw	(OFST-2,sp),x
3279                     ; 1047   uint8_t flag1 = 0x00 ;
3281                     ; 1048   uint8_t flag2 = 0x00;
3283                     ; 1049   ErrorStatus status = ERROR;
3285                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3287                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3289  0375 1e0b          	ldw	x,(OFST+5,sp)
3290  0377 a30004        	cpw	x,#4
3291  037a 260c          	jrne	L5561
3292                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3294  037c 1e07          	ldw	x,(OFST+1,sp)
3295  037e e608          	ld	a,(8,x)
3296  0380 a404          	and	a,#4
3297  0382 5f            	clrw	x
3298  0383 97            	ld	xl,a
3299  0384 1f04          	ldw	(OFST-2,sp),x
3302  0386 2021          	jra	L7561
3303  0388               L5561:
3304                     ; 1060     flag1 = I2Cx->SR1;
3306  0388 1e07          	ldw	x,(OFST+1,sp)
3307  038a e607          	ld	a,(7,x)
3308  038c 6b03          	ld	(OFST-3,sp),a
3310                     ; 1061     flag2 = I2Cx->SR3;
3312  038e 1e07          	ldw	x,(OFST+1,sp)
3313  0390 e609          	ld	a,(9,x)
3314  0392 6b06          	ld	(OFST+0,sp),a
3316                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3318  0394 7b03          	ld	a,(OFST-3,sp)
3319  0396 5f            	clrw	x
3320  0397 97            	ld	xl,a
3321  0398 1f01          	ldw	(OFST-5,sp),x
3323  039a 7b06          	ld	a,(OFST+0,sp)
3324  039c 5f            	clrw	x
3325  039d 97            	ld	xl,a
3326  039e 4f            	clr	a
3327  039f 02            	rlwa	x,a
3328  03a0 01            	rrwa	x,a
3329  03a1 1a02          	or	a,(OFST-4,sp)
3330  03a3 01            	rrwa	x,a
3331  03a4 1a01          	or	a,(OFST-5,sp)
3332  03a6 01            	rrwa	x,a
3333  03a7 1f04          	ldw	(OFST-2,sp),x
3335  03a9               L7561:
3336                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3338  03a9 1e04          	ldw	x,(OFST-2,sp)
3339  03ab 01            	rrwa	x,a
3340  03ac 140c          	and	a,(OFST+6,sp)
3341  03ae 01            	rrwa	x,a
3342  03af 140b          	and	a,(OFST+5,sp)
3343  03b1 01            	rrwa	x,a
3344  03b2 130b          	cpw	x,(OFST+5,sp)
3345  03b4 2606          	jrne	L1661
3346                     ; 1068     status = SUCCESS;
3348  03b6 a601          	ld	a,#1
3349  03b8 6b06          	ld	(OFST+0,sp),a
3352  03ba 2002          	jra	L3661
3353  03bc               L1661:
3354                     ; 1073     status = ERROR;
3356  03bc 0f06          	clr	(OFST+0,sp)
3358  03be               L3661:
3359                     ; 1077   return status;
3361  03be 7b06          	ld	a,(OFST+0,sp)
3364  03c0 5b08          	addw	sp,#8
3365  03c2 81            	ret
3430                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3430                     ; 1096 {
3431                     	switch	.text
3432  03c3               _I2C_GetLastEvent:
3434  03c3 89            	pushw	x
3435  03c4 5206          	subw	sp,#6
3436       00000006      OFST:	set	6
3439                     ; 1097   __IO uint16_t lastevent = 0;
3441  03c6 5f            	clrw	x
3442  03c7 1f05          	ldw	(OFST-1,sp),x
3444                     ; 1098   uint16_t flag1 = 0;
3446                     ; 1099   uint16_t flag2 = 0;
3448                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3450  03c9 1e07          	ldw	x,(OFST+1,sp)
3451  03cb e608          	ld	a,(8,x)
3452  03cd a504          	bcp	a,#4
3453  03cf 2707          	jreq	L1271
3454                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3456  03d1 ae0004        	ldw	x,#4
3457  03d4 1f05          	ldw	(OFST-1,sp),x
3460  03d6 201d          	jra	L3271
3461  03d8               L1271:
3462                     ; 1108     flag1 = I2Cx->SR1;
3464  03d8 1e07          	ldw	x,(OFST+1,sp)
3465  03da e607          	ld	a,(7,x)
3466  03dc 5f            	clrw	x
3467  03dd 97            	ld	xl,a
3468  03de 1f01          	ldw	(OFST-5,sp),x
3470                     ; 1109     flag2 = I2Cx->SR3;
3472  03e0 1e07          	ldw	x,(OFST+1,sp)
3473  03e2 e609          	ld	a,(9,x)
3474  03e4 5f            	clrw	x
3475  03e5 97            	ld	xl,a
3476  03e6 1f03          	ldw	(OFST-3,sp),x
3478                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3480  03e8 1e03          	ldw	x,(OFST-3,sp)
3481  03ea 4f            	clr	a
3482  03eb 02            	rlwa	x,a
3483  03ec 01            	rrwa	x,a
3484  03ed 1a02          	or	a,(OFST-4,sp)
3485  03ef 01            	rrwa	x,a
3486  03f0 1a01          	or	a,(OFST-5,sp)
3487  03f2 01            	rrwa	x,a
3488  03f3 1f05          	ldw	(OFST-1,sp),x
3490  03f5               L3271:
3491                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3493  03f5 1e05          	ldw	x,(OFST-1,sp)
3496  03f7 5b08          	addw	sp,#8
3497  03f9 81            	ret
3754                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3754                     ; 1153 {
3755                     	switch	.text
3756  03fa               _I2C_GetFlagStatus:
3758  03fa 89            	pushw	x
3759  03fb 89            	pushw	x
3760       00000002      OFST:	set	2
3763                     ; 1154   uint8_t tempreg = 0;
3765  03fc 0f02          	clr	(OFST+0,sp)
3767                     ; 1155   uint8_t regindex = 0;
3769                     ; 1156   FlagStatus bitstatus = RESET;
3771                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3773                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3775  03fe 7b07          	ld	a,(OFST+5,sp)
3776  0400 6b01          	ld	(OFST-1,sp),a
3778                     ; 1164   switch (regindex)
3780  0402 7b01          	ld	a,(OFST-1,sp)
3782                     ; 1181     default:
3782                     ; 1182       break;
3783  0404 4a            	dec	a
3784  0405 2708          	jreq	L5271
3785  0407 4a            	dec	a
3786  0408 270d          	jreq	L7271
3787  040a 4a            	dec	a
3788  040b 2712          	jreq	L1371
3789  040d 2016          	jra	L7602
3790  040f               L5271:
3791                     ; 1167     case 0x01:
3791                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3793  040f 1e03          	ldw	x,(OFST+1,sp)
3794  0411 e607          	ld	a,(7,x)
3795  0413 6b02          	ld	(OFST+0,sp),a
3797                     ; 1169       break;
3799  0415 200e          	jra	L7602
3800  0417               L7271:
3801                     ; 1172     case 0x02:
3801                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3803  0417 1e03          	ldw	x,(OFST+1,sp)
3804  0419 e608          	ld	a,(8,x)
3805  041b 6b02          	ld	(OFST+0,sp),a
3807                     ; 1174       break;
3809  041d 2006          	jra	L7602
3810  041f               L1371:
3811                     ; 1177     case 0x03:
3811                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3813  041f 1e03          	ldw	x,(OFST+1,sp)
3814  0421 e609          	ld	a,(9,x)
3815  0423 6b02          	ld	(OFST+0,sp),a
3817                     ; 1179       break;
3819  0425               L3371:
3820                     ; 1181     default:
3820                     ; 1182       break;
3822  0425               L7602:
3823                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3825  0425 7b08          	ld	a,(OFST+6,sp)
3826  0427 1502          	bcp	a,(OFST+0,sp)
3827  0429 2706          	jreq	L1702
3828                     ; 1189     bitstatus = SET;
3830  042b a601          	ld	a,#1
3831  042d 6b02          	ld	(OFST+0,sp),a
3834  042f 2002          	jra	L3702
3835  0431               L1702:
3836                     ; 1194     bitstatus = RESET;
3838  0431 0f02          	clr	(OFST+0,sp)
3840  0433               L3702:
3841                     ; 1197   return bitstatus;
3843  0433 7b02          	ld	a,(OFST+0,sp)
3846  0435 5b04          	addw	sp,#4
3847  0437 81            	ret
3903                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3903                     ; 1230 {
3904                     	switch	.text
3905  0438               _I2C_ClearFlag:
3907  0438 89            	pushw	x
3908  0439 89            	pushw	x
3909       00000002      OFST:	set	2
3912                     ; 1231   uint16_t flagpos = 0;
3914                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3916                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3918  043a 7b07          	ld	a,(OFST+5,sp)
3919  043c 97            	ld	xl,a
3920  043d 7b08          	ld	a,(OFST+6,sp)
3921  043f a4ff          	and	a,#255
3922  0441 5f            	clrw	x
3923  0442 02            	rlwa	x,a
3924  0443 1f01          	ldw	(OFST-1,sp),x
3925  0445 01            	rrwa	x,a
3927                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3929  0446 7b02          	ld	a,(OFST+0,sp)
3930  0448 43            	cpl	a
3931  0449 1e03          	ldw	x,(OFST+1,sp)
3932  044b e708          	ld	(8,x),a
3933                     ; 1239 }
3936  044d 5b04          	addw	sp,#4
3937  044f 81            	ret
4013                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4013                     ; 1265 {
4014                     	switch	.text
4015  0450               _I2C_GetITStatus:
4017  0450 89            	pushw	x
4018  0451 5204          	subw	sp,#4
4019       00000004      OFST:	set	4
4022                     ; 1266   ITStatus bitstatus = RESET;
4024                     ; 1267   __IO uint8_t enablestatus = 0;
4026  0453 0f03          	clr	(OFST-1,sp)
4028                     ; 1268   uint16_t tempregister = 0;
4030                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
4032                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4034  0455 7b09          	ld	a,(OFST+5,sp)
4035  0457 a407          	and	a,#7
4036  0459 5f            	clrw	x
4037  045a 97            	ld	xl,a
4038  045b 1f01          	ldw	(OFST-3,sp),x
4040                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4042  045d 1e05          	ldw	x,(OFST+1,sp)
4043  045f e60a          	ld	a,(10,x)
4044  0461 1402          	and	a,(OFST-2,sp)
4045  0463 6b03          	ld	(OFST-1,sp),a
4047                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4049  0465 7b09          	ld	a,(OFST+5,sp)
4050  0467 97            	ld	xl,a
4051  0468 7b0a          	ld	a,(OFST+6,sp)
4052  046a 9f            	ld	a,xl
4053  046b a430          	and	a,#48
4054  046d 97            	ld	xl,a
4055  046e 4f            	clr	a
4056  046f 02            	rlwa	x,a
4057  0470 a30100        	cpw	x,#256
4058  0473 2616          	jrne	L5612
4059                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4061  0475 1e05          	ldw	x,(OFST+1,sp)
4062  0477 e607          	ld	a,(7,x)
4063  0479 150a          	bcp	a,(OFST+6,sp)
4064  047b 270a          	jreq	L7612
4066  047d 0d03          	tnz	(OFST-1,sp)
4067  047f 2706          	jreq	L7612
4068                     ; 1284       bitstatus = SET;
4070  0481 a601          	ld	a,#1
4071  0483 6b04          	ld	(OFST+0,sp),a
4074  0485 2018          	jra	L3712
4075  0487               L7612:
4076                     ; 1289       bitstatus = RESET;
4078  0487 0f04          	clr	(OFST+0,sp)
4080  0489 2014          	jra	L3712
4081  048b               L5612:
4082                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4084  048b 1e05          	ldw	x,(OFST+1,sp)
4085  048d e608          	ld	a,(8,x)
4086  048f 150a          	bcp	a,(OFST+6,sp)
4087  0491 270a          	jreq	L5712
4089  0493 0d03          	tnz	(OFST-1,sp)
4090  0495 2706          	jreq	L5712
4091                     ; 1298       bitstatus = SET;
4093  0497 a601          	ld	a,#1
4094  0499 6b04          	ld	(OFST+0,sp),a
4097  049b 2002          	jra	L3712
4098  049d               L5712:
4099                     ; 1303       bitstatus = RESET;
4101  049d 0f04          	clr	(OFST+0,sp)
4103  049f               L3712:
4104                     ; 1307   return  bitstatus;
4106  049f 7b04          	ld	a,(OFST+0,sp)
4109  04a1 5b06          	addw	sp,#6
4110  04a3 81            	ret
4167                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4167                     ; 1341 {
4168                     	switch	.text
4169  04a4               _I2C_ClearITPendingBit:
4171  04a4 89            	pushw	x
4172  04a5 89            	pushw	x
4173       00000002      OFST:	set	2
4176                     ; 1342   uint16_t flagpos = 0;
4178                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4180                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4182  04a6 7b07          	ld	a,(OFST+5,sp)
4183  04a8 97            	ld	xl,a
4184  04a9 7b08          	ld	a,(OFST+6,sp)
4185  04ab a4ff          	and	a,#255
4186  04ad 5f            	clrw	x
4187  04ae 02            	rlwa	x,a
4188  04af 1f01          	ldw	(OFST-1,sp),x
4189  04b1 01            	rrwa	x,a
4191                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4193  04b2 7b02          	ld	a,(OFST+0,sp)
4194  04b4 43            	cpl	a
4195  04b5 1e03          	ldw	x,(OFST+1,sp)
4196  04b7 e708          	ld	(8,x),a
4197                     ; 1352 }
4200  04b9 5b04          	addw	sp,#4
4201  04bb 81            	ret
4214                     	xdef	_I2C_ClearITPendingBit
4215                     	xdef	_I2C_GetITStatus
4216                     	xdef	_I2C_ClearFlag
4217                     	xdef	_I2C_GetFlagStatus
4218                     	xdef	_I2C_GetLastEvent
4219                     	xdef	_I2C_CheckEvent
4220                     	xdef	_I2C_ReadRegister
4221                     	xdef	_I2C_ITConfig
4222                     	xdef	_I2C_DMALastTransferCmd
4223                     	xdef	_I2C_DMACmd
4224                     	xdef	_I2C_CalculatePEC
4225                     	xdef	_I2C_TransmitPEC
4226                     	xdef	_I2C_GetPEC
4227                     	xdef	_I2C_PECPositionConfig
4228                     	xdef	_I2C_ReceiveData
4229                     	xdef	_I2C_SendData
4230                     	xdef	_I2C_Send7bitAddress
4231                     	xdef	_I2C_SMBusAlertConfig
4232                     	xdef	_I2C_FastModeDutyCycleConfig
4233                     	xdef	_I2C_AckPositionConfig
4234                     	xdef	_I2C_DualAddressCmd
4235                     	xdef	_I2C_OwnAddress2Config
4236                     	xdef	_I2C_AcknowledgeConfig
4237                     	xdef	_I2C_GenerateSTOP
4238                     	xdef	_I2C_GenerateSTART
4239                     	xdef	_I2C_ARPCmd
4240                     	xdef	_I2C_StretchClockCmd
4241                     	xdef	_I2C_SoftwareResetCmd
4242                     	xdef	_I2C_GeneralCallCmd
4243                     	xdef	_I2C_Cmd
4244                     	xdef	_I2C_Init
4245                     	xdef	_I2C_DeInit
4246                     	xref	_CLK_GetClockFreq
4247                     	xref.b	c_lreg
4248                     	xref.b	c_x
4267                     	xref	c_uitol
4268                     	xref	c_sdivx
4269                     	xref	c_lzmp
4270                     	xref	c_rtol
4271                     	xref	c_smul
4272                     	xref	c_lmul
4273                     	xref	c_lcmp
4274                     	xref	c_ltor
4275                     	xref	c_ludv
4276                     	end
