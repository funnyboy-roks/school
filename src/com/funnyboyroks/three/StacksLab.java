package com.funnyboyroks.three;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class StacksLab {

    /*

SAMPLE DATA
[()]{}{[()()]()}
[(])
[]
((())

SAMPLE OUTPUT
GOOD
BAD
GOOD
BAD

*/
    private static final Map<Character, Character> charMap = new HashMap<>();

    static {
        charMap.put(')', '(');
        charMap.put(']', '[');
        charMap.put('}', '{');
    }

    public static void main(String[] args) {
        String input = "[()]{}{[()()]()}";
//        String input = "[]]";
        System.out.println(run(input));
    }


    public static boolean run(String input) {

        Stack<Character> chars = new Stack<>();
        for (char c : input.toCharArray()) {
            switch (c) {
                case '[', '(', '{': {
                    chars.push(c);
                }
                break;
                case ']', ')', '}': {
                    if (chars.size() <= 0 || chars.pop() != charMap.get(c)) {
                        return false;
                    }
                }
                break;
            }
        }
        return true;
    }

}
