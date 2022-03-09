		.orig x3000			;while-eg.asm
		trap x20			; read a character into R0		
		and R1,R1, #0
		add R1,R1,#10	;set up 10 iterations
		
		BRnz done			
loop
		trap x21			; print character in R0
		add R1,R1,#-1
		BRp loop
done
		Halt
t		.fill	#10
		.fill 	#1
x		.fill 	#2

		.End