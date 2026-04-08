%include "../st_io.inc"

section .data
    expr db "( [ ) ]", 0

section .text
    global _start

_start:
    mov esi, expr      
    
    push ebp            
    mov ebp, esp       

next_char:
    movzx eax, byte [esi]
    test al, al         
    jz check_final

    cmp al, '('
    je do_push
    cmp al, '['
    je do_push
    cmp al, '{'
    je do_push

   
    cmp al, ')'
    je check_round
    cmp al, ']'
    je check_square
    cmp al, '}'
    je check_curly

    jmp skip_char      

do_push:
    push eax           
    jmp skip_char

check_round:
    cmp esp, ebp     
    je is_no
    pop edx           
    cmp dl, '('       
    jne is_no
    jmp skip_char

check_square:
    cmp esp, ebp
    je is_no
    pop edx
    cmp dl, '['
    jne is_no
    jmp skip_char

check_curly:
    cmp esp, ebp
    je is_no
    pop edx
    cmp dl, '{'
    jne is_no
    jmp skip_char

skip_char:
    inc esi            
    jmp next_char

check_final:
    cmp esp, ebp        
    jne is_no          

is_yes:
    PRINT "YES"
    PUTCHAR 0x0A
    jmp exit

is_no:
    PRINT "NO"
    PUTCHAR 0x0A

exit:
    mov esp, ebp        
    pop ebp             
    
    mov eax, 1        
    xor ebx, ebx
    int 0x80