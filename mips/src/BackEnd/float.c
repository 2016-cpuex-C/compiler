#include <stdio.h>

typedef union {
    int    i[2];
    double d;
} dbl;

int gethi(double f) {
    dbl x;
    x.d = f;
    return x.i[0];
}
int getlo(double f) {
    dbl x;
    x.d = f;
    return x.i[1];
}

typedef union {
    int i;
    float f;
} fi;

int floatAsWord(float f) {
    fi x;
    x.f = f;
    return x.i;
}

