package com.funnyboyroks.three.LinkedList;

import java.util.Collection;
import java.util.List;

public class Queue<T> {

    public static void main(String[] args) {
        Queue<Integer> ints = new Queue<>(List.of(1, 2, 3));
        System.out.println(ints);
    }

    protected Node<T> head;
    protected Node<T> tail;
    protected int size;

    public Queue() {
        this.size = 0;
        this.head = null;
        this.tail = null;
    }

    public Queue(Collection<T> items) {
        super();
        items.forEach(this::add);
    }

    public int size() {
        return this.size;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public boolean contains(Object o) {
        return false;
    }

    protected void add(T item) {
        ++size;
        if (this.head == null) {
            this.head = this.tail = new Node<>(item);
            return;
        }
        Node<T> n = new Node<>(item);
        n.setTail(this.head);
        n.setHead(this.tail);
        this.tail.setTail(n);
        this.tail = n;
        this.head.setHead(n);

    }

    protected Node<T> getNode(int index) {
        if(index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException(index);
        }
        Node<T> node = this.head;
        for (int i = 0; i < this.size; i++) {
            if(index == i) {
                return node;
            }
            node = node.getTail();
        }
        throw new IndexOutOfBoundsException(index);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("[");
        Node<T> node = this.head;
        for (int i = 0; i < this.size; i++) {
            if (i != 0) {
                sb.append(", ");
            }
            sb.append(node.getValue());
            node = node.getTail();

        }
        return sb.append("]").toString();
    }

    private static class Node<T> {

        private final T value;
        private Node<T> head;
        private Node<T> tail;

        public Node(T value, Node<T> head, Node<T> tail) {
            this.value = value;
            this.head = head;
            this.tail = tail;
        }

        public Node(T value) {
            this.value = value;
            this.head = null;
            this.tail = null;
        }

        public T getValue() {
            return value;
        }

        public Node<T> getHead() {
            return head;
        }

        public Node<T> getTail() {
            return tail;
        }

        public void setHead(Node<T> head) {
            this.head = head;
        }

        public void setTail(Node<T> tail) {
            this.tail = tail;
        }
    }
}
