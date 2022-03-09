;cc-eg.asm
;simple program illustrating condition codes

		.orig x3000		;set origin of program
		and R0,R0,#0		;sets R0 to 0. N=0,P=0,Z=1
		add R0,R0,#-1		;N=1,P=0,Z=0
		not R0,R0		;N=0,P=0,Z=1 
		add R0,R0,#1		;N=0,P=1,Z=0
		Trap x21			;echo character
		halt
		.end