package com.funnyboyroks.Challenges.NineSept;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EightOct {

    public static void main(String[] args) {
        String input = """
Edward VII 22/01/1901 06/05/1910
George V 06/05/1910 20/01/1936
Edward VII 20/01/1936 06/02/1952""";

        String[] lines = input.split("\n");

        for (String line : lines) {

            System.out.println(line);
            Matcher matcher = Pattern.compile(".+(\\d+)/(\\d+)/(\\d+) (\\d+)/(\\d+)/(\\d+)$")
                .matcher(line);

            System.out.println(matcher);

            int d1 = Integer.parseInt(matcher.group(1));
            int m1 = Integer.parseInt(matcher.group(2));
            int y1 = Integer.parseInt(matcher.group(3));

            int d2 = Integer.parseInt(matcher.group(4));
            int m2 = Integer.parseInt(matcher.group(5));
            int y2 = Integer.parseInt(matcher.group(6));

            System.out.println(d1);
            System.out.println(m1);
            System.out.println(y1);
            System.out.println(d2);
            System.out.println(m2);
            System.out.println(y2);

        }
    }

    public static void seventeen(String[] args) {
        double USD = 1.13;
        double GBP = 0.74;
        double CHF = 1.05;
        double CNY = 7.08;

        Scanner scanner = new Scanner(System.in);

        String in = scanner.nextLine();
        if(in.equals(".")) return;

        String[] values = in.split(" ");

        double amount = Double.parseDouble(values[0]);
        boolean exchange = values.length == 4;

        if(!exchange) {
            double selectedCurrency = 1;
            switch (values[1].toUpperCase()) {
                case "USD":
                    selectedCurrency = USD;
                    break;
                case "GBP":
                    selectedCurrency = GBP;
                    break;
                case "CHF":
                    selectedCurrency = CHF;
                    break;
                case "CNY":
                    selectedCurrency = CNY;
                    break;
            }
            System.out.println(amount + " " + values[1] + " = " + (amount / selectedCurrency) + " EUR");
            return;
        }
        double selectedCurrency1 = 1;
        switch (values[1].toUpperCase()) {
            case "USD":
                selectedCurrency1 = USD;
                break;
            case "GBP":
                selectedCurrency1 = GBP;
                break;
            case "CHF":
                selectedCurrency1 = CHF;
                break;
            case "CNY":
                selectedCurrency1 = CNY;
                break;
        }
        double selectedCurrency2 = 1;
        switch (values[3].toUpperCase()) {
            case "USD":
                selectedCurrency2 = USD;
                break;
            case "GBP":
                selectedCurrency2 = GBP;
                break;
            case "CHF":
                selectedCurrency2 = CHF;
                break;
            case "CNY":
                selectedCurrency2 = CNY;
                break;
        }
        double eur = amount / selectedCurrency1;
        System.out.println(eur * selectedCurrency2);

    }

    public static void eleven(String[] args) {
        String[] input = """
            1 7 15
            36
            53
            10
            0""".split("\n");

        List<Integer> jars = new ArrayList<>();
        String[] jarStrings = input[0].split(" ");
        for (String jarString : jarStrings) {
            jars.add(Integer.parseInt(jarString));
        }

        Collections.sort(jars);

        List<Integer> jarCounts = new ArrayList<>();

        for(int i = 1; i < input.length; ++i) {
            int n = Integer.parseInt(input[i]);
            for (int j = jars.size() - 1; j >= 0; j--) {
                int count = n / jars.get(j);
                int amount = count * jars.get(j);
                n -= amount;
                jarCounts.add(count);
                System.out.print(count + " ");
            }
            System.out.println("\n");
        }


    }

    public static void five(String[] args) {
//        String str = "As I pee, sir, I see Pisa";
        String str = "tacocat";
        str = str.toLowerCase();
        str = str.replaceAll("[,.!:;]", "");
        boolean palendrome = true;
        for (int i = 0; i < str.length() / 2; ++i) {
            char start = str.charAt(i);
            char end = str.charAt(str.length() - i - 1);
            if (start != end) {
                palendrome = false;
                break;
            }
        }
        System.out.println(str + " is " + (palendrome ? "" : "not ") + "a palendrom!");
    }

    public static void one(String[] args) {
        double mills, km;
        Scanner scanner = new Scanner(System.in);
        mills = scanner.nextFloat();
        scanner.nextLine();
        km = mills * 1.609;
        System.out.println(mills + " miles are " + km + "km");
    }

}
