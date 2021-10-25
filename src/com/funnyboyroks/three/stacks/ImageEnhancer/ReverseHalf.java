package com.funnyboyroks.three.stacks.ImageEnhancer;

import java.util.*;

public class ReverseHalf {

    public static void main(String[] args) {

        Queue<Integer> q = new LinkedList<>(List.of(1, 8, 7, 2, 9, 18, 12, 0));

        reverseHalf(q);

        System.out.println(q);

    }

    public static <T> void reverseHalf(Queue<T> in) {

        Stack<T> odds = new Stack<>();
        Queue<T> even = new LinkedList<>();

        boolean addEven = true;

        while (!in.isEmpty()) {

            if (addEven) {
                even.offer(in.poll());
            } else {
                odds.push(in.poll());
            }

            addEven = !addEven;
        }

        addEven = true;

        while (!even.isEmpty() && !odds.isEmpty()) {
            if (addEven) {
                in.offer(even.poll());
            } else {
                in.offer(odds.pop());
            }

            addEven = !addEven;
        }

    }

}
