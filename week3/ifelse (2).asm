; This example implements a simple if/else statement
            .orig  x3000
            and    R2,R2,#0    ; R2 <- 0
            and    R1,R1,#0
            add    R1,R1,#10   ; R1 <- 10

            brnz   else        ; if R1 > 0	
if
            add    R2,R2,#1
            add    R1,R1,#-2
            br     endif
else                           ; else (R1 <=0)
            add    R2,R1,#0
            add    R1,R1,#-1
endif                          ; end of if/else
            add    R3,R1,R2
            halt
            .end
