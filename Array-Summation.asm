section .data
array db 1, 2, 3, 4, 5
length equ $-array

section .text
global _start

_start:
    ; Initialize sum
    mov ecx, 0      ; sum = 0

    ; Initialize index
    mov ebx, 0      ; index = 0

loop_start:
    ; Check if index is within bounds
    cmp ebx, length
    jge loop_end

    ; Add array element to sum
    add cl, [array + ebx]

    ; Increment index
    inc ebx

    ; Repeat loop
    jmp loop_start

loop_end:
    ; Exit program
    mov eax, 1      ; sys_exit
    xor ebx, ebx     ; return 0
    int 0x80
