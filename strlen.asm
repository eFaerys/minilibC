BITS 64

global strlen
strlen:
    mov ecx, 0
loop:
    cmp byte [rdi], 0
    je return
    inc ecx
    inc rdi
    jmp loop

return:
    mov eax, ecx
    ret