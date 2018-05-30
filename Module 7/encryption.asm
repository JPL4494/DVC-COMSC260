TITLE  Encryption						(encryption.asm)

; Program Description: Assignment 7a Encryption using rotate operators
; Author: Josh Long
; Creation Date: 4-12-45
; Revisions: 1
; Status: DONE

INCLUDE Irvine32.inc
.data
	
	prompt1 BYTE "Enter plain text to encrypt",0dh,0ah,0
	prompt2 BYTE "Encrypted text",0dh,0ah,0
	endl BYTE 0dh,0ah,0

	key SDWORD -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
	keySize = $ - key

	old BYTE 50 DUP(?)
	oldSize DWORD ?
	move BYTE 10 DUP(0)
	done BYTE 50 DUP(?)
	count WORD 0
.code

main PROC

	CALL Clrscr
	
	MOV	 EDX, OFFSET prompt1
	CALL WriteString

	MOV EDX, OFFSET old
	MOV ECX, SIZEOF old
	CALL ReadString
	CALL STRLENGTH
	MOV oldSize, EAX

	MOV ESI, 0

	.WHILE oldSize > 0

		MOV EDI, 0
		.IF oldSize < 10
			MOV ECX, oldSize
			MOV oldSize, 0
		.ELSE
			MOV ECX, 10
			SUB oldSize, 10
		.ENDIF

		MOV EDI, 0
		MOV EDX, ECX
		MOV EBX, ECX
		L1:
			MOV AL, old[ESI]
			MOV move[EDI], al
			INC ESI
			INC EDI
		LOOP L1

		MOV ECX, EDX
		MOV EDI, 0
		L2:
			MOV EDX, ECX

			MOV ECX, [key+EDI]
			MOV AL, move[EDI]
			.IF ECX < 007Fh
				LR:
					ROR AL, 1
				LOOP LR
			.ELSE
				NEG ECX
				LL:
					ROL AL, 1
				LOOP LL
			.ENDIF
			MOV move[EDI], AL
			.IF (count + 1) < keySize
				ADD EDI, TYPE key
				INC count
			.ELSE
				MOV EDI, 0
				MOV count, 0
			.ENDIF

			MOV ECX, EDX
		LOOP L2

		MOV ECX, EBX
		MOV EDI, 0
		LN:
			MOV AL, move[EDI]
			MOV done[EDI], al
			INC EDI
		LOOP LN


		MOV ECX, 10
		MOV EDI, 0
		LC:
			MOV move[EDI], 0
			INC EDI
		LOOP LC
		
	.ENDW

	MOV EDX, OFFSET prompt2
	CALL WriteString
	MOV EDX, OFFSET done
	CALL WriteString
	MOV EDX, OFFSET endl
	CALL WriteString

	exit
main ENDP

END main