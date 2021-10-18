package com.funnyboyroks.Recursion;

import java.math.BigInteger;

public class Day1 {

    public static void main(String[] args) {
//        long prod = factorialIterative(4);
//        long prod = factorialIterative(0);
//        long prod = factorialRecur(4);
//        System.out.println(prod);
        for (int i = 0; i < 100; ++i) {
            System.out.println(i + " - " + factorialRecurBig(BigInteger.valueOf(i)));
        }
    }

    public static long factorialIterative(int number) {
        long prod = 1;
        for (long i = 2; i <= number; ++i) {
            prod *= i;
        }
        return prod;
    }

    public static long factorialRecur(int number) {
        return number <= 1 ? 1 : number * factorialRecur(number - 1);
    }

    public static BigInteger factorialRecurBig(BigInteger number) {
        return number.compareTo(BigInteger.ONE) < 1 ? BigInteger.ONE : number.multiply(factorialRecurBig(number.subtract(BigInteger.ONE)));
    }

}
