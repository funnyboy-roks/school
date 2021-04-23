package com.funnyboyroks.mascot;

public class Main {

    public static void main(String[] args) {
        Mascot mascot = new Mascot("hello", "dog", 2000);
        System.out.println(mascot.toString());

        Mascot mascot1 = new Mascot();
        System.out.println(mascot1.toString());

        System.out.println(mascot.chant());
        System.out.println(mascot1.chant());

        System.out.println(mascot.getAge());
        System.out.println(mascot1.getAge());

    }
}
