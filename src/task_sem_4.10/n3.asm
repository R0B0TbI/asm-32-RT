%include "st_io.inc"

section .text
    global _start

_start:
    mov al, 1
    mov cl, 1
    mov bl, 1
    mov bh, 1

db:
    add cl, 1
    mul cl
    jc print_db
    mov bl, cl
    mov bh, al
    jmp db 

print_db:
    PRINT "db(8 bit): N = "
    movzx eax, bl
    UNSINT eax
    PRINT "; N! = "
    movzx eax, bh 
    UNSINT eax
    PUTCHAR 0x0A

    mov ax, 1
    mov cx, 1 
    mov bx, 1
    mov si, 1

dw:
    add cx, 1
    mul cx 
    jc print_dw 
    mov bx, cx
    mov si, ax
    jmp dw

print_dw:
    PRINT "dw(16 bit): N = "
    movzx eax, bx   
    UNSINT eax
    PRINT "; N! = "
    movzx eax, si   
    UNSINT eax
    PUTCHAR 0x0A

    mov eax, 1
    mov ecx, 1      
    mov ebx, 1
    mov esi, 1
dd:
    inc ecx
    mul ecx
    jc print_dd   
    mov ebx, ecx   
    mov esi, eax    
    jmp dd

print_dd:
    PRINT "dd(32 bit): N = "
    mov eax, ebx    
    UNSINT eax
    PRINT "; N! = "
    mov eax, esi    
    UNSINT eax
    PUTCHAR 0x0A

    FINISH