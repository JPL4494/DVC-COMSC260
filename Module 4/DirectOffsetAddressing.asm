TITLE MASM Moving parts of an array using DOA					(main.asm)

; Program Description: Assignment 4A moving parts of an array
; Author: Josh Long
; Creation Date: 2-12-15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	
	Uarray WORD 1000h, 2000h, 3000h, 4000h

	Sarray SWORD -1, -2, -3, -4

	zero WORD 0h

	endl BYTE 0dh,0ah,0

.code
main PROC

	MOVZX EAX, zero
	MOVZX EBX, zero
	MOVZX ECX, zero
	MOVZX EDX, zero

	MOV AX, Uarray

	MOV BX, [Uarray + 2]

	MOV CX, [Uarray + 4]

	MOV DX, [Uarray + 6]

	CALL DumpRegs

	MOV EDX, OFFSET endl
	CALL WriteString
	CALL WriteString

	MOV EAX, 0
	MOV EBX, 0
	MOV ECX, 0
	MOV EDX, 0

	SUB EAX, 1
	SUB EBX, 1
	SUB ECX, 1
	SUB EDX, 1

	MOV AX, Sarray

	MOV BX, [Sarray + 2]

	MOV CX, [Sarray + 4]

	MOV DX, [Sarray + 6]

	CALL DumpRegs

	exit
main ENDP

END main