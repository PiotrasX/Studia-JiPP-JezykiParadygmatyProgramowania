#include <stdio.h>
#include <math.h>

int main() {
    float a, b, c, delta, x1, x2;

    printf("Podaj wspolczynniki trojmianu\n");

    do {
        printf("a = ");
        scanf("%f", &a);
        if (a == 0) {
            printf("Wspolczynnik a musi byc rozny od 0\n");
        }
    } while (a == 0);

    printf("b = ");
    scanf("%f", &b);
    printf("c = ");
    scanf("%f", &c);

    delta = b * b - 4.0 * a * c;
    if (delta > 0.0) {
        x1 = (-b - sqrt(delta))/(2.0 * a);
        x2 = (-b + sqrt(delta))/(2.0 * a);
        printf("Pierwiastkami sa liczby %.2f, %.2f\n", x1, x2);
    } else if (delta == 0.0) {
        x1 = (-b)/(2.0 * a);
        printf("Pierwiastkiem jest liczba %.2f\n", x1);
    } else {
        printf("Brak pierwiastkow\n");
    }
    
    return 0;
}
