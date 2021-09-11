package com.funnyboyroks.Challenges.NineSept;

import java.util.*;

public class Queues2 {

    public static Map<Integer, Queue<String>> queues = new HashMap<>();
    public static List<Integer> orderedKeys = new ArrayList<>();
    public static int time = 0;

    public static void main(String[] args) {

        String input = "4\n3 3 A E I\n2 4 B F J N\n4 3 C G L\n1 6 D H M O P Q";
        String[] lines = input.split("\n");

        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            String[] vals = line.split(" ");

            Queue<String> q = new PriorityQueue<>();
            q.addAll(Arrays.stream(vals).toList().subList(2, vals.length));

            queues.put(Integer.parseInt(vals[0]), q);
            orderedKeys.add(Integer.parseInt(vals[0]));
        }

        while (itemsLeft()) {
            time += 1;
            orderedKeys.forEach(key -> {
                Queue<String> q = queues.get(key);
                if (time % key == 0 && q.size() > 0) {
                    System.out.print(q.poll() + ' ');
                }
            });
        }

    }

    public static boolean itemsLeft() {
        for (Queue<String> q : queues.values()) {
            if (!q.isEmpty()) return true;
        }
        return false;
    }
}
