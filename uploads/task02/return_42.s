section .text
    global _start    

_start:
    ; Exit syscall with status code 42
    mov rax, 60      
    mov rdi, 42       
    syscall           