BITS 64

global strpbrk

strpbrk:
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
    jmp .loop

.add_one:
    inc rdi
    xor rcx, rcx
.loop:
    mov r8b, [rdi]
    mov r9b, [rsi + rcx]
    cmp byte [rdi], 0
    je .return_null
    cmp byte [rsi + rcx], 0
    je .add_one
    cmp r8b, r9b
    je .return

    inc rcx
    jmp .loop

.return:
    mov rax, rdi
    ret
.return_null:
    mov rax, 0
    ret