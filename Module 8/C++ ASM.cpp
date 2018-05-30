/// main.cpp - Bubble Sort

#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

void ASMBubbleSort(long*, long);

int main()
{
	/// Fill an array with pseudorandom integers.
	const unsigned ARRAY_SIZE = 100000;
	long array[ARRAY_SIZE];
	for(unsigned i = 0; i < ARRAY_SIZE; i++)
     array[i] = rand();

	time_t startTime;
	time_t endTime;

    /// Test the C++ function:

	cout << "Running C++ version of bubble sort...." << endl;

	time( &startTime );

	for(int i = 0; i < ARRAY_SIZE; i++)
    {
        for(int j = i + 1; j < ARRAY_SIZE; j++)
        {
            if(array[i] > array[j])
            {
                long temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }

	time( &endTime );
	cout << "Elapsed CPP time: " << long(endTime - startTime)
		<< " seconds" << endl;

    /// Test the Assembly language version:
	cout << endl << endl;

	cout << "Running ASM version of bubble sort...." << endl;

	time( &startTime );

	long* arrayPtr = array;
	ASMBubbleSort(arrayPtr, ARRAY_SIZE);

	time( &endTime );
	cout << "Elapsed ASM time: " << long(endTime - startTime)
		<< " seconds" << endl;

	cout << endl << "Press enter to end" << endl;
	cin.ignore();
}

void ASMBubbleSort(long* arrayPtr, long arraySize)
{
    __asm
    {
		MOV ESI, arrayPtr
		MOV EBX, arraySize

        MOV EAX, ESI						; set EAX=ESI
		MOV ECX, EBX						; set ECX=EBX
		DEC ECX								; set ECX=CX-1

		OUTER_LOOP:							; loop label
			MOV EBX, ECX					; set EBX=ECX

			MOV ESI, EAX					; set ESI=EAX
			MOV EDI, EAX					; set EDI=EAX
			INC EDI							; set EDI=EDI+1

			INNER_LOOP:						; loop label 
				MOV EDX, [ESI]              ; set EDX=[ESI]

				CMP EDX, [EDI]              ; compare EDX with [EDI]
				JNG SKIP_EXCHANGE			; jump to label @SKIP_EXCHANGE if EDX<[EDI]

				XCHG EDX, [EDI]             ; set EDX=[EDI], [EDI]=EDX
				MOV [ESI], EDX              ; set [ESI]=EDX

				SKIP_EXCHANGE:				; jump label
				INC ESI                     ; set ESI=ESI+1
				INC EDI                     ; set EDI=EDI+1

				DEC EBX                     ; set EBX=EBX-1
			JNZ INNER_LOOP					; jump to label @INNER_LOOP if EBX!=0
		LOOP OUTER_LOOP						; jump to label @OUTER_LOOP while ECX!=0
    };
}
