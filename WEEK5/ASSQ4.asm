


.ORIG x3000
AND R0,R0,#0    

AND R1,R1,#0

AND R2,R2,#0

AND R3,R3,#0

AND R4,R4,#0

AND R5,R5,#0

AND R6,R6,#0	
LD R6,STACKBASE  
LEA R1,TARGETS  
LEA R2,SOURCE
LD R3,NUNMTARGETS 
LD R4,N
LDR R5,R1,#0; THIS should be illigel but I dont have enogy space to save it so it is 
; just a temporary after use it i will reset the value back to 0

WHILE
;Before calling the subroutine push the arguments onto the stack in the following order:
;Address of the array SOURCE
;The value of N
;The current target value.


ADD R6,R6,#-1 
STR R2,R6,#0
ADD R6,R6,#-1 
STR R4,R6,#0 
ADD R6,R6,#-1
STR R5,R6,#0
AND R5,R5,#0
ADD R6,R6,#-1 

JSR FOR_LOOP 
LDR r5,R6,#0 
ADD R6,R6,#4 
ADD r5,r5,#0
BRZ NOTFOUND 
LEA R0,FOUNDMSG

PUTS
LD R0,ASCII 
ADD R0,R0,r5 
AND R5,R5,#0
OUT

BR AGAIN_BIGGER_0
NOTFOUND
AND R5,R5,#0
LEA R0,NOTFOUNDMSG 
PUTS




AGAIN_BIGGER_0
ADD R1,R1,#1 
LDR R5,R1,#0
ADD R3,R3,#-1
BRZ DONE

BR WHILE

DONE
LEA R0,EOPMSG

PUTS
HALT

FOR_LOOP
ADD R6,R6,#-1 
STR R5,R6,#0 
ADD R5,R6,#1 
ADD R6,R6,#-1 
STR R0,R6,#0 
ADD R6,R6,#-1
STR R1,R6,#0 
ADD R6,R6,#-1
STR R2,R6,#0
ADD R6,R6,#-1
STR R3,R6,#0 
ADD R6,R6,#-1
STR R4,R6,#0 
AND R0,R0,#0    
AND R1,R1,#0
AND R2,R2,#0
AND R3,R3,#0
AND R4,R4,#0
STR R0,R5,#0 ; save the result as the return value
LDR R1,R5,#3 ; the address of the aarry
LDR R2,R5,#1 ;the target value
LDR R3,R5,#2 ; number of elements in array
WHILE2
LDR R4,R1,#0 ;get the value at r1
; the trick here is if 2 number is the same then if we convert one number to negative then the sum of it will be 0
NOT R4,R4
ADD R4,R4,#1

ADD R4,R4,R2
BRz found
ADD R0,R0,#1 
ADD R1,R1,#1 
ADD R3,R3,#-1
BRZ DONE2
BR WHILE2

FOUND
    STR R0,R5,#0 ; WE HAVE TO SVVE
    BR DONE2


DONE2
LDR R4,R6,#0 
ADD R6,R6,#1
LDR R3,R6,#0 
ADD R6,R6,#1
LDR R2,R6,#0 
ADD R6,R6,#1
LDR R1,R6,#0 
ADD R6,R6,#1
LDR R0,R6,#0 
ADD R6,R6,#1
LDR R5,R6,#0 
ADD R6,R6,#1
RET




ASCII .fill #48

FOUNDMSG .stringz "\nFound at position: "

NOTFOUNDMSG .stringz "\nNot found."

EOPMSG .stringz "\nEnd of Processing"
STACKBASE .fill xFE00
N .fill #10

SOURCE .fill #99

.fill     #67
.fill #-33

.fill #0

.fill #-123

.fill #29

.fill #17

.fill #79

.fill #22

.fill #-1

NUNMTARGETS .fill #4

TARGETS .fill #-123

.fill #79

.fill #66

.fill #67
.end