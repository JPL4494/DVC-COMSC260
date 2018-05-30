TITLE MASM Template						(Arithmetic.asm)

; Program Description: Assignment 4C Implements arithmetic expression
; Author: Josh Long
; Creation Date: 2-24-15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	
	val1	SDWORD	8
	val2	SDWORD	-15
	val3	SDWORD	20

.code
main PROC

	;EAX = -val2 + 7 - val3 + val1

	MOV eax, val2		;EAX = val2							EAX = FFFFFFF1
	NEG eax				;EAX = -val2						EAX = 0000000F

	ADD eax, 7			;EAX = -val2 + 7					EAX = 00000016

	SUB eax, val3		;EAX = -val2 + 7 - val3				EAX = 00000002

	ADD eax, val1		;EAX = -val2 + 7 - val3 + val1		EAX = 0000000A

	CALL DumpRegs




	exit
main ENDP

END main