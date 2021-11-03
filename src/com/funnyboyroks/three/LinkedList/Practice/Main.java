package com.funnyboyroks.three.LinkedList.Practice;

public class Main {

    public static void main(String[] args) {
//        prob1();
//        prob2();
//        prob3();
    }


    public static void prob1() {
        System.out.println("\n---Problem 1: ");
        //Creating the nodes for list
        ListNode list = new ListNode(10, new ListNode(20));

        //Students, insert your steps here
        ListNode temp = new ListNode(30);
        list.next.next = temp;

        //Printing  list
        ListNode curr = list;
        System.out.print("\nList: ");
        while (curr != null) {
            System.out.print(curr.data + " ");
            curr = curr.next;
        }

    }

    public static void prob2() {
        System.out.println("\n---Problem 2: ");

        //Creating the nodes for list
        ListNode list = new ListNode(10, new ListNode(20));

        //Students, insert your steps here
        ListNode temp = list;
        list = new ListNode(30, temp);


        //Printing  list
        ListNode curr = list;
        System.out.print("\nList: ");
        while (curr != null) {
            System.out.print(curr.data + " ");
            curr = curr.next;
        }

    }

    public static void prob3() {
        System.out.println("\n---Problem 3: ");

        //Creating the nodes for list
        ListNode list1 = new ListNode(10, new ListNode(20));
        ListNode list2 = new ListNode(30, new ListNode(40));

        //Students, insert your apporoach to solving this problem
        ListNode temp = list2.next;
        list2.next = list1.next;
        list1.next = list2;
        list2 = temp;

        //Printing  List 1
        ListNode curr1 = list1;
        System.out.print("\nList 1: ");
        while (curr1 != null) {
            System.out.print(curr1.data + " ");
            curr1 = curr1.next;
        }

        //Printing  List 2
        ListNode curr2 = list2;
        System.out.print("\n\nList 2: ");
        while (curr2 != null) {
            System.out.print(curr2.data + " ");
            curr2 = curr2.next;
        }
    }


}
