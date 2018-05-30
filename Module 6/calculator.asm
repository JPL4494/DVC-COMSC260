TITLE Boolean Calculator						(calculator.asm)

; Program Description: Assignment 6 Create a calculator using boolean
; Author: Josh Long
; Creation Date: 3-12-45
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	prompt1 BYTE "Select one of the options below to calculate 32bit integers",0dh,0ah,0
	prompt2 BYTE "1: x AND y",0dh,0ah,0
	prompt3 BYTE "2: x OR y",0dh,0ah,0
	prompt4 BYTE "3: NOT x",0dh,0ah,0
	prompt5 BYTE "4: x XOR y",0dh,0ah,0
	promptE BYTE "5: Exit",0dh,0ah,0
	promptC BYTE "Press enter to continue",0dh,0ah,0
	promptD BYTE "Now exiting, goodbye",0dh,0ah,0

	x DWORD ?
	y DWORD ?
	pick DWORD ?

	p1 BYTE "AND function, enter first integer hit enter then second and hit enter",0dh,0ah,0
	p2 BYTE "OR function, enter first integer hit enter then second and hit enter",0dh,0ah,0
	p3 BYTE "NOT function, enter the integer to find the ~X version",0dh,0ah,0
	p4 BYTE "XOR function, enter first integer hit enter then second and hit enter",0dh,0ah,0

.code
main PROC
	MOV pick, 0

	MOV EDX, OFFSET prompt1
	CALL WriteString

	MOV EDX, OFFSET prompt2
	CALL WriteString

	MOV EDX, OFFSET prompt3
	CALL WriteString

	MOV EDX, OFFSET prompt4
	CALL WriteString

	MOV EDX, OFFSET prompt5
	CALL WriteString

	MOV	EDX, OFFSET prompte
	CALL WriteString

	CALL ReadInt
	MOV pick, EAX

	.REPEAT

	CALL Crlf

	.IF pick == 1
		CALL AND_op
	.ENDIF

	.IF pick == 2
		CALL OR_op
	.ENDIF

	.IF pick == 3
		CALL NOT_op
	.ENDIF

	.IF pick == 4
		CALL XOR_op
	.ENDIF

	CALL Crlf

	CALL WriteBin

	CALL Crlf
	CALL Crlf

	MOV EDX, OFFSET promptC
	CALL WriteString

	CALL ReadInt

	call Clrscr

	MOV EDX, OFFSET prompt1
	CALL WriteString

	MOV EDX, OFFSET prompt2
	CALL WriteString

	MOV EDX, OFFSET prompt3
	CALL WriteString

	MOV EDX, OFFSET prompt4
	CALL WriteString

	MOV EDX, OFFSET prompt5
	CALL WriteString

	MOV	EDX, OFFSET promptE
	CALL WriteString

	CALL ReadInt
	MOV pick, EAX

	.UNTIL pick >= 5

	CALL Crlf
	CALL Crlf

	MOV EDX, OFFSET promptD
	CALL WriteString

	exit

;--------------------------------------------------------------------------
;	AND-op:		Uses the AND operator on two integers
;	Recieves:	Nothing
;	Returns:	EAX with the answer to the function
;--------------------------------------------------------------------------
AND_op PROC
	MOV EDX, OFFSET p1
	CALL WriteString

	CALL ReadInt
	MOV EBX, EAX
	CALL ReadInt

	AND EAX, EBX

	ret
AND_op ENDP

;--------------------------------------------------------------------------
;	OR-op:		Uses the OR operator on two integers
;	Recieves:	Nothing
;	Returns:	EAX with the answer to the function
;--------------------------------------------------------------------------
OR_op PROC
	MOV EDX, OFFSET p2
	CALL WriteString

	CALL ReadInt
	MOV EBX, EAX
	CALL ReadInt

	OR EAX, EBX

	ret
OR_op ENDP

;--------------------------------------------------------------------------
;	NOT-op:		Uses the NOT operator an integer
;	Recieves:	Nothing
;	Returns:	EAX with the answer to the function
;--------------------------------------------------------------------------
NOT_op PROC
	MOV EDX, OFFSET p3
	CALL WriteString

	CALL ReadInt
	NOT EAX

	ret
NOT_op ENDP

;--------------------------------------------------------------------------
;	XOR-op:		Uses the XOR operator on two integers
;	Recieves:	Nothing
;	Returns:	EAX with the answer to the function
;--------------------------------------------------------------------------
XOR_op PROC
	MOV EDX, OFFSET p4
	CALL WriteString

	CALL ReadInt
	MOV EBX, EAX
	CALL ReadInt

	XOR EAX, EBX

	ret
XOR_op ENDP

main ENDP

END main