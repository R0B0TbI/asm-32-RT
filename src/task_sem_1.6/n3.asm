global _start

section .data
    st db "Hello Nasm!", 0xa, 0
    ls EQU $ -st

section .text
    _start:
        mov eax, 4
        mov ebx, 2
        mov ecx, st
        mov edx, ls
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80



