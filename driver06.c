/*
    Sun Mar  3 08:34:28 CST 2024

    to compile:
        gcc  driver06.c  hw06.s

    add -g if using debugger
*/

#include <stdio.h>
#include <string.h>
#include <inttypes.h>

void task1test(void);
void task2test(void);

void swap(char first[], char second[]);
//  given two null-terminated arrays of characters of equal length,
//    swaps the characters in the same position from each when
//    the character in the first string is lowercase


void runningSum(int16_t d[], int32_t length);
//  given an array of 16-bit signed integers and the length,
//    replace the array values with the running sum of the
//    array values


int main(void) {
    printf("Task 1\n");
    task1test();

    printf("\n");
    printf("Task 2\n");
    task2test();
}


void task1test(void) {
    char first1[]  = "AxDxG";
    char second1[] = "+_+_+";
    char first2[]  = "ABcDefGh";
    char second2[] = "12345678";

    swap(first1, second1);
    printf("%s\n%s\n\n", first1, second1);

    swap(first2, second2);
    printf("%s\n%s\n", first2, second2);
}


void task2test(void) {
    int16_t a[] = {1, -2, 3, -4, 5, -6};
    //int16_t a[] = {1, 2, 3, -1, -2, -3, -4};
    int16_t b[] = {-700, 100, 200, 300, 400};
    int32_t length, i;

    length = sizeof(a)/sizeof(a[0]);
    runningSum(a, length);

    for(i = 0; i < length-1; i++)
        printf("%" PRId16 ", ", a[i]);

    printf("%" PRId16 "\n", a[i]);


    length = sizeof(b)/sizeof(b[0]);
    runningSum(b, length);

    for(i = 0; i < length-1; i++)
        printf("%" PRId16 ", ", b[i]);

    printf("%" PRId16 "\n", b[i]);
}
