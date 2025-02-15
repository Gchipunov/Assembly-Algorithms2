section .text
global _start

_start:
    ; Initialize num1 and num2
    mov eax, 5      ; num1 = 5
    mov ebx, 10     ; num2 = 10

    ; Calculate sum
    add ecx, eax    ; sum = num1
    add ecx, ebx    ; sum += num2

    ; Exit program
    mov eax, 1      ; sys_exit
    xor ebx, ebx     ; return 0
    int 0x80
