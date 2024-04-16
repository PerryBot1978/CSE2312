.global _start

_start:
    mov R0, #0  
    mov R1, #1  @ R1 = pow2
    mov R2, #1  @ R2 = i
    mov R3, #2  @ const R3 = 2
    
for_condition:
    cmp R2, #8
    bgt end_for

for:
    add R0, R0, R1
    mul R1, R3, R1

    add R2, R2, #1
    bal for_condition

end_for:

end:
    mov R7, #1
    swi 0
