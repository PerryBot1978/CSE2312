.global _start
_start:


@ A program that prints "Hello World!"

print:
    mov  r7, #4          @ Setup service call 4 (write)
    mov  r0, #1          @ param 1 - File descriptor 1 = stdout
    ldr  r1, =hello      @ param 2 - address of string to print
    mov  r2, #13         @ param 3 - length of hello world string
    swi  0               @ ask linux to write to stdout


@ Read from input

input:
    mov     r7, #3          @ 3 = read 
    mov     r0, #0          @ 0 = stdin 
    ldr     r1, =buf        @ load buffer address 
    mov     r2, #40         @ 10 max input length 
    svc     0


print_input: 
    mov  r7, #4          @ Setup service call 4 (write)
    mov  r0, #1          @ param 1 - File descriptor 1 = stdout
    ldr  r1, =buf        @ param 2 - address of string to print
    mov  r2, #40         @ param 3 - length of hello world string
    swi  0               @ ask linux to write to stdout


@ Exit from program

end:
    mov  r7, #1          @ Setup service call 1 (exit)
    mov  r0, #0          @ param 1 - 0 = normal exit
    swi  0               @ ask linux to terminate us


.data
    hello: .ascii "Hello World!\n" 
    buf: .space 40

