package com.funnyboyroks.three.LinkedList;

public class test {

    public static void main(String[] args) {
        LinkedList<Integer> list = new LinkedList<>();

        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        System.out.println(list);
        System.out.println(list.size());
        System.out.println(list.get(2));
    }

}
