%include "../st_io.inc"

section .bss
    a resd 5
    min resd 1

section .text
    global _start

_start:
    call input_loop

    mov edx, [a]
    mov dword [min], edx

    pushad
    push a
    push 5
    call min_el
    popad

    SIGNINT [min]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80



min_el:
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 8]
    xor esi, esi

.search:
    mov ebx, [ebp + 12]
    mov eax, [ebx + esi * 4]
    cmp eax, [min]

    jge .skip      

    mov [min], eax

.skip:
    inc esi
    loop .search

    mov esp, ebp
    pop ebp

    ret 8


input_loop:
    mov ecx, 5
    xor esi, esi

.loop_start:
    sub ecx, 1
    GETSIG [a + esi * 4]

    inc esi
    cmp ecx, 0
    jnz .loop_start

    ret