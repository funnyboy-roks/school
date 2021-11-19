package com.funnyboyroks.Challenges.ElevenNov;

import java.util.Scanner;

public class Three {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n1 = Integer.parseInt(scanner.nextLine());
        int n2 = Integer.parseInt(scanner.nextLine());

        if(n1 > n2 ) {
            System.out.println("Ana can buy the house !!");
        } else {
            System.out.println("Ana can NOT buy the house :(");
        }

    }
}
