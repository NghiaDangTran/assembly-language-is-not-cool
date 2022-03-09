;sum-odd-eg.asm
; sums the odd values from 1 to 15 and holds it in register R2

;Register Dictionary:
;R0 - Holds address of strings to be displayed
;R1 - Holds the current loop counter value. 
;R2 - Holds the sum
;R3 - Used to hold if R1 is odd or not (1 if it is, 0 if it is not)

  .orig x3000     ;set origin

  and   R2,R2,#0  ;initialize sum to 0
  and	R1,R1,#0
  add   R1,R1,#15	;set loop counter 

  brnz	endwhile
  
loop
  and   R3,R1,#1  ;check if lsb is 1
  brz 	notodd  
  add   R2,R2,R1  ;add counter value to sum
notodd
  add   R1,R1,#-1 ;decrement loop counter
  brp   loop      ;branch to top of loop if loop counter is still positive
endwhile
	
  lea   R0,eop    ;print end of processing message
  trap  x22
  halt

eop     .stringz  "\nEnd of Processing.\n"
  .end