.ORIG X3000
lea R0, msg
trap x22    ; puts
trap x20    ; getc
AND R1, R1, #0
ADD R1, R1, #12

LOOP 

BRZ DONE
trap x21    ; out
ADD R1, R1, #-1
BR LOOP

DONE

HALT

msg .stringz "Enter a char:"
.END