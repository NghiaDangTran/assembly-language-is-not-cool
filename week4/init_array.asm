;This example initializes an array to a value stored in R3 (zero in this case)

;Register Dictionary
;R1 - address of current array element
;R2 - # of elements left to consider
;R3 - value to initialize array elements to.


;initialization
	.orig	x3000
	LEA	R1,Data		;get start addr of array Data
	AND	R3,R3,#0	;value to initialize array to (ZERO in this case)
	LD	R2,n		;get length of array 
	ADD	R2,R2,#-1	;the current index to get
	BRn	done		;if index is <= 0, then we are done
	ADD	R1,R1,R2	;address of current element
initloop
	STR	R3,R1,#0	;get array element's content
	ADD 	R1,R1,#-1	;move to previous array element
	ADD 	R2,R2,#-1	;decrease # of elements left to consider
	BRzp	initloop

done
	halt

Data	.fill	#3		;put some "random" values into array initially
	.fill	#5		;for the array Data
	.fill	#10
	.fill	#1
	.fill	#12
	.fill	#55
	.fill	#70
	.fill	#81
	.fill	#99
	.fill	#100

n	.fill	#10		;# of elements in array

	.end
	