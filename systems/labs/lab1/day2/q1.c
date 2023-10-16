/**
 * Name: Hayden Pott
 * Date: 29 Sept 2023
 * Desc: Miles per gallon and litres/100km maths
 */

#include <stdio.h>

#define L_PER_G 3.785
#define KMS_PER_MI 1.609

int main() {
    printf("Enter the miles travelled: ");
    float miles;
    scanf("%f", &miles);

    printf("Enter the gallons of gas used: ");
    float gallons;
    scanf("%f", &gallons);

    printf("Miles-per-gallon %.02f\n", miles / gallons);

    float litres = L_PER_G * gallons;
    float kms = (KMS_PER_MI * miles / 100);

    printf("Litres-per-100km %.01f\n", litres / kms);

}
