;Sum the elements from Data[0] to Data[n-1], where n <32
;Put result in R3

;Register Dictionary
;R1 - address of current array element
;R2 - # of elements left to consider
;R3 - Sum of the array elements
;R4 - holds content of current array element


;initialization
	.orig	x3000
	LEA	R1,Data		;get start addr of array Data
	AND	R3,R3,#0	;zero out result
	LD	R2,n		;get length of array 
	ADD	R2,R2,#-1	;the current index to get
	BRn	done		;if index is <= 0, then we are done
	ADD	R1,R1,R2	;address of current element
sumloop
	LDR	R4,R1,#0	;get array element's content
	ADD	R3,R3,R4	;sum it
	ADD 	R1,R1,#-1	;move to previous array element
	ADD 	R2,R2,#-1	;decrease # of elements left to consider
	BRzp	sumloop

done
	halt

Data	.fill	#1		;hardcoded data values 1,2,3,...,10
	.fill	#2		;for the array Data
	.fill	#3
	.fill	#4
	.fill	#5
	.fill	#6
	.fill	#7
	.fill	#8
	.fill	#9
	.fill	#10

n	.fill	#10		;# of elements in array

	.end
	