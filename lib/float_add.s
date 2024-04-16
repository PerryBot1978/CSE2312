.global float_add

float_add:
    vmov S0, R0
    vmov S1, R1

    vadd.f32 S2, S0, S1
    vmov R0, S2

float_add_end:
    bx LR
    
