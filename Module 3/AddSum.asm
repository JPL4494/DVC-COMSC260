TITLE MASM Add and Subtract						(AddSum.asm)

; Program Description: Assignment 3A Adding and subtracting two 32 bit
; Author: Josh Long
; Creation Date: 1/29/15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc

.data
; (insert variables here)

.code

main	PROC

		mov	eax, 10000h	; EAX = 10000h

		add	eax, 40000h	; EAX = 50000h

		sub	eax, 20000h	; EAX = 30000h

		call	DumpRegs	; display registers

		exit

main	ENDP

		END		main