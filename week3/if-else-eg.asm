		.orig x3000			;if-else-eg.asm
		and R2,R2,#0
		ld R1,data
		BRzp else
if							;if R1 < 0
		add R2,R2,#1
		add R1,R1,#-2
		BR endif
else
		add R2,R1, #0		;else (R1 >= 0)
		add R1,R1,#-1
endif
		Halt
data	.fill	x000A
		.End