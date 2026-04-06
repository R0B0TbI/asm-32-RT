%include "st_io.inc"

global _start

section .text
_start:
    xor ecx, ecx

    mov eax, 5684
    mov ebx, 4
    xor edx, edx
    div ebx        

    add ecx, eax     

    mov eax, 357
    mov ebx, 3
    xor edx, edx  
    div ebx

    add ecx, eax

    mov eax, 245
    xor edx, edx
    mov ebx, 5
    div ebx
    
    add ecx, eax

    mov eax, ecx      
    mov ebx, 3       
    mul ebx

    mov ecx, eax 

    PRINT "Result: "
    SIGNINT ecx 
    PUTCHAR 0x0A

    FINISH