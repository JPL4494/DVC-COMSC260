TITLE Color Matrix						(color.asm)

; Program Description: Assignment 5B Display the Color Matrix
; Author: Josh Long
; Creation Date: 2-26-15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	display BYTE "J",0dh,0ah,0
	back WORD 0
	font WORD 0

.code
main PROC
	CALL Clrscr

	MOV ecx, 16

	CALL DumpRegs

 L1:
	CALL Clrscr

	PUSH ecx

	MOV ecx, 16

	L2:
		MOV eax, DWORD PTR back
		IMUL eax, 16
		ADD eax, DWORD PTR font

		CALL SetTextColor

		CALL Clrscr
	
		MOV edx, OFFSET display
		CALL WriteString

		INC font

		MOV eax, 150
		CALL Delay

		LOOP L2

	MOV font, 0

	INC back

	POP ecx

	LOOP L1

	exit
main ENDP

END main