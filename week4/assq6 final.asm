; Student name: Nghia Dang
; student number: 7863177
; assigment 2
; program : this program will take an input from user and check number of 10s
; 

;r0 will be the input and out put
; r1 save the user input char
;R2 check the bit is 1 or 0
;r3 to track the current bit address
;r4 while loop from bit 8 to bit 1
;R5 store the total of 10s


.orig x3000

mainline 
    lea r0, prompt; ask user
    puts
    ;first of all clean all the register
    AND R0,R0,#0    
    AND R1,R1,#0
    AND R2,R2,#0
    AND R3,R3,#0
    AND R4,R4,#0
    AND R5,R5,#0
    getc; make user enter 1 string
    out
    add r4,r0,#-4 ; the trick here is just check the new char user enter then -4 is 0 or not if it is 0 then it is EOT
    brz done
    
    
    
    ;------------------------------------------------

    ; set up the loop
    ADD R3,R3,#1
    ADD R4,R4,#6

    ;save the char into R1
    ADD R1,R0,#0
    AND R0,R0,#0

while_loop  
        AND  R2,R3,R1; check the bit at r3 location by using bit map
        BRz  process_Data;
        ; if the current r3 is 0 then go to process data
        ; it will check the next r3 is 1 if it 1 then add 1 in r5
        ;orther wise reset the r3 back to the current r3 
        brp do   
        
do
       ADD  R3,R3,R3; the idea is from the bit map we can traverse the bit from 8 to 1 
       ; by double the intial value of r3
       ADD  R4,R4,#-1
       ; decrement the r4
       brn continue; if the loop end then go to continue
       BRzp while_loop; if the r4 is 0 then go to while_loop
       
    


process_Data 
        ;check the bit is 1 or 0
            add r7,r3,#0
            ; save r3 add to r7
            ADD  R3,R3,R3
            AND  R2,R3,R1;
            BRz #1
                add R5,R5,#1
            add r3,r0,r7
            AND R7,R7,#0
            brnzp do
    
    
    
    
    

continue
          ; this just print data out
            add R5,R5,#0
            
                brz #5
                    lea r0,number_10
                    puts
                    ld r0,print_num
                    add r0,r0,R5
                    out


            br mainline

done
    lea r0,name
    puts
    halt

prompt .stringz "\nEnter any char:  " 
three1 .stringz "\nthe char u enter has 111 at the end"
number_10    .stringz "\nNumber of 10s: "
name  .stringz "\nlab2 done by Nghia Dang\nEnd of porcessing"

print_num .fill x30
    
.end