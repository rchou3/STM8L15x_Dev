   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 92 void BEEP_DeInit(void)
  43                     ; 93 {
  45                     	switch	.text
  46  0000               _BEEP_DeInit:
  50                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  52  0000 725f50f0      	clr	20720
  53                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  55  0004 351f50f3      	mov	20723,#31
  56                     ; 96 }
  59  0008 81            	ret
 124                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 124                     ; 106 {
 125                     	switch	.text
 126  0009               _BEEP_Init:
 128  0009 88            	push	a
 129       00000000      OFST:	set	0
 132                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 134                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 136  000a c650f3        	ld	a,20723
 137  000d a41f          	and	a,#31
 138  000f a11f          	cp	a,#31
 139  0011 260c          	jrne	L15
 140                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 142  0013 c650f3        	ld	a,20723
 143  0016 a4e0          	and	a,#224
 144  0018 c750f3        	ld	20723,a
 145                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 147  001b 721050f3      	bset	20723,#0
 148  001f               L15:
 149                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 151  001f c650f3        	ld	a,20723
 152  0022 a43f          	and	a,#63
 153  0024 c750f3        	ld	20723,a
 154                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 156  0027 c650f3        	ld	a,20723
 157  002a 1a01          	or	a,(OFST+1,sp)
 158  002c c750f3        	ld	20723,a
 159                     ; 122 }
 162  002f 84            	pop	a
 163  0030 81            	ret
 218                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 218                     ; 131 {
 219                     	switch	.text
 220  0031               _BEEP_Cmd:
 224                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 226                     ; 135   if (NewState != DISABLE)
 228  0031 4d            	tnz	a
 229  0032 2706          	jreq	L101
 230                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 232  0034 721a50f3      	bset	20723,#5
 234  0038 2004          	jra	L301
 235  003a               L101:
 236                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 238  003a 721b50f3      	bres	20723,#5
 239  003e               L301:
 240                     ; 145 }
 243  003e 81            	ret
 279                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 279                     ; 179 {
 280                     	switch	.text
 281  003f               _BEEP_LSClockToTIMConnectCmd:
 285                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 287                     ; 183   if (NewState != DISABLE)
 289  003f 4d            	tnz	a
 290  0040 2706          	jreq	L321
 291                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 293  0042 721050f0      	bset	20720,#0
 295  0046 2004          	jra	L521
 296  0048               L321:
 297                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 299  0048 721150f0      	bres	20720,#0
 300  004c               L521:
 301                     ; 193 }
 304  004c 81            	ret
 357                     .const:	section	.text
 358  0000               L61:
 359  0000 000003e8      	dc.l	1000
 360                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 360                     ; 208 {
 361                     	switch	.text
 362  004d               _BEEP_LSICalibrationConfig:
 364  004d 5206          	subw	sp,#6
 365       00000006      OFST:	set	6
 368                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 370                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 372  004f 96            	ldw	x,sp
 373  0050 1c0009        	addw	x,#OFST+3
 374  0053 cd0000        	call	c_ltor
 376  0056 ae0000        	ldw	x,#L61
 377  0059 cd0000        	call	c_ludv
 379  005c be02          	ldw	x,c_lreg+2
 380  005e 1f03          	ldw	(OFST-3,sp),x
 382                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 384  0060 c650f3        	ld	a,20723
 385  0063 a4e0          	and	a,#224
 386  0065 c750f3        	ld	20723,a
 387                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 389  0068 1e03          	ldw	x,(OFST-3,sp)
 390  006a 54            	srlw	x
 391  006b 54            	srlw	x
 392  006c 54            	srlw	x
 393  006d 1f05          	ldw	(OFST-1,sp),x
 395                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 397  006f 1e05          	ldw	x,(OFST-1,sp)
 398  0071 58            	sllw	x
 399  0072 58            	sllw	x
 400  0073 58            	sllw	x
 401  0074 1f01          	ldw	(OFST-5,sp),x
 403  0076 1e03          	ldw	x,(OFST-3,sp)
 404  0078 72f001        	subw	x,(OFST-5,sp)
 405  007b 1605          	ldw	y,(OFST-1,sp)
 406  007d 9058          	sllw	y
 407  007f 905c          	incw	y
 408  0081 cd0000        	call	c_imul
 410  0084 1605          	ldw	y,(OFST-1,sp)
 411  0086 9058          	sllw	y
 412  0088 9058          	sllw	y
 413  008a 9058          	sllw	y
 414  008c bf00          	ldw	c_x,x
 415  008e 90b300        	cpw	y,c_x
 416  0091 250c          	jrult	L551
 417                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 419  0093 7b06          	ld	a,(OFST+0,sp)
 420  0095 a002          	sub	a,#2
 421  0097 ca50f3        	or	a,20723
 422  009a c750f3        	ld	20723,a
 424  009d 2009          	jra	L751
 425  009f               L551:
 426                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 428  009f 7b06          	ld	a,(OFST+0,sp)
 429  00a1 4a            	dec	a
 430  00a2 ca50f3        	or	a,20723
 431  00a5 c750f3        	ld	20723,a
 432  00a8               L751:
 433                     ; 231 }
 436  00a8 5b06          	addw	sp,#6
 437  00aa 81            	ret
 450                     	xdef	_BEEP_LSICalibrationConfig
 451                     	xdef	_BEEP_LSClockToTIMConnectCmd
 452                     	xdef	_BEEP_Cmd
 453                     	xdef	_BEEP_Init
 454                     	xdef	_BEEP_DeInit
 455                     	xref.b	c_lreg
 456                     	xref.b	c_x
 475                     	xref	c_imul
 476                     	xref	c_ludv
 477                     	xref	c_ltor
 478                     	end
