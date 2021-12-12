call exec
db '/var/northpolesecrets.txt',0
exec:
pop rdi
mov rax, 2
mov rdx, 0
mov rsi, 0
syscall

mov rdi, rax
mov rsi, rsp
mov rdx, 200
xor rax, rax
syscall

mov rdx, rax
mov rsi, rsp
mov rdi, 1
mov rax, 1
syscall

mov rax, 60
mov rdi, 0
syscall
