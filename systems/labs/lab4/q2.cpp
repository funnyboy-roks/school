/*
* Name: Hayden Pott
* Date: 1. Nov 2023
* Desc: I'm not entirely sure
*/

#include <iostream>
#include <iomanip>

using namespace std;

int prompt_kelvin() {
    cout << "1) C to K" << endl;
    cout << "2) F to K" << endl;
    cout << "3) K to C" << endl;
    cout << "4) K to F" << endl;
    cout << "0) Exit"   << endl;

    cout << "Enter an option: ";
    int out;
    cin >> out;
    return out;
}

void handle_kelvin() {
    double in;
prompt:
    switch (prompt_kelvin()) {
        case 1:
            cout << "Enter a temp in C: ";
            cin >> in;
            cout << "K: " << setprecision(2) << in + 273.15 << "°"  << endl;
            break;
        case 2:
            cout << "Enter a temp in F: ";
            cin >> in;
            cout << "K: " << setprecision(2) << (in - 32) * 5 / 9 + 273.15 << "°"  << endl;
            break;
        case 3:
            cout << "Enter a temp in K: ";
            cin >> in;
            cout << "C: " << setprecision(2) << in - 273.15 << "°"  << endl;
            break;
        case 4:
            cout << "Enter a temp in K: ";
            cin >> in;
            cout << "F: " << setprecision(2) << (in - 273.15) * 9 / 5 + 32 << "°"  << endl;
            break;
        case 0:
            cout << "Returning to parent menu" << endl;
            return;
        default: 
            cout << "Invalid option." << endl;
            goto prompt;
    }
}

int prompt_main() {
    cout << "1) F to C" << endl;
    cout << "2) C to F" << endl;
    cout << "3) Kelvin" << endl;
    cout << "0) Exit"   << endl;

    cout << "Enter an option: ";
    int out;
    cin >> out;
    return out;
}

int main() {
    cout << fixed;

    double in;
    while (true) {
        switch (prompt_main()) {
            case 0:
                return 0;
            case 1:
                cout << "Enter a temp in F: ";
                cin >> in;
                cout << "C: " << setprecision(2) << (in - 32) * 5 / 9 << "°"  << endl;
                break;
            case 2:
                cout << "Enter a temp in C: ";
                cin >> in;
                cout << "F: " << setprecision(2) << in * 9 / 5 + 32 << "°" << endl;
                break;
            case 3:
                handle_kelvin();
                break;
            default: 
                cout << "Invalid option." << endl;
                break;
        }
        cout << endl;
    }

    return 0;
}
