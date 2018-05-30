TITLE Loop Optimization Example

; This program calculates and displays the number of

; elapsed minutes per day, up to n days.

INCLUDE Irvine32.inc

.data

	days DWORD ?

	minutesInDay DWORD ?

	totalMinutes DWORD ?

	str1 BYTE "Daily total minutes: ",0

.code

main PROC

	call Version_1

	call Version_2

	call Version_3

	call Version_4

	exit

main ENDP

;--------------------------

Version_1 PROC

; No optimization

;--------------------------

	pushad

	mov days,0

	mov totalMinutes,0


	L1:	; loop contains 15 instructions

		mov eax,24	; minutesInDay = 24 * 60

		mov ebx,60

		mul ebx

		mov minutesInDay,eax

		mov edx,totalMinutes	; totalMinutes += minutesInDay

		add edx,minutesInDay

		mov totalMinutes,edx


		mov edx,OFFSET str1	; "Daily total minutes: "

		call WriteString

		mov eax,totalMinutes	; display totalMinutes

		call WriteInt

		call Crlf


		inc days	; days++

	cmp days,50	; if days < 50,

	jb L1	; repeat the loop


	popad

	ret

Version_1 ENDP

;--------------------------------------------------------------

Version_2 PROC

; Move invariant calculation of minutesInDay outside the loop.

; Move invariant assignment of EDX outside the loop.

;--------------------------------------------------------------

	pushad


	mov days,0

	mov totalMinutes,0


	mov eax,24	; minutesInDay = 24 * 60

	mov ebx,60

	mul ebx

	mov minutesInDay,eax

	mov edx,OFFSET str1	; "Daily total minutes: "

	L1:	; loop contains 10 instructions

		mov ecx,totalMinutes	; totalMinutes += minutesInDay ;CHANGED EDX TO ECX SINCE EDX HAS STRING OFFSET

		add ecx,minutesInDay	;CHANGED EDX TO ECX SINCE EDX HAS STRING OFFSET

		mov totalMinutes,ecx	;CHANGED EDX TO ECX SINCE EDX HAS STRING OFFSET

		call WriteString	; display str1 (offset in EDX)

		mov eax,totalMinutes	; display totalMinutes

		call WriteInt

		call Crlf

		inc days	; days++

	cmp days,50	; if days < 50,

	jb L1	; repeat the loop


	popad

	ret

Version_2 ENDP

;-------------------------------------------------

Version_3 PROC

; Move totalMinutes to EAX, use EAX throughout loop

; Use constant expresion for minutesInDay calculation

;-------------------------------------------------

	pushad

	C_minutesInDay = 24 * 60	; constant expression

	mov days,0

	mov totalMinutes,0

	mov eax,totalMinutes

	mov edx,OFFSET str1	; "Daily total minutes: "

	L1:	; loop contains 7 instructions

		add eax,C_minutesInDay	; totalMinutes += minutesInDay

		call WriteString	; display str1 (offset in EDX)

		call WriteInt	; display totalMinutes (EAX)

		call Crlf

		inc days	; days++

	cmp days,50	; if days < 50,

	jb L1	; repeat the loop


	mov totalMinutes,eax	; update variable

	popad

	ret

Version_3 ENDP

;-----------------------------------------------------

Version_4 PROC

; Substitute ECX for the days variable.

; Remove initial assignments to days and totalMinutes

;-----------------------------------------------------

	C_minutesInDay = 24 * 60	; constant expression

	pushad


	mov eax,0	; EAX = totalMinutes

	mov ecx,0	; ECX = days

	mov edx,OFFSET str1	; "Daily total minutes: "

	L1:	; loop contains 7 instructions

		add eax,C_minutesInDay	; totalMinutes += minutesInDay


		call WriteString	; display str1 (offset in EDX)

		call WriteInt	; display totalMinutes (EAX)

		call Crlf


		inc ecx	; days (ECX)++

	cmp ecx,50	; if days < 50,

	jb L1	; repeat the loop


	mov totalMinutes,eax	; update variable

	mov days,ecx	; update variable

	popad

	ret

Version_4 ENDP

END main