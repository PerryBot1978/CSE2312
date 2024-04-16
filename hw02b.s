.global _start

_start:
    mov R1, #3
    mov R2, #4
    mov R3, #5
    mov R4, #2

    mul R5, R1, R3
    mul R6, R2, R4

    sub R0, R5, R6
end:
    mov R7, #1
    swi 0
