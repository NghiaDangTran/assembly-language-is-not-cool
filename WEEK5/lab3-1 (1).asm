;Lab3-1.asm
;Purpose: compute sum of positive #s and sum of negative #s
;Input: array in memory
;Output: counts stored in memory

	.orig x3000

	;PUT YOUR CODE HERE
    LEA R1,ARRAY
    
    LEA R2, N
    LD R6,sumPos
    LD R7,sumNeg
    LDR R2,R2,#0
    ADD R4,R2,#-1

    LOOP
    LDR R3,R1,R4
    BRP  ADD R6,R3,#0
    BRN  
        NOT R4,R3
    ADD R7,R3,#1

    ADD R2,R2,#-1
    BRZP LOOP
    BRN DONE


POSLOOP
   
    

NEGLOOP
   
        
    
    
    


DONE
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
	.fill    5
	.fill    -9
eopMessage
	.stringz "\nEnd of processing.\n"
	.end
