/*
    name
*/

    .global swap
    .global runningSum

/*  R0 = address of first string
    R1 = address of second string
*/
swap:
    //push {r4-r5}         @ change to registers that you use beyond R0-R3



end1:
    //pop {r4-r5}          @ same values as pushed
    bx lr


/*  R0 = address of array of 16-bit signed integers
    R1 = length of array
*/
runningSum:
    //push {r4}        @ change to register(s) used

end2:
    //pop {r4}         @ change to registers pushed
    bx lr

