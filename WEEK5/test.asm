.orig x3000


;lea r1,root
;ldr r2,r1,0
;ldr r3,r1,#1
;ldr r4,r3,#0
;ldr r5,r3,#1
;ldr r6,r3,#2
;ld r0,addres

;not r6,r6
;add r6,r6,#1

;add r2,r6,r0

;brnz this is adress



;lea r1,L5
;ldr r2,r1,#0
;ldr r3,r1,#1
;br 

;load data into the r5 




;if r5 0 is a number return the r5 value

;if the r5 is 0,-1,1

	
	ld	r6,stackbase    ; establish the stack pointer
    
    ;push value on to stack
    
    lea r4,root
    ld r1,addres
    add	r6,r6,#-1       ; push xValue onto the stack
	str	r4,r6,#0
	add	r6,r6,#-1
	jsr	recurse
	ldr	r3,r6,#0  

    add	r6,r6,#2 

    lea	r0,eopMsg       ; display EOP message
	puts
	halt

stackbase   .fill	xFD00
eopMsg      .stringz    "\n\nProgrammed by Stew Dent.\nEnd of processing.\n"


addres .fill x3000

root    .fill 0 ; *
         .fill op1
         .fill op3
op1      .fill 1 ; +
         .fill L1
         .fill op2
L1      .fill 20 ; operand
         .fill 0
         .fill 0
op2        .fill 0 ; *
         .fill L2
         .fill L3
L2      .fill 3 ; operand
         .fill 0
         .fill 0
L3      .fill -4 ; operand
         .fill 0
         .fill 0
op3      .fill -1 ; -
         .fill op4
         .fill L4
L4      .fill 5 ; operand
         .fill 0
         .fill 0
op4      .fill 1 ; +
         .fill L5
         .fill L6
L5      .fill 4 ; operand
         .fill 0
         .fill 0
L6      .fill 3 ; operand
         .fill 0
         .fill 0


multiply
           add     r6,r6,#-1     ; establish the frame pointer
           str     r5,r6,#0      ; r5
           add     r5,r6,#1
           add     r6,r6,#-1     ; space for local variable: current
           add     r6,r6,#-1     ; save caller's registers
           str     r0,r6,#0      ; r0
           add     r6,r6,#-1
           str     r1,r6,#0      ; r1
           add     r6,r6,#-1
           str     r2,r6,#0      ; r2
           add     r6,r6,#-1
           str     r3,r6,#0      ; r3
           add     r6,r6,#-1
           str     r4,r6,#0      ; r4
           add     r6,r6,#-1
           str     r7,r6,#0      ; r7
           
           and     r0,r0,#0      ; product <- 0
           ldr     r1,r5,#1      ; operand 1
           ldr     r2,r5,#2      ; operand 2
           and     r3,r3,#0      ; previous bit <- 0
           and     r4,r4,#0      ; mask <- 1
           add     r4,r4,#1
multLoop
           brz     multExit      ; zero mask -> all bits processed
           and     r7,r1,r4      ; current bit
           str     r7,r5,#-2     ; save local variable
           add     r7,r7,#0      ; test r7 to set condition code bits
           brz     multCur0      ; current bit == 0?
           add     r3,r3,#0      ; no, current bit == 1, test previous bit
           brnp    multNext      ; both bits == 1 -> nothing to do
           add     r7,r2,#0      ; current == 1 and previous == 0
           not     r7,r7         ; compute -operand 2
           add     r7,r7,#1
           add     r0,r0,r7      ; product += -operand 2
           br      multNext
multCur0
           add     r3,r3,#0      ; current bit == 0, test previous bit
           brz     multNext      ; both bits == 0 -> nothing to do
           add     r0,r0,r2      ; product += operand 2
multNext
           ldr     r3,r5,#-2     ; previous <- current
           add     r2,r2,r2      ; shift operand 2 left 1 bit position
           add     r4,r4,r4      ; shift mask left 1 bit position
           br      multLoop
multExit
           str     r0,r5,#0      ; return the product
           ldr     r7,r6,#0      ; restore the caller's registers, r7
           add     r6,r6,#1
           ldr     r4,r6,#0      ; r4
           add     r6,r6,#1
           ldr     r3,r6,#0      ; r3
           add     r6,r6,#1
           ldr     r2,r6,#0      ; r2
           add     r6,r6,#1
           ldr     r1,r6,#0      ; r1
           add     r6,r6,#1
           ldr     r0,r6,#0      ; r0
           add     r6,r6,#1
           add     r6,r6,#1      ; free space for local variable
           ldr     r5,r6,#0      ; r5
           add     r6,r6,#1
           ret
               
         
        ;r6 0 = return value
        ;r6 1= root calue
        ;r6 2= check address
recurse
     add     r6,r6,#-1     ; establish the frame pointer
           str     r5,r6,#0      ; r5
           add     r5,r6,#1
           add     r6,r6,#-1     ; space for local variable: current
           add     r6,r6,#-1     ; save caller's registers
           str     r0,r6,#0      ; r0
           add     r6,r6,#-1
           str     r1,r6,#0      ; r1
           add     r6,r6,#-1
           str     r2,r6,#0      ; r2
           add     r6,r6,#-1
           str     r3,r6,#0      ; r3
           add     r6,r6,#-1
           str     r4,r6,#0      ; r4
           add     r6,r6,#-1
           str     r7,r6,#0      ; r7
           

        
	ldr     r1,r5,#1 
	brnp recursion
	
	
	
	
basecase
    and r3,r3,#0
    str r3,r5,#0
    br exit
	
recursion
	ldr r0,r1,#0
	brz opertor
	;add r0,r0,#-1
	;brz operator
	;add r0,r0,#1
	;add r0,r0,#1
	;brz operator

operand 
    and r3,r3,#0
    add r3,r0,#0
    str r3,r5,#0
    br exit
	
	
	
	
opertor
    ldr r2,r1,#1
    add r6,r6,#-1
    str r2,r6,#0
    add r6,r6,#-1
    jsr  recurse
    and r2,r2,#0
    str r2,r5,#0


    ldr r4,r1,#2
    add r6,r6,#-1
    str r4,r6,#0
    add r6,r6,#-1
    jsr  recurse
    and r4,r4,#0
    str r4,r5,#0
    
    add r0,r0,#0
    brz mutiplie
    add r0,r0,#-1
	brz plus
	add r0,r0,#1
	add r0,r0,#1




minus  
    
    not r4,r4
    add r4,r4,#1
    
    add r3,r2,r4
    str r3,r5,#0
    br exit
    
 mutiplie  
 
    add	r6,r6,#-1       ; push xValue onto the stack
	str	r4,r6,#0
	add	r6,r6,#-1
	str r2,r6,#0
	add	r6,r6,#-1
    
    jsr multiply
    ldr r3,r6,#0
    str r3,r5,#0
    br exit

plus
    add r3,r2,r4
    
    str r3,r5,#0
    br exit
    
    
  
    
    
    
    

	

	 
	
	
    
	
	







exit
    
	ldr     r1,r6,#0        ; r1, restore the caller's registers
	add     r6,r6,#1
	ldr     r2,r6,#0        ; r2
	add     r6,r6,#1
	ldr     r3,r6,#0        ; r3
	add     r6,r6,#1
	ldr     r7,r6,#0        ; r7
	add     r6,r6,#1
	ldr     r5,r6,#0        ; r5
	add     r6,r6,#1
	ret

.end

