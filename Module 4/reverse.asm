TITLE MASM Template						(reverse.asm)

; Program Description: Assignment 4B reversing the order of elements in an array
; Author: Josh Long
; Creation Date: 2-17-15
; Revisions: 0
; Status: DONE

INCLUDE Irvine32.inc
.data
	
	warray DWORD 0,1,2,3,4,5,6,7,8,9,10

.code
main PROC

	MOV esi, OFFSET warray
	MOV edi, OFFSET warray
	MOV ecx, LENGTHOF warray - 1
 
 L1:
	ADD esi, TYPE warray

	LOOP L1

	MOV ecx, LENGTHOF warray / 2

 L2:
	MOV eax, [edi]
	MOV ebx, [esi]
	MOV [edi], ebx
	MOV [esi], eax
	SUB esi, TYPE warray
	ADD edi, TYPE warray

	LOOP L2


	exit
main ENDP

END main