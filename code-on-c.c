#include <stdio.h>
#include <math.h>

double Riman(double x, long double n) {
    double sum = 1;
    for (int i = 2; i < n + 3; i++) {
        sum += 1 / pow(i, x);
    }
    return sum;
}

void print(FILE *out, double root, int N) {
    int arr[9];
    for (int i = 0; i < N; i++) {
        if (i == 1) {
            fprintf(out, ".");
        }
        arr[i] = root;
        root *= 10;
        arr[i] = arr[i] % 10;
        fprintf(out, "%d", arr[i]);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("incorrect input\n");
        return 0;
    }
    FILE *input = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    if ((input == NULL) || (out == NULL)) {
        printf("incorrect file\n");
        return 0;
    }
    int N;
    fscanf(input, "%d", &N);
    if ((N < 1) || (N > 9)) {
        fprintf(out, "incorrect input\n N must be 1 - 9\n");
        return 0;
    }
    double root = Riman(2.0, pow(10, N));
    root = sqrt(root * 6);
    fprintf(out, "Точнось вычисленя (от 1 до 9): %d\n", N);
    fprintf(out, "Результат: ");
    print(out, root, N);
    fclose(input);
    fclose(out);
    return 0;
}