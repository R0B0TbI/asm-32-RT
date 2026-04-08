%include "st_io.inc"

section .data
    a dd 12, 24, 36, 48, 60, 72

section .text
    global _start

_start:
    GETSIG ecx          

    lea esi, [a + ecx*4]
    mov eax, [esi]
    mov ebx, [esi + 4]

    mov edx, ebx
    sub edx, eax

    PRINT "esi = "
    UNSINT esi
    PUTCHAR 0x0A 

    PRINT "eax = "
    SIGNINT eax
    PUTCHAR 0x0A  

    PRINT "ebx = "
    SIGNINT ebx
    PUTCHAR 0x0A  

    PRINT "edx = "
    SIGNINT edx
    PUTCHAR 0x0A           
    FINISH