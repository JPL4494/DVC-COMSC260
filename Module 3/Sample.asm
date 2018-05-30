TITLE MASM Sample array program						(Sample.asm)

; Program Description: In class program
; Author: Josh Long
; Creation Date: 2/3/15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc

.data
; (insert variables here)
		myArray WORD 10,20,30,40,50
		newLine BYTE 0dh, 0ah, 0h

.code

main	PROC

		mov eax,0
		mov edx, OFFSET newLine		;Setup to write the newLine
		mov ax, myArray[0]			;Move 1st element to ax
		call WriteInt				;Write the 1st elemtent
		call WriteString			;Write the newLine
		mov ax, myArray[2]			;Simply repeat the above lines
		call WriteInt
		call WriteString
		mov ax, myArray[4]
		call WriteInt
		call WriteString
		mov ax, myArray[6]
		call WriteInt
		call WriteString
		mov ax, myArray[8]
		call WriteInt
		call WriteString


		exit

main	ENDP

		END		main