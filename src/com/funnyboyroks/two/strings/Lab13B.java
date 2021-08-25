package com.funnyboyroks.two.strings;

public class Lab13B {

    private static final char[] vowels = {'a', 'e', 'i', 'o', 'u'};

    public static void main(String[] args) {
        beesAndZees("RGBOPZM");
        beesAndZees("RZUBXABEBA");
        beesAndZees("MBAPBFCZBO");
    }

    public static void beesAndZees(String word) {
        StringBuilder out = new StringBuilder();
        char[] chars = word.toCharArray();

        String folStr = word;
        for (int i = 0; i < chars.length - 1; i++) {
            char c = chars[i];
            char next = chars[i + 1];

            if (c == 'B' && isVowel(next)) {
                out
                    .append('Z')
                    .append('T')
                    .append(chars[i + 1]);
                i = folStr.indexOf('Z') - 1;
            } else {
                out.append(c);
            }
            folStr = word.substring(i);
        }
        System.out.println(out.toString() + chars[chars.length - 1]);
    }

    public static boolean isVowel(char c) {
        for (char vowel : vowels) {
            if (vowel == c) {
                return true;
            }
        }
        return false;
    }
}
