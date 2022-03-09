;This example implements a simple do-while loop

            .orig  x3000
            trap   x20         ;read char into r0
	
            and    R1,R1,#0
            add    R1,R1,#5    ;loop 5 times
	
            ;notice no test is done before entering the loop 
loop
            trap   x21         ;print character in r0
            add    R1,R1,#-1
            brp    loop
done                           ;end of while loop
            halt
            .end