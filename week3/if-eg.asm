		.orig x3000			;if-eg.asm
		ld R2,data
		add R1,R2,#1
		BRnz skip
if
		;do some stuff here
		and R3,R3,0
		add R3,R3,R1
skip
		Halt
data	.fill	x000A
		.End