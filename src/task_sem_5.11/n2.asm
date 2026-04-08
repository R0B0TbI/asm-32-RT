%include "st_io.inc"

section .data
    arr dd 1, 2, 3, 4, 5, -1, 2, -3, 4, -7, 67, 32, -78, 14, 11, 7, 6, -5, 4, 0, 45, 23, -89, 234, 1, 2, 3 ; -sum = -94 , max/min = 67/-78, c = 19

section .bss
    max resd 1
    min resd 1
    count resd 1
    neg_sum resd 1

section .text
    global _start

_start:
    mov dword[max], 0x80000000
    mov dword[min], 0x7FFFFFFF
    mov dword[count], 0
    mov dword[neg_sum], 0

    mov eax, 0
    mov ebx, [arr]
    mov ecx, 1000
l:
    cmp ebx, [max]
    jl if_nmax 
        mov [max], ebx
if_nmax:

    cmp ebx, [min]
    jg if_nmin 
        mov [min], ebx
if_nmin:

    cmp ebx, 0
    jge if_nnegativ
        add [neg_sum], ebx
if_nnegativ:

    add dword[count], 1

    add eax, 1
    mov ebx, [arr + eax*4]

    cmp ebx, 0
    loopne l

    PRINT "min / max  "
    SIGNINT [min]
    PRINT " / "
    SIGNINT [max]
    PUTCHAR 0x0A

    PRINT "sum(< 0) : "
    SIGNINT [neg_sum]
   
    PRINT " | count = : "
    SIGNINT [count]
    PUTCHAR 0x0A
    
    FINISH
