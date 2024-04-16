#include <stdio.h>

struct point {
    float x;
    float y;
};

double dist(struct point *p1, struct point *p2);
// the x/y coordinates of two points are passed, with each point in
//   its own structure
// returns Euclidean distance between the points

int main(void) {
    struct point p1 = {1.25, 2.375};
    struct point p2 = {4.5, 6.0625};
    double d;

    d = dist(&p1, &p2);
    printf("distance = %f\n", d);

}
