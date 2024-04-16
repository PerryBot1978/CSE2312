.global int_mod

int_mod:
    mov R2, R0
    sdiv R2, R2, R1
    mul R2, R1, R2

    sub R0, R2, R0

    cmp R0, #0          @Make sure output positive
    movlt R1, #-1
    mullt R0, R1, R0

    bx LR
    
