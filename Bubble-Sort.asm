section .data
array db 5, 2, 8, 1, 9
length equ $-array

section .text
global _start

_start:
    ; Initialize outer loop counter
    mov ecx, length
    dec ecx             ; length - 1

outer_loop:
    ; Initialize inner loop counter
    mov ebx, length
    dec ebx             ; length - 1

inner_loop:
    ; Compare adjacent elements
    mov al, [array + ebx - 1]
    cmp al, [array + ebx]
    jle skip_swap       ; if array[i-1] <= array[i], skip swap

    ; Swap adjacent elements
    xchg al, [array + ebx]
    mov [array + ebx - 1], al

skip_swap:
    ; Decrement inner loop counter
    dec ebx
    jnz inner_loop       ; repeat inner loop if ebx != 0

    ; Decrement outer loop counter
    dec ecx
    jnz outer_loop       ; repeat outer loop if ecx != 0

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx         ; return 0
    int 0x80
