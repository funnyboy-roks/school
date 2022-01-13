package com.funnyboyroks.three.Trees;

import java.util.Comparator;

public class BinarySearchTreeTest {

    public static void main(String[] args) {
        BinarySearchTreeOriginal<TestObj> tree = new BinarySearchTreeOriginal<>(Comparator.comparingInt(o -> o.intValue));
        tree.add(new TestObj(1, "Hello World"));
    }

    private static class TestObj {

        public int intValue;
        public String value;

        public TestObj(int intValue, String value) {
            this.intValue = intValue;
            this.value = value;
        }
    }

}
