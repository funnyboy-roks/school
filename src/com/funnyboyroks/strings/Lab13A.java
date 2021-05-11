package com.funnyboyroks.strings;

public class Lab13A {

    public static void main(String[] args) {
        makeSense("3 1 2 4 6 5", "BEST IS THE YET COME TO");
        makeSense("2 8 3 1 4 7 6 5", "WORLD WHERE THE IS DIEGO SAN CARMEN IN");
        makeSense("4 3 2 6 5 1", "SUSPENDERS? FIREMEN DO WHY RED WEAR");
        makeSense("2 4 5 1 3", "PANTS TO UP. HOLD THEIR");
    }

    public static void makeSense(String s1, String s2) {
        String[] nums = s1.split(" ");
        String[] words = s2.split(" ");

        StringBuilder sb = new StringBuilder();

        for (String num : nums) {
            int i = Integer.parseInt(num);
            sb
                .append(words[i - 1])
                .append(' ');
        }
        System.out.println(sb);
    }
}
