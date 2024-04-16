.global _start

_start:
    mov R1, #34
    mov R2, #-17

    and R2, R1, R2
    lsr R2, R2, #3
    
    orr R0, R1, R2
    lsl R0, R0, #2

end:
    mov R7, #1
    swi 0
