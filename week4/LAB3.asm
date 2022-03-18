;Lab3-1.asm
;Purpose: compute sum of positive #s and sum of negative #s
;Input: array in memory
;Output: counts stored in memory

	.orig x3000

	;PUT YOUR CODE HERE
    lEA r1,array
    LDR R2,R1,#9
    
    brN ok
    
    halt
    


ok
	lea	r0,eopMessage
	puts
	halt

sumPos
	.fill    0      ;sum of positive numbers
sumNeg
	.fill    0      ;sum of negative numbers

n	.fill    10     ;length of Data array
array
	.fill    -3     ;array of data values
	.fill    -10
	.fill    0
	.fill    6
	.fill    -6
	.fill    3
	.fill    4
	.fill    0
	.fill    -3
	.fill    -9
check .fill #32768
eopMessage
	.stringz "\nthis number is negative\n"
	.end
