package com.funnyboyroks.two.strings;

import java.util.ArrayList;
import java.util.List;

public class Lab13C {

    private static final char[] vowels = {'a', 'e', 'i', 'o', 'u'};

    public static void main(String[] args) {
        System.out.println(String.join(", ", getAllSubstrings("fun")));
        System.out.println(String.join(", ", getAllSubstrings("taco")));
    }

    public static List<String> getAllSubstrings(String word) {
        List<String> out = new ArrayList<>();
        for (int i = 0; i < word.length() + 1; ++i) {
            for (int j = i + 1; j < word.length() + 1; ++j) {
                out.add(word.substring(i, j));
            }
        }
        return out;
    }
}
