package com.funnyboyroks.ArrayListLabs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Lab16 {

    /**
     * Given a list of Integers,
     * return a new ArrayList containing the elements from the original list
     * that come before the first 4 in the original list.
     * The original list will contain at least 2 4s.
     * ArrayList has indexOf and lastIndexOf methods
     */
    public static List<Integer> pre4(List<Integer> numbers) {
        
        return null;
    }

    /**
     * Given a list of Integers,
     * return a new ArrayList containing the elements from the original list
     * that come after the first 4 and before the last 4 in the original list.
     * The original list will contain at least 2 4s.
     * ArrayList has indexOf and lastIndexOf methods
     */
    public static List<Integer> between4s(List<Integer> numbers) {
        return null;
    }

    /**
     * Given a list of Integers,
     * return a new ArrayList containing the elements from the original list
     * that come after the last 4 in the original list.
     * The original list will contain at least 2 4s.
     * ArrayList has indexOf and lastIndexOf methods
     */
    public static List<Integer> post4(List<Integer> numbers) {
        return null;
    }

    public static void main(String[] args) {

        Integer[] x = {212, 10, 5, 4, 11, 2, 9, 4, 3, 7};
        List<Integer> list;
        list = new ArrayList<>(Arrays.asList(x));
        System.out.println("Original list:: " + list);
        System.out.println("Pre4 list:: " + pre4(list));    //outs [212,10,5]
        System.out.println("Between4s list:: " + between4s(list));//outs [11,2,9]
        System.out.println("Post4 list:: " + post4(list));//outs [3,7]


        x = new Integer[]{3, 3, 4, 2, 5, 6, 7, 4};
        list = new ArrayList<>(Arrays.asList(x));
        System.out.println("Original list:: " + list);
        System.out.println("Pre4 list:: " + pre4(list));    //outs [3,3]
        System.out.println("Between4s list:: " + between4s(list));//outs [2,5,6,7]
        System.out.println("Post4 list:: " + post4(list));//outs []

        x = new Integer[]{4, 3, 4, 2, 4, 6, 7, 8, 9, 2, 3};
        list = new ArrayList<>(Arrays.asList(x));
        System.out.println("Original list:: " + list);
        System.out.println("Pre4 list:: " + pre4(list));    //outs []
        System.out.println("Between4s list:: " + between4s(list));//outs [3,4,2]
        System.out.println("Post4 list:: " + post4(list));//outs [6,7,8,9,2,3]

        x = new Integer[]{1, 2, 3, 4, 4, 3, 2, 1};
        list = new ArrayList<>(Arrays.asList(x));
        System.out.println("Original list:: " + list);
        System.out.println("Pre4 list:: " + pre4(list));    //outs [1,2,3]
        System.out.println("Between4s list:: " + between4s(list));//outs []
        System.out.println("Post4 list:: " + post4(list));//outs [3,2,1]

    }
}
