/*
==========================================
Bridge C -> ASM
==========================================
*/

#include <stdint.h>

// Declaraciones externas ASM
extern int sum(int, int);
extern int sub(int, int);
extern int mul(int, int);
extern int max(int, int);
extern int min(int, int);

extern long sum_array(int*, int);
extern int count_even(int*, int);
extern long dot_product(int*, int*, int);
