#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef uint8_t u8;
typedef uint32_t u32;
typedef uint64_t u64;

void extract(float f, u32 *sign, u32 *exp, u32 *mant) {
    u32 i = *(u32 *)&f;

    printf("raw  = %032b\n", i);
    if (sign != NULL)
        *sign = i >> 31;
    if (exp != NULL)
        *exp = i >> 23 & 0xff;
    if (mant != NULL) {
        *mant = i & 0x007fffff;
        *mant |= !!(*exp) << 23;
    }
}

float combine(u8 sign, u8 exp, u32 mant) {
    mant &= 0x007fffff;
    mant |= ((u32)sign << 31) | ((u32)exp << 23);
    printf("result   = %032b\n", mant);
    return *(float *)&mant;
}

void mul(float x, float y) {
    u32 xs, ys;
    u32 t1, ye;
    u32 xm, ym;

    extract(x, &xs, &t1, &xm);
    extract(y, &ys, &ye, &ym);

    printf("x sign = %d\n", xs);
    printf("x exp  = %d = %08b\n", t1, t1);
    printf("y exp  = %d = %08b\n", ye, ye);
    printf("MASK   = %032b\n", (1 << 23) - 1);
    printf("x mant = %032b\n", xm);
    printf("y mant = %032b\n", ym);
    printf("\n");

    t1 += ye;
    t1 -= 127;

    xs ^= ys;

    u64 xyml = ((u64)xm * (u64)ym);
    printf("xye    =                                 %032b\n", t1);
    printf("xym    = %064lb\n", xyml);
    u32 t3 = xyml >> 32;
    u32 t4 = xyml & 0xffffffff;
    t3 <<= 9;
    t4 >>= 23;
    t3 |= t4;

    t4 = t3 >> 24;
    t4 &= 1;
    t3 >>= t4;
    t1 += t4;

    printf("xym 2  =          %023b\n", t3);

    float o = combine(xs, t1, t3);
    float expected = x * y;
    printf("expected = %032b\n", *(int*)&expected);
    printf("fuck you = %f\n", o);
    printf("expected = %f\n", expected);
}

void add(float x, float y) {
    u32 xe, ye;
    u32 xs, ys;
    u32 xm, ym;
    extract(x, &xs, &xe, &xm);
    extract(y, &ys, &ye, &ym);
    if (xe < ye) {
        extract(y, &xs, &xe, &xm);
        extract(x, &ys, &ye, &ym);
    }

    printf("x        = %1b %08b %024b\n", xs, xe, xm);
    printf("y        = %1b %08b %024b\n", ys, ye, ym);

    ym >>= xe - ye;

    printf("shift by dexp\n");
    printf("x        = %1b %08b %024b\n", xs, xe, xm);
    printf("y        = %1b %08b %024b\n", ys, ye, ym);

    // ym *= ((xs == ys) << 1) - 1;
    xm += ym;

    printf("add\n");
    printf("result   = %1b %08b %024b\n", xs, xe, xm);

    u32 t6 = xm >> 24 & 1;
    xm >>= t6;
    xe += t6;

    printf("normalise\n");
    printf("result   = %1b %08b %024b\n", xs, xe, xm);

    float o = combine(xs, xe, xm);
    float expected = x + y;
    printf("expected = %032b\n", *(int*)&expected);
    printf("fuck you = %f\n", o);
    printf("expected = %f\n", expected);
}

int main(int argc, char **argv) {
    assert(argc == 3);
    float x = strtof(argv[1], NULL);
    float y = strtof(argv[2], NULL);
    extract(x, NULL, NULL, NULL);
    extract(y, NULL, NULL, NULL);

    add(x, y);
}
