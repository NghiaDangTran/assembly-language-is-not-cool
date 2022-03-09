;read-echo-ch.asm
;A program that reads, stores and echos a character.  

		.orig x3000			;set origin of program
		Trap x20			;read a character into R0
		St R0, result		;store character to memory location result
		Trap x21			;echo character
		halt

result	.blkw	1
		.end