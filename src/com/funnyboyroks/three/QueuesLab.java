package com.funnyboyroks.three;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class QueuesLab {

    public static void main(String[] args) {
        Queue<Integer> queue = new LinkedList<>(
            List.of(
                43, 92, 41, 39, 10, 32, 62, 17, 29, 51, 35, 44, 24, 15, 73, 66
            )
        );
        Queue<Integer> odd = new LinkedList<>();
        Queue<Integer> even = new LinkedList<>();

        while (queue.size() > 0) {
            Integer n = queue.poll();
            Queue<Integer> selected = n % 2 == 0 ? even : odd;
            selected.offer(n);
        }

        System.out.println("even = " + even);
        System.out.println("odd = " + odd);
    }

}
