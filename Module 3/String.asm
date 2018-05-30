TITLE MASM Simple input output program						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt1 BYTE "Please enter your name",0dh,0ah,0
prompt2 BYTE "Please enter your age",0dh,0ah,0
prompt3 BYTE ", next year you are going to be ",0
prompt4 BYTE " years old",0dh,0ah,0dh,0ah,0

UserName BYTE 20 DUP (?)
age DWORD ?
dataStackUsed = $ - prompt1

.code
main PROC
	CALL Clrscr

	MOV	 EDX, OFFSET prompt1			;Move message to display
	CALL WriteString				;Display message

	MOV EDX, OFFSET UserName		;Prime EDX for response
	MOV ECX, SIZEOF UserName
	CALL ReadString					;Read in the name of the user
	;MOV UserName, OFFSET EDX				;Put the name into the variable

	MOV	 EDX,OFFSET prompt2			;Move message to display
	CALL WriteString				;Display message
	CALL ReadInt					;Read the age
	INC EAX							;Add one to age
	MOV age, EAX

	MOV EDX, OFFSET UserName
	CALL WriteString
	MOV EDX, OFFSET prompt3
	CALL WriteString
	MOV EAX, age
	CALL WriteInt
	MOV EDX, OFFSET prompt4
	CALL WriteString
	CALL DumpRegs
	MOV EAX, dataStackUsed
	CALL WriteInt

	exit
main ENDP

END main