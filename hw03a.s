.global _start

_start:
    mov R0, #0
    mov R1, #5

    cmp R1, #10
    addge R0, R0, #3

    cmp R1, #5
    bne else
if:
    add R0, R0, #20
    bal endif
else:
    add R0, R0, #100
endif:

end:
    mov R7, #1
    swi 0
