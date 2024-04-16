#include <stdio.h>
#include <stdlib.h>

#define factorial(n, assign) \
    assign = 1; \
    for (register int __factorial_i = 2; __factorial_i <= n; __factorial_i++) \
        assign *= __factorial_i;

#define fibonocci(n, assign) \
    int __fibonocci_a = 0, __fibonocci_b = 1; \
    if (n == 0) \
        assign = __fibonocci_a; \
    for (int i = 1; i < n; i++) { \
        int __fibonocci_val = __fibonocci_b; \
        __fibonocci_b += __fibonocci_a; \
        __fibonocci_a = __fibonocci_b; \
    } \
    assign = __fibonocci_b;

int main(int argc, char *argv[]) {
    int n = 3, out;

    { factorial(n, out); }
    printf("%d! = %d\n", n, out);
    
    { fibonocci(n, out); }
    printf("%d! = %d\n", n, out);
    
    return 0;
}
