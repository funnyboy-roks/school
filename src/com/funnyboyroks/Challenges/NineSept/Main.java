package com.funnyboyroks.Challenges.NineSept;

import java.awt.*;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Main {

    public static void main(String[] args) {
        String[] blankArgs = new String[0];

        System.out.println(ConsoleColours.YELLOW_BOLD + "--- One ---" + ConsoleColours.RESET);
        one(blankArgs);
        System.out.println(ConsoleColours.YELLOW_BOLD + "--- Two ---" + ConsoleColours.RESET);
        two(blankArgs);
        System.out.println(ConsoleColours.YELLOW_BOLD + "--- Three ---" + ConsoleColours.RESET);
        three(blankArgs);
        System.out.println(ConsoleColours.YELLOW_BOLD + "--- Five ---" + ConsoleColours.RESET);
        five(blankArgs);
        System.out.println(ConsoleColours.YELLOW_BOLD + "--- Fifteen ---" + ConsoleColours.RESET);
        fifteen(blankArgs);

    }

    public static void fifteen(String[] args) {
//        String input = "3\n1 4\n2 5\n3 6";
        String input = "5\n1 2\n2 3\n3 4\n4 5\n5 6";
        String[] lines = input.split("\n");

        int prevEnd = 0;

        int count = 0;
        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            List<Integer> times = Arrays.stream(line.split(" ")).map(Integer::parseInt).collect(Collectors.toList());

            if (times.get(0) != prevEnd) {
                ++count;
            }
            prevEnd = times.get(1);


        }
        System.out.println("count = " + count);
    }

    public static void five(String[] args) {
        double bal = 120.0;

        String[] input = new String[]{
            "40.0",
            "32.0",
            "20.0",
            "80.0",
            };

        for (String line : input) {
            double val = Double.parseDouble(line);
            if (val % 5 == 0 && bal >= val) {
                bal -= val + .5;
            }
            System.out.println(val + " " + bal);
        }

    }

    public static void three(String[] args) {

        final String vowels = "aeiou";
        String text = "Hello World";
        int vow = 0;
        int con = 0;
        for (char c : text.toCharArray()) {
            if (vowels.indexOf(c) >= 0) {
                ++vow;
                continue;
            }
            ++con;
        }
        System.out.println("Cons: " + con);
        System.out.println("Vows: " + vow);
        System.out.println("Rat: " + ((double) vow / (double) con));
    }

    public static void two(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Age: ");
        int age = in.nextInt();
        in = new Scanner(System.in);
        System.out.println("Name: ");
        String name = in.nextLine();

        System.out.println(name + " is " + age + " human years old.");
    }

    public static void one(String[] args) {
        int num;
        Scanner in = new Scanner(System.in);

        num = 3;

        System.out.println("Hello World, we are at HP.  We are group number " + num + ".");
    }

}
