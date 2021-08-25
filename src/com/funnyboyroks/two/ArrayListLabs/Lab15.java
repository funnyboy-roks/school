package com.funnyboyroks.two.ArrayListLabs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Lab15 {
    //write the isPalindrome method
    //a palindrome is a word that is the same backwards as it is forward
    //precondition: word.length() > 0
    public static String reverseString(String word) {
        String out = "";
        for (char c : word.toCharArray()) {
            out = c + out;
        }
        return out;
    }

    public static boolean isPalindrome(String word) {
        return reverseString(word).equals(word);
    }

    //allPalindromes will remove the words from the list that are not palindromes
    public static List<String> allPalindromes(List<String> words) {
        return words.stream().filter(Lab15::isPalindrome).collect(Collectors.toList());
    }

    public static void main(String[] args) {

        String[] x = {"abccba", "defed", "ghighi", "jkljkl", "mnoomn", "pqrrqp", "x"};
        List<String> list;
        list = new ArrayList<String>(Arrays.asList(x));
        System.out.println("Original list: " + list);
        list = allPalindromes(list);
        System.out.println("Palindrome list: " + list);            // outs ["abccba", "defed", "pqrrqp", "x"]

        x = new String[]{"1234", "567764", "86730903678", "0101010101"};
        list = new ArrayList<String>(Arrays.asList(x));
        System.out.println("Original list: " + list);
        list = allPalindromes(list);
        System.out.println("Palindrome list: " + list);                //outs [ ]

        x = new String[]{"mom", "nine", "call", "level", "a", "the", "sevens"};
        list = new ArrayList<String>(Arrays.asList(x));
        System.out.println("Original list: " + list);
        list = allPalindromes(list);
        System.out.println("Palindrome list: " + list);        // outs ["mom","level","a"]

        x = new String[]{"tacocat", "bananab", "neveroddoreven", "wasitaratisaw"};
        list = new ArrayList<String>(Arrays.asList(x));
        System.out.println("Original list: " + list);
        list = allPalindromes(list);
        System.out.println("Palindrome list: " + list);        // outs ["tacocat","bananab","neveroddoreven","wasitaratisaw"]
    }
}
