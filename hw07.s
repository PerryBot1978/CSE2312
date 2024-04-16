# Name : Dillian Botello

.global floatAvg
.global exam3Agrade

floatAvg:
    mov R2, #0              @ R2 is index
    
    vmov S1, R2             @ S0 is sum
    vcvt.f32.s32 S0, S1     @ S0 = 0

floatAvg_condition:
    cmp R2, R1              @ if R2 >= R1
    bge floatAvg_return     @ goto return

floatAvg_loop:
    vldr S1, [R0]           @ S1 = *hw
    add R0, R0, #4          @ hw++
    vadd.f32 S0, S0, S1     @ S0 += S1

    add R2, R2, #1
    b floatAvg_condition

floatAvg_return:
    vmov S1, R1
    vcvt.f32.s32 S1, S1     @ S1  = n
    vdiv.f32 S0, S0, S1     @ S0 /= n
    vmov R0, S0

    bx LR


exam3Agrade:
    vmov S1, R1
    vmov S2, R2

    vcvt.f32.s32 S1, S1
    vcvt.f32.s32 S2, S2

    ldr  R2, =one_point_five
    vldr S4, [R2]           @ S4 = 1.5

    ldr R2, =four_fifty
    vldr S6, [R2]           @ S6 = 450.0

    vadd.f32 S1, S1, S2     @ exam1 += exam2
    vmul.f32 S1, S4, S1     @ exam1 *= 1.5

    vsub.f32 S6, S6, S1     @ out = 450.0 - exam1
    vsub.f32 S6, S6, S0     @ out -= hw

    vmov R0, S6             @ return S6
    bx LR
    
.data
    one_point_five: .float 1.5
    four_fifty: .float 450.0
