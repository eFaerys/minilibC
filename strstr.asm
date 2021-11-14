BITS 64

global strstr

strstr:
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
    jmp .loop

.add_one:
    inc rdi
.loop:
    cmp byte [rdi], 0
    je .return_null
    mov r8b, [rdi]
    mov r9b, [rsi]
    cmp r8b, r9b
    je .find_occur

    inc rdi
    jmp .loop
.find_occur:
    cmp byte [rsi + rcx], 0
    je .return
    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rcx]
    cmp r8b, r9b
    jne .add_one

    inc rcx
    jmp .find_occur

.return_null:
    mov rax, 0
    ret
.return:
    mov rax, rdi
    ret