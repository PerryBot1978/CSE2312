.global dist

dist:
    vldr S0, [R0]       @ S0 = x1
    add R0, R0, #4
    vldr S2, [R0]       @ S2 = y1

    vldr S4, [R1]       @ S4 = x2
    add R1, R1, #4
    vldr S6, [R1]       @ S6 = y2

    vcvt.f64.f32 D0, S0 @ D0 = (double)x1
    vcvt.f64.f32 D1, S2 @ D1 = (double)y1
    vcvt.f64.f32 D2, S4 @ D2 = (double)x2
    vcvt.f64.f32 D3, S6 @ D3 = (double)y2

    vsub.f64 D0, D0, D2 @ D0 = x1 - x2
    vsub.f64 D1, D1, D3 @ D1 = y1 - y2

    vmul.f64 D2, D0, D0 @ D2 = (x1 - x2) ^ 2
    vmul.f64 D3, D1, D1 @ D3 = (y1 - y2) ^ 2

    vadd.f64 D0, D2, D3
    vsqrt.f64 D0, D0

