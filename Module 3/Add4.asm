TITLE MASM Adding 4 32-Bit Integer Variables						(Add4.asm)

; Program Description: Assignment 3B Adding 4 32-Bit Integer Variables
; Author: Josh Long
; Creation Date: 1/29/15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc

.data
; (insert variables here)
		val1 DWORD 11001h
		val2 DWORD 22002h
		val3 DWORD 33003h
		val4 DWORD 10000h
		result DWORD ?

.code

main	PROC

		mov	eax, val1	; EAX = 11001h

		add	eax, val2	; EAX = 33003h

		add	eax, val3	; EAX = 66006h

		add	eax, val4	; EAX = 76006h

		mov result, eax		; Store the answer in result

		call	WriteInt

		call	DumpRegs	; display registers

		exit

main	ENDP

		END		main