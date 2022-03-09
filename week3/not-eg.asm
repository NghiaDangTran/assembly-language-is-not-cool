;not-eg.asm
;do a bitwise negation of a word in memory (data) and store it back into memory (result)

		.orig x3000			;set origin of program
		ld r1,data			;load data into r1
		not r1,r1			;Negate bits in r1
		st r1,result			;store result back into memory
		halt


data	.fill	xF12C
result	.blkw	1
		.end