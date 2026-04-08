%include "st_io.inc"

section .data
    arr dd 1, 2, 3, 4, 5, -1, 2, -3, 4, -7, 67, 32, -78, 14, 11, 7, 6, -5, 4, 0
    len equ ($ - arr) / 4

section .bss
    max resd 1
    min resd 1
    count resd 1
    neg_sum resd 1

section .text
    global _start

_start:
    mov dword[max], 0
    mov dword[min], 0

    mov eax, 0
    mov ecx, 20
l:
    mov ebx, [arr + eax*4]

    mov edx, [max]
    cmp ebx, [arr + edx*4]
    jl if_nmax 
        mov [max], eax
if_nmax:

    mov edx, [min]
    cmp ebx, [arr + edx*4]
    jg if_nmin 
        mov [min], eax
if_nmin:

    add eax, 1
    loop l

    mov eax, [max]
    mov ebx, [min]
    mov ecx, [arr + eax*4]
    mov edx, [arr + ebx*4]
    mov [arr + eax*4], edx
    mov [arr + ebx*4], ecx


    mov ecx, 0
print:
    mov eax, [arr + ecx*4]
    SIGNINT eax
    PUTCHAR ' '

    add ecx, 1
    cmp ecx, len
    je break
    jmp print

break:
    PUTCHAR 0x0A
    FINISH
