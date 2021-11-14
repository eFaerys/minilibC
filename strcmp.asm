BITS 64

global strcmp

strcmp:
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
.loop:
    cmp byte [rdi + rcx], 0
    je .ret
    cmp byte [rsi + rcx], 0
    je .ret
    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rcx]
    cmp r8b, r9b
    jne .ret

    inc rcx
    jmp .loop

.ret:
    sub r8b, r9b
    movsx rax, r8b
    ret