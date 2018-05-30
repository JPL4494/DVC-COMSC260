TITLE Random Screen Locations						(random.asm)

; Program Description: Assignment 5A Display a character in random places
; Author: Josh Long
; Creation Date: 2-26-15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
display BYTE "J",0
xAxis BYTE " ",0
yAxis BYTE 0dh,0ah,0
xMax WORD ?
yMax WORD ?

.code
main PROC
	CALL Clrscr

	CALL GetMaxXY
	MOV xMax, ax
	MOV yMax, dx

	MOV ecx, 100

 L1:
	CALL Clrscr
	
	MOV bl, 0h
	MOVZX eax, bl

	MOV ax, ymax
	CALL RandomRange

	MOV edx, ecx

	MOV ecx, eax

	L2:
		CALL Crlf
		LOOP L2

	MOV bl, 0h
	MOVZX eax, bl

	MOV ax, xmax
	CALL RandomRange

	MOV ecx, eax

	L3:
		MOV edx, OFFSET xAxis
		CALL WriteString
		LOOP L3

	MOV ecx, edx

	MOV edx, OFFSET display
	CALL WriteString

	MOV eax, 100

	CALL Randomize

	CALL Delay
	LOOP L1

	exit
main ENDP

END main