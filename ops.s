/*
==========================================
Autor: Bautista Bautista Itzel
Proyecto: ARM64 High Performance Library
Archivo: ops.s
Descripción:
Implementación optimizada en ARM64
==========================================

C equivalente:

int sum(int a, int b) { return a + b; }

==========================================
*/

.text
.global sum
.global sub
.global mul
.global max
.global min
.global sum_array
.global count_even
.global dot_product

//--------------------------------------
// int sum(int a, int b)
// x0 = a, x1 = b
//--------------------------------------
sum:
    add x0, x0, x1
    ret

//--------------------------------------
sub:
    sub x0, x0, x1
    ret

//--------------------------------------
mul:
    mul x0, x0, x1
    ret

//--------------------------------------
max:
    cmp x0, x1
    csel x0, x0, x1, gt   // if x0 > x1
    ret

//--------------------------------------
min:
    cmp x0, x1
    csel x0, x0, x1, lt
    ret

//--------------------------------------
// long sum_array(int* arr, int n)
// x0 = ptr
// x1 = size
//--------------------------------------
sum_array:
    mov x2, 0        // i
    mov x3, 0        // sum

loop_sum:
    cmp x2, x1
    b.ge end_sum

    ldr w4, [x0, x2, lsl #2]
    add x3, x3, x4

    add x2, x2, 1
    b loop_sum

end_sum:
    mov x0, x3
    ret

//--------------------------------------
// count_even
//--------------------------------------
count_even:
    mov x2, 0
    mov x3, 0

loop_even:
    cmp x2, x1
    b.ge end_even

    ldr w4, [x0, x2, lsl #2]
    and x5, x4, 1
    cmp x5, 0
    cinc x3, x3, eq

    add x2, x2, 1
    b loop_even

end_even:
    mov x0, x3
    ret

//--------------------------------------
// dot_product
//--------------------------------------
dot_product:
    mov x3, 0
    mov x4, 0

loop_dot:
    cmp x4, x2
    b.ge end_dot

    ldr w5, [x0, x4, lsl #2]
    ldr w6, [x1, x4, lsl #2]
    mul x7, x5, x6
    add x3, x3, x7

    add x4, x4, 1
    b loop_dot

end_dot:
    mov x0, x3
    ret
