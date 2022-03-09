;simple-loop.asm
;this loop executes 10 times
	.orig x3000
	and R0,R0,#0	
	add R0,R0,#10	;set counter to 10
loop
	add R0,R0,#-1	;decrement counter
	BRp loop	;loop if positive
	Halt
	.End