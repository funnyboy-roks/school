package com.funnyboyroks.Challenges.ElevenNov;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Four {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int age = Integer.parseInt(scanner.nextLine());

        String planet = scanner.nextLine();

        Map<String, Integer> planets = new HashMap<>();
        planets.put("Mercury", 88);
        planets.put("Venus", 225);
        planets.put("Earth", 365);
        planets.put("Mars", 687);
        planets.put("Jupiter", 4333);
        planets.put("Saturn", 10759);
        planets.put("Uranus", 30689);
        planets.put("Neptune", 60182);

        System.out.println((age * planets.get(planet)) / 365);
    }
}
