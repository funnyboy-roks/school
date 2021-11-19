package com.funnyboyroks.Challenges.ElevenNov;

import java.util.Scanner;

public class Five {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String name = scanner.nextLine();
        String age = scanner.nextLine();
        String gender = scanner.nextLine();
        String city = scanner.nextLine();
        String sport = scanner.nextLine();
        String team = scanner.nextLine();
        String job = scanner.nextLine();

        String pronoun = gender.equalsIgnoreCase("girl") ? "her" : "his";
        String pos = gender.equalsIgnoreCase("girl") ? "she" : "he";


        String o = String.format("%s is a %s year-old %s. %s is living with %s parents in an apartment in the centre of %s, where %s hangs out with %s friends.  Moreover, in %s free time %s plays %s in a team called %s. %s would like to pursue a career in %s when %s is older, that's why %s is studying hard.",
                name, age, gender, pronoun, pos, city, pronoun, pos, pos, pronoun, sport, team, name, job, pronoun, pronoun);
        System.out.println(o);
    }
}
