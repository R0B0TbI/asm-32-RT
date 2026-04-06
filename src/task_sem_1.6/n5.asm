section .data
    A db '1', '2', '3', 10
    len equ $ - A
    
section .text
    global _start

_start:
    mov al, [A] 

    mov bl, [A+1]
    mov [A], bl

    mov bl, [A+2]
    mov [A+1], bl

    mov [A+2], al
    
    mov eax, 4       
    mov ebx, 1         
    mov ecx, A         
    mov edx, len       
    int 0x80

    mov eax, 1    
    mov ebx, 0
    int 0x80