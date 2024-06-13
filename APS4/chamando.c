#include <stdio.h>

extern float calc_coneV(float raio, float altura);

int main() {

    float ret = calc_coneV(3.0, 2.0);

    printf("o volume do cone eh: %f \n", ret);

    return 0;

}

