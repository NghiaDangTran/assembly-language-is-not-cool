.ORIG x3000 ;start point

;R6 is the the register of number stored
;R1 is the register for manipulation of the number stored
;R2 is the counter for number of 1s
;R3 is the bitmask
;R4 is the loopcounter
;R5 is the storage for AND operation

AND R1,R1,#0; Clean R1
AND R2,R2,#0; Clean R2
AND R3,R3,#0; Clean R3
AND R4,R4,#0; Clean R4
AND R5,R5,#0; Clean R5

ADD R3,R3,#1; Set the value of R3 to 1
ADD R4,R4,#7; Set the loop counter to 15

LD  R6,FILL_R6
ADD R1,R6,#0;

CHECK  AND  R5,R3,R1;
       BRp 6  
            add r7,r3,#0
            ADD  R3,R3,R3
            AND  R5,R3,R1;
            BRz #1
            add r2,r2,#1
            add r3,r0,r7
            AND R7,R7,#0;
          
        

       ADD  R3,R3,R3; Left shift bitmask
       ADD  R4,R4,#-1
       BRzp CHECK
    halt


STI R2,STORE_x5000

FILL_R6     .FILL XAA
STORE_x5000 .FILL x5000


.END