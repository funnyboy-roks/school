package com.funnyboyroks.Challenges.NineSept;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Queues {

    public static List<Queue> queues;

    public static void main(String[] args) {

        String input = "4\n3 3 A E I\n2 4 B F J N\n4 3 C G L\n1 6 D H M O P Q";
        String[] lines = input.split("\n");

        queues = new ArrayList<>();

        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            String[] vals = line.split(" ");

            Queue q = new Queue(Integer.parseInt(vals[0]), subSection(vals, 2, vals.length));

            queues.add(q);
        }

        while (itemsLeft()) {
            Queue.time += 1;
            queues.forEach(Queue::run);
        }

    }

    public static boolean itemsLeft() {
        for (Queue q : queues) {
            if (q.items.length > 0) {
                return true;
            }
        }
        return false;
    }

    public static String[] subSection(String[] arr, int start, int end) {
        int size = Math.max(0, end - start);
        String[] slice = new String[size];
        if (size == 0) return slice;
        for (int i = 0; i < slice.length; ++i) {
            slice[i] = arr[start + i];
        }

        return slice;
    }

    public static class Queue {

        public static int time = 0;
        public final int delay;
        public String[] items;

        public Queue(int delay, String... items) {
            this.delay = delay;
            this.items = items;
        }

        public boolean canRun() {
            return time % this.delay == 0;
        }

        public void run() {
            if (!canRun()) {
                return;
            }

            if (items.length == 0) return;

//            System.out.println(time + " - " + items[0]);
            System.out.print(items[0] + " ");
            items = subSection(items, 1, items.length);

        }

        @Override
        public String toString() {
            return delay + " - " + Arrays.toString(items);
        }
    }

}
