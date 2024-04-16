/*   put name here
*/
    .global _start

_start:
    mov r0, #0     @ sum


end:
    mov r7, #1
    swi 0


/*  you should not change anthing beyond this line
    nor should you move the .data section
*/
    .data
size:  .byte 6
array: .word 11, 12, 20, 5, 3, 4
