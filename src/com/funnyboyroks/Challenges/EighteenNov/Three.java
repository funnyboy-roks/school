package com.funnyboyroks.Challenges.EighteenNov;

import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Three {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        List<Integer> ints = Arrays.stream(scanner.nextLine().split(" ")).map(Integer::parseInt).collect(Collectors.toList());

        int n = ints.remove(0);
        for (Integer anInt : ints) {
            n -= anInt;
            if(n <= 0) break;
        }
        System.out.println("The ship was fueled " + n + "times. The ship has been fueled!");
    }
}
