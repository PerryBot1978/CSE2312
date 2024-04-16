.global mathy

.extern printf

mathy:
    mov R2, R1
    mov R1, R0
    ldr R0, =format_me27

    add R3, R1, R2
    bl printf

    mov R4, #'-'
    str R4, [R0, #4]
    sub R3, R1, R2
    bl printf

    mov R4, #'*'
    str R4, [R0, #4]
    mul R3, R1, R2
    bl printf

    // mov R4, #'-'
    // str R4, [R0, #4]
    // udiv R3, R1, R2
    // bl printf


.data
    format_me27: .asciz "%d + %d = %d\n"
