package com.funnyboyroks.three.LinkedList;

import java.util.Arrays;

public class LinkedList <T> {

    private Node<T> head;

    public LinkedList() {
        this.head = null;
    }

    public void add(T item) {
        if(this.head == null) {
            this.head = new Node<>(item);
        } else {
            this.head.add(item);
        }
    }

    public T get(int index) {
        return head == null ? null : head.get(index);
    }

    public int size() {
        return head == null ? 0 : head.size();
    }

    public boolean isEmpty() {
        return this.head == null;
    }

    public boolean contains(T value) {
        return this.head != null && this.head.contains(value);
    }

//    public T[] toArray(T[] a) {
//        a = Arrays.stream(a).filter((t) -> false).toArray(T[]:new);
//    }

    @Override
    public String toString() {
        return "[" + head + "]";
    }
}
