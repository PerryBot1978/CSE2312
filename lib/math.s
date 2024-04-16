.global factorial 
.global fibonocci
.global nPr
.global nCr
.global int_mod
.global float_add

@ Inputs:
@   R0 - n
@ Output:
@   R0 - n!
@ Error:
@   If theres an overflow, returns -1
factorial:
    mov R1, R0
    mov R0, #1
    
factorial_loop_comdition:
    cmp R1, #1
    bxle LR

factorial_loop_body:
    mov R2, R0

    mul R0, R1, R0
    sub R1, R1, #1
    
    cmp R0, R2
    movlt R0, #-1
    bxlt LR
    
    bal factorial_loop_comdition

@ Input:
@   R0: n
@ Output:
@   fib(n)
fibonocci:
    push {R4, R5}
    mov R1, #0
    mov R2, #1
    mov R3, #1

fibonocci_condition:
    cmp R1, R0
    bge fibonocci_end

fibonocci_loop:
    mov R4, R2
    mov R2, R3
    add R5, R3, R4

    cmp R4, R5
    movgt R0, #-1 
    bxgt  LR

    mov R3, R5
    add R1, R1, #1
    b fibonocci_condition

fibonocci_end:
    pop  {R4, R5}
    mov R0, R2
    bx LR

@ R0: n
@ R1: r
@ R2: nCr
nCr:
    push {R0, R1, R3, LR}
    
    push {R0, R1}
    mov R0, R1
    bl factorial
    mov R3, R1
    pop  {R0, R1}

    bl nPr
    udiv R2, R2, R3

    pop  {R0, R1, R3, LR}
    bx LR

@ R0: n
@ R1: r
@ R2: nPr
nPr:
    push {R0, R1, R3, R4, LR}

    push {R0, R1}
    bl factorial
    mov R3, R1
    pop  {R0, R1}

    push {R0, R1}
    sub R0, R0, R1
    bl factorial
    mov R4, R1
    pop  {R0, R1}

    udiv R2, R3, R4
    pop  {R0, R1, R3, R4, LR}
    bx LR

@ R0 : num1
@ R1 : num2
@ R0 : num1 % num2
int_mod:
    mov R2, R0
    sdiv R2, R2, R1
    mul R2, R1, R2

    sub R0, R2, R0

    cmp R0, #0          @Make sure output positive
    movlt R1, #-1
    mullt R0, R1, R0

    bx LR

@ R0 : num1
@ R1 : num2
@ R0 : num1 + num2
float_add:
    vmov S0, R0
    vmov S1, R1

    vadd.f32 S2, S0, S1
    vmov R0, S2

    bx LR

