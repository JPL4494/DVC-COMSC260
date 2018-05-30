TITLE  GCD						(gcd.asm)

; Program Description: Assignment 7b GCD finder
; Author: Josh Long
; Creation Date: 4-12-45
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	
	prompt1 BYTE "GCD of ",0
	prompt2 BYTE " and ",0
	prompt3 BYTE " is ",0
	endl BYTE 0dh,0ah,0

	num1 DWORD ?
	num2 DWORD ?
	answer DWORD ?

.code

main PROC

	CALL Clrscr
	
	MOV num1, 20
	MOV num2, 10

	CALL GCD_op

	MOV answer, EAX

	MOV EDX, OFFSET prompt1
	CALL WRITESTRING
	MOV EAX, num1
	CALL WRITEINT
	MOV EDX, OFFSET prompt2
	CALL WRITESTRING
	MOV EAX, num2
	CALL WRITEINT
	MOV EDX, OFFSET prompt3
	CALL WRITESTRING
	MOV EAX, answer
	CALL WRITEINT
	MOV EDX, OFFSET endl
	CALL WRITESTRING

	MOV num1, 42d
	MOV num2, 7d

	CALL GCD_op

	MOV answer, EAX

	MOV EDX, OFFSET prompt1
	CALL WRITESTRING
	MOV EAX, num1
	CALL WRITEINT
	MOV EDX, OFFSET prompt2
	CALL WRITESTRING
	MOV EAX, num2
	CALL WRITEINT
	MOV EDX, OFFSET prompt3
	CALL WRITESTRING
	MOV EAX, answer
	CALL WRITEINT
	MOV EDX, OFFSET endl
	CALL WRITESTRING

	MOV num1, 121d
	MOV num2, 33d

	CALL GCD_op

	MOV answer, EAX

	MOV EDX, OFFSET prompt1
	CALL WRITESTRING
	MOV EAX, num1
	CALL WRITEINT
	MOV EDX, OFFSET prompt2
	CALL WRITESTRING
	MOV EAX, num2
	CALL WRITEINT
	MOV EDX, OFFSET prompt3
	CALL WRITESTRING
	MOV EAX, answer
	CALL WRITEINT
	MOV EDX, OFFSET endl
	CALL WRITESTRING


	exit

;--------------------------------------------------------------------------
;	GCD-op:		Finds the GCD of 2 numbers
;	Recieves:	2 numbers, num1 and num2
;	Returns:	EAX with the answer to the function
;--------------------------------------------------------------------------
GCD_op PROC

	MOV EAX, num1
	MOV EBX, num2
	MOV EDX, 0

	.IF EAX < EBX
		XCHG EAX, EBX
	.ENDIF

	CWD

	.REPEAT
		DIV EBX

		CWD
		
		MOV EAX, EBX
		MOV EBX, EDX

		.IF EAX < EBX
			XCHG EAX, EBX
		.ENDIF

	.UNTIL EDX == 0

	ret
GCD_op ENDP

main ENDP

END main