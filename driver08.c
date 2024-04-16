/*
    C program to call ARMv7 assembly subroutines
    that uses structures

    output for this data

      the overall class average is 81.571
*/

#include <stdio.h>
#include <inttypes.h>

struct scores {
    char name[15]; // 0
    float hwAvg;   // 16
    int exam1;     // 20
    int exam2;     // 24
    int final;     // 28
};                 // 32


float calcClassAvg(struct scores [], int32_t n);
// given an array of structures and the length of the array
// returns the class average

int main(void) {
    struct scores cse2312[] = {{"Alex",     81.25,   80, 70, 72},
                               {"Bart",     81.0625, 85, 69, 75},
                               {"Charlene", 88.75,   95, 90, 92}};
    float classAverage;
    int length = sizeof( cse2312 )/sizeof( struct scores );

    classAverage = calcClassAvg(cse2312, length);
    printf("the overall class average is %.3f\n", classAverage);
}
