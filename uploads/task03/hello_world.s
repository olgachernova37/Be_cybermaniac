; filepath: uploads/task03/hello_world.s
; Program to print "Hello World!" and exit with code 4242
; x86-64 assembly with Intel syntax

bits 64     ; Explicitly specify 64-bit mode

section .data
    ; Define the message string with a newline character
    message db "Hello World!", 10  ; 10 is the ASCII code for newline
    message_length equ $ - message ; Calculate message length

section .text
    global _start     ; Entry point for the linker

_start:
    ; Write message to stdout
    mov rax, 1        ; syscall number for write
    mov rdi, 1        ; file descriptor 1 is stdout
    mov rsi, message  ; pointer to message
    mov rdx, message_length ; message length
    syscall           ; call kernel
    
    ; Exit with status code 4242
    mov rax, 60       ; syscall number for exit
    mov rdi, 4242     ; exit code 4242
    syscall           ; call kernel