; Example of Hello world for LC-3
; Prints Hello World.
; Save as HelloWorld.asm

            .orig   x3000       ; the following instructions start at addr 0x3000
            lea     r0,mesg     ; load addr of mesg into register r0
            trap    x22         ; print string pointer to by r0
            and     r0,r0,x0
            halt                ; halt the program
mesg        .stringz  "Hello world.\n"
            .end