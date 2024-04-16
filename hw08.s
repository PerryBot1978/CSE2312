@ Name: Dillian Botello

.global calcClassAvg

@ float calcClassAvg(struct scores [], int32_t n);
calcClassAvg:
    vmov S1, R1
    vcvt.f32.s32 S1, S1

    mov R2, #0
    vmov S2, R2
    vcvt.f32.s32 S2, S2

    mov R3, #0

calcClassAvg_condition:
    cmp R3, R1
    bge calcClassAvg_return

calcClassAvg_loop:
    mov R5, LR
    vpush {S1-S2}
    bl studentAverage
    vpop  {S1-S2}
    mov LR, R5

    vadd.f32 S2, S2, S0
    add R0, R0, #32
    add R3, R3, #1
    b calcClassAvg_condition

calcClassAvg_return:
    vmov S1, R1
    vcvt.f32.s32 S1, S1
    vdiv.f32 S0, S2, S1

    vmov R0, S0
    bx LR

@ float studentAverage(struct score*)
@ .2 * hw + .3 * e1 + .3 * e2 + .2 * final
studentAverage:
    push {R6}
    mov R6, R0

    add R6, R6, #16
    vldr S0, [R6]           @ S0 = hw

    add R6, R6, #4
    vldr S1, [R6]
    vcvt.f32.s32 S1, S1     @ S1 = exam1

    add R6, R6, #4
    vldr S2, [R6]
    vcvt.f32.s32 S2, S2     @ S2 = exam2

    add R6, R6, #4
    vldr S3, [R6]
    vcvt.f32.s32 S3, S3     @ S3 = final

    ldr R6, =point_two
    vldr S4, [R6]           @ S4 = .2

    ldr R6, =point_three
    vldr S5, [R6]           @ S5 = .3

    vmul.f32 S0, S4, S0     @ S0 = S0 * .2

    vmul.f32 S1, S5, S1     @ S1 = S1 * .3
    vadd.f32 S0, S0, S1     @ S0 = S0 + S1

    vmul.f32 S2, S5, S2     @ S2 = S2 * .3
    vadd.f32 S0, S0, S2     @ S0 = S0 + S2

    vmul.f32 S3, S4, S3     @ S3 = S3 * .2
    vadd.f32 S0, S0, S3     @ S0 = S0 + S3

    pop  {R6}
    bx LR

.data
    point_two:   .float .2
    point_three: .float .3
