package com.funnyboyroks.two.strings;

public class Lab13D {

    private static final char[] vowels = {'a', 'e', 'i', 'o', 'u'};

    public static void main(String[] args) {
        // Instructed way:
        buildWord("SPA*TTI GHE");
        buildWord("S*U*N AT R");
        buildWord("P*N*UI* E G N");

        // My way:
        buildWordNicer("SPA*TTI", "GHE");
        buildWordNicer("S*U*N", "AT", "R");
        buildWordNicer("P*N*UI*", "E", "G", "N");
    }

    /**
     * For the record- I don't like that there are essentially
     * parameters that are just a string split by spaces xP
     * <p>
     * The way I was told to do it:
     */
    public static void buildWord(String word) {
        String[] values = word.split(" ");
        word = values[0];

        int i = 0;
        while (word.contains("*")) {
            word = word.replaceFirst("\\*", values[i + 1]);
            ++i;
        }
        System.out.println(word);
    }

    /**
     * So much easier to look at and understand what it's doing :)
     * <p>
     * My Way:
     */
    public static void buildWordNicer(String word, String... replacements) {
        int i = 0;
        while (word.contains("*")) {
            word = word.replaceFirst("\\*", replacements[i]);
            ++i;
        }
        System.out.println(word);
    }
}
