/*
    name: Dillian Botello
*/

    .global swap
    .global runningSum

/*  R0 = address of first string
    R1 = address of second string
*/
swap:
    push {r4-r5}       
    
swap_condition:
    ldrb R2, [R0]
    cmp R2, #0
    beq end1        @If null, exit

swap_loop:
    mov R3, #0      @Will hold value of two comparisons

    cmp R2, #'a'
    addge R3, R3, #1

    cmp R2, #'z'
    addle R3, R3, #1

    cmp R3, #2      @If R2 >= 'a' && R2 <= 'z', swap R0 and R1

    ldreqb R4, [R0]
    ldreqb R5, [R1]

    streqb R5, [R0]
    streqb R4, [R1]

    add R0, R0, #1
    add R1, R1, #1  @Post increment didn't seem to be working

    b swap_condition

end1:
    pop {r4-r5}          
    bx lr


/*  R0 = address of array of 16-bit signed integers
    R1 = length of array
*/
runningSum:
    push {r4-r5}      
    mov R2, #0  @Running Sum
    mov R4, #0  @Index

sum_condition:
    cmp R4, R1
    bge end2    @If R4 >= R1, exit

sum_loop:
    ldrsh R3, [R0]
    add R2, R2, R3

    strh R2, [R0], #2
    add R4, R4, #1

    b sum_condition

end2:
    pop {r4-r5}         
    bx lr

