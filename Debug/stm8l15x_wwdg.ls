   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  63                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 120 {
  65                     	switch	.text
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  74                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d4      	mov	20692,#127
  77                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aa80          	or	a,#128
  81  0008 c750d3        	ld	20691,a
  82                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d a47f          	and	a,#127
  86  000f c750d4        	ld	20692,a
  87                     ; 127 }
  90  0012 85            	popw	x
  91  0013 81            	ret
 135                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 135                     ; 136 {
 136                     	switch	.text
 137  0014               _WWDG_SetWindowValue:
 139  0014 88            	push	a
 140       00000001      OFST:	set	1
 143                     ; 137   __IO uint8_t tmpreg = 0;
 145  0015 0f01          	clr	(OFST+0,sp)
 147                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 149                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 151  0017 a47f          	and	a,#127
 152  0019 1a01          	or	a,(OFST+0,sp)
 153  001b 6b01          	ld	(OFST+0,sp),a
 155                     ; 146   WWDG->WR = tmpreg;
 157  001d 7b01          	ld	a,(OFST+0,sp)
 158  001f c750d4        	ld	20692,a
 159                     ; 147 }
 162  0022 84            	pop	a
 163  0023 81            	ret
 197                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 197                     ; 157 {
 198                     	switch	.text
 199  0024               _WWDG_SetCounter:
 203                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 205                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 207  0024 a47f          	and	a,#127
 208  0026 c750d3        	ld	20691,a
 209                     ; 164 }
 212  0029 81            	ret
 246                     ; 187 void WWDG_Enable(uint8_t Counter)
 246                     ; 188 {
 247                     	switch	.text
 248  002a               _WWDG_Enable:
 252                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 254                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 256  002a aa80          	or	a,#128
 257  002c c750d3        	ld	20691,a
 258                     ; 192 }
 261  002f 81            	ret
 284                     ; 216 uint8_t WWDG_GetCounter(void)
 284                     ; 217 {
 285                     	switch	.text
 286  0030               _WWDG_GetCounter:
 290                     ; 218   return(WWDG->CR);
 292  0030 c650d3        	ld	a,20691
 295  0033 81            	ret
 318                     ; 226 void WWDG_SWReset(void)
 318                     ; 227 {
 319                     	switch	.text
 320  0034               _WWDG_SWReset:
 324                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 326  0034 358050d3      	mov	20691,#128
 327                     ; 229 }
 330  0038 81            	ret
 343                     	xdef	_WWDG_SWReset
 344                     	xdef	_WWDG_GetCounter
 345                     	xdef	_WWDG_Enable
 346                     	xdef	_WWDG_SetCounter
 347                     	xdef	_WWDG_SetWindowValue
 348                     	xdef	_WWDG_Init
 367                     	end
