/**
 * Name: Hayden Pott
 * Date: 01 Nov. 2023
 * Desc: Miles per gallon and litres/100km maths
 */

#include <iostream>
#include <iomanip>
#include <string>

#define L_PER_G 3.785
#define KMS_PER_MI 1.609

using namespace std;

int main() {
    
    cout << "Enter the miles travelled: ";
    float miles;
    cin >> miles;

    cout << "Enter the gallons of gas used: ";
    float gallons;
    cin >> gallons;

    cout << fixed;

    cout << "Miles-per-gallon " << setprecision(2) << miles / gallons << endl;

    float litres = L_PER_G * gallons;
    float kms = (KMS_PER_MI * miles / 100);

    cout << "Litres-per-100km " << setprecision(1) <<  litres / kms << endl;

}
