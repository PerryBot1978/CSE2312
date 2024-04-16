/*
    name: Dillian Botello
*/
.global _start

@ R0: Address of Array
@ R1: Length of Array
@ R2: Number of positives
pos_bytes:
    cmp R1, #0
    bxle LR

    push {R0, R3, LR}

    ldrsb R3, [R0], #1
    cmp R3, #0
    addgt R2, R2, #1

    sub R1, R1, #1
    bl pos_bytes

    pop  {R0, R3, LR}
    bx LR

@ R0: Address of Array
@ R1: Length of Array
@ R2: Number of positives
pos_halfs:
    cmp R1, #0
    bxle LR

    push {R0, R3, LR}

    ldrsh R3, [R0], #1
    cmp R3, #0
    addgt R2, R2, #1

    sub R1, R1, #1
    bl pos_bytes

    pop  {R0, R3, LR}
    bx LR

_start:
    ldr R0, =small
    ldr R1, =size
    ldrb R1, [R1]
    bl pos_bytes
    mov R3, R2

    ldr R0, =half
    ldr R1, =size
    ldrb R1, [R1]
    bl pos_halfs
    
    cmp R3, R2
    movgt R0, #7
    movlt R0, #44
    moveq R0, #123

end:
    mov r7, #1
    swi 0

/* you should not change anything beyond this line
nor should you move the .data section
You WILL need to use the labels given to get the size
of the array and the addresses of the arrays
*/
.data
    size: .byte 5
    small: .byte -3, 18, 5, -21, -7
    half: .hword 25, -260, -6, 300, 55
