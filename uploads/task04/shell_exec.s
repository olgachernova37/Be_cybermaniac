section .data
    shell_path db "/bin/sh", 0    ; Path to the shell, null-terminated
    args dq shell_path, 0         ; Array of arguments (program name followed by NULL)
    env dq 0                      ; NULL environment pointer

section .text
    global _start

_start:
    ; execve system call
    mov rax, 59                   ; syscall number for execve
    mov rdi, shell_path           ; first argument: path to the executable
    mov rsi, args                 ; second argument: array of arguments
    mov rdx, env                  ; third argument: environment variables
    syscall

    ; If execve returns, it means it failed
    mov rax, 60                   ; syscall number for exit
    mov rdi, 1                    ; exit with error status
    syscall