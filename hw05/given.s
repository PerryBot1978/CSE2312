/*
    name:
*/
.global _start

_start:

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
