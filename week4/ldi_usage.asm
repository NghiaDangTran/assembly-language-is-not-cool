;This examples shows a pointer to a pointer variable chrPtr, pointer to either chr1 or chr2.
;LDI is used to load the value stored at chr1 or chr2 and print it.

;Register Usage
;R0 - Character to print
;R1 - Used to hold addresses


	.orig x3000

	LDI 	R0,chrPtr	;print 'A'
	TRAP	x21

	LEA	R1,chr2		;get address of chr2
	ST	R1,chrPtr	;store address at address chrPtr

	LDI	R0,chrPtr	;print 'B'
	TRAP	x21

	HALT
	

chrPtr	.fill	chr1
chr1	.fill	#65		;'A'
chr2	.fill	#66		;'B'


	.end