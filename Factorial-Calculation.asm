section .text
global _start

_start:
    ; Initialize num
    mov eax, 5      ; num = 5

    ; Initialize fact
    mov ebx, 1      ; fact = 1

    ; Calculate factorial
loop_start:
    cmp eax, 0      ; if num == 0
    je loop_end    ;   exit loop
    imul ebx, eax  ; fact *= num
    dec eax         ; num--
    jmp loop_start  ; repeat loop

loop_end:
    ; Exit program
    mov eax, 1      ; sys_exit
    xor ecx, ecx     ; return 0
    int 0x80
