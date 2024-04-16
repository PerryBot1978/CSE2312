@ Name: Dillian Botello

.global _start

_start:
    mov R0, #0     @ sum
    mov R1, #0     @ index
    mov R5, #4     @ word size
    
    ldr R2, =size
    ldrb R2, [R2]
    mul R2, R5, R2
    b loop_condition

loop:
    ldr R3, =array
    ldr R3, [R3, R1]

    and R4, R3, #0x1
    cmp R4, #0
    addeq R0, R0, R3

    add R1, R1, R5

loop_condition:
    cmp R1, R2
    blt loop

end:
    mov R7, #1
    swi 0

/*  you should not change anthing beyond this line
    nor should you move the .data section
*/
    .data
size:  .byte 6
array: .word 11, 12, 20, 5, 3, 4
