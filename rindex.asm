BITS 64

global rindex

rindex:
    xor rcx, rcx

.to_end_loop:
    cmp byte [rdi + rcx], 0
    je .find_occur
    
    inc rcx
    jmp .to_end_loop
.find_occur:
    cmp [rdi + rcx], sil
    je .return
    cmp rcx, 0
    je .return_null

    dec rcx
    jmp .find_occur
.return_null:
    mov rax, 0
    ret

.return:
    add rdi, rcx
    mov rax, rdi
    ret