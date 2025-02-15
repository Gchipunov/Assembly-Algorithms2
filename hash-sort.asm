section .text
global _start

_start:
    ; Initialize hash table index
    mov ecx, 0

hash_loop:
    ; Calculate hash value
    mov eax, [array + ecx*2]
    xor edx, edx
    mov ebx, 10
    div ebx
    mov ebx, edx

    ; Store element in hash table
    mov [hash_table + ebx*2], eax

    ; Increment index
    inc ecx
    cmp ecx, length
    jl hash_loop

    ; Sort hash table
    mov ecx, 0
sort_loop:
    ; Find minimum element in unsorted part of hash table
    mov eax, [hash_table + ecx*2]
    mov ebx, ecx
min_loop:
    inc ebx
    cmp ebx, 10
    jge min_found
    mov edx, [hash_table + ebx*2]
    cmp edx, eax
    jge min_loop
    mov eax, edx
    mov ebx, ecx
    jmp min_loop

min_found:
    ; Swap minimum element with first element of unsorted part
    xchg eax, [hash_table + ecx*2]
    mov [hash_table + ebx*2], eax

    ; Increment index
    inc ecx
    cmp ecx, 10
    jl sort_loop

    ; Exit program
    mov eax, 1      ; sys_exit
    xor ebx, ebx     ; return 0
    int 0x80
