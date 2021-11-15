package com.funnyboyroks.three.LinkedList;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List; // Only here for creating Queue with items

public class Queue<T> implements java.util.Queue<T> {

    public static void main(String[] args) {
        Queue<Integer> ints = new Queue<>(List.of(1, 2, 3));
        System.out.println(ints.poll());
        ints.addAll(List.of(3, 2, 1));
//        ints.clear();

        for (Integer anInt : ints) {
            System.out.println(anInt);
        }
        System.out.println("contains 3? - " + ints.contains(3));
        System.out.println(ints);
    }

    protected Node<T> head = null;
    protected Node<T> tail = null;
    protected int size = 0;
    protected int capacity = -1;

    public Queue() {
        this.head = null;
        this.tail = null;
    }

    public Queue(int capacity) {
        this.capacity = capacity;
    }

    public Queue(Collection<T> items) {
        super();
        this.addAll(items);
    }

    /**
     * Set the maximum capacity of the Queue
     *
     * @param capacity The new capacity
     * @return If the current size is greater than the new capacity
     */
    public boolean setCapacity(int capacity) {
        this.capacity = capacity;
        return this.size > this.capacity;
    }

    public int size() {
        return this.size;
    }

    public boolean isEmpty() {
        return this.size == 0 || this.head == null || this.tail == null;
    }

    public boolean contains(Object o) {
        Node<T> node = this.head;
        int i = 0;
        while(node != null && i < this.size) {
            if(node.getValue() == o) return true;
            node = node.getTail();
            ++i;
        }
        return false;

    }

    @Override
    public Iterator<T> iterator() {
        try {
            return new QueueIterator<>(this);
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Object[] toArray() {
        Object[] arr = new Object[this.size];
        for (int i = 0; i < this.size(); i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }

    @Override
    public <T1> T1[] toArray(T1[] t1s) {
        T1[] arr = Arrays.copyOf(t1s, this.size);
        for (int i = 0; i < this.size(); i++) {
            arr[i] = (T1) this.get(i);
        }
        return arr;
    }

    public T get(int index) {
        return this.getNode(index).getValue();
    }

    public boolean add(T item) {
        if (this.capacity == size++ && this.capacity > -1) {
            throw new IllegalStateException("Queue capacity is full.");
        }
        if (this.head == null) {
            this.head = this.tail = new Node<>(item);
            return true;
        }
        Node<T> n = new Node<>(item);
        n.setTail(this.head);
        n.setHead(this.tail);
        this.tail.setTail(n);
        this.tail = n;
        this.head.setHead(n);
        return true;
    }

    @Override
    public boolean remove(Object o) {
        for (int i = 0; i < this.size(); i++) {
            Node<T> n = this.getNode(i);
            if (o == n.getValue()) {
                this.getNode(i - 1).setTail(this.getNode(i + 1));
                if (n == this.head) {
                    this.tail = this.head.getTail();
                    this.head = this.tail.getTail();
                }
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> collection) {
        return collection.stream().map(this::contains).reduce((a, b) -> a && b).orElse(true);
    }

    @Override
    public boolean addAll(Collection<? extends T> collection) {
        collection.forEach(this::add);
        return true;
    }

    @Override
    public boolean removeAll(Collection<?> collection) {
        throw new RuntimeException("Not yet implemented!");
    }

    @Override
    public boolean retainAll(Collection<?> collection) {
        throw new RuntimeException("Not yet implemented!");
    }

    @Override
    public void clear() {
        this.head = this.tail = null;
    }

    @Override
    public boolean offer(T t) {
        return this.add(t);
    }

    @Override
    public T remove() {
        if (this.size <= 0) throw new IndexOutOfBoundsException();
        --this.size;
        T o = this.tail.getValue();
        (this.head.head = this.tail = this.tail.head).tail = this.head;
        return o;
    }

    @Override
    public T poll() {
        return this.remove();
    }

    @Override
    public T element() {
        return this.peek();
    }

    @Override
    public T peek() {
        return this.tail == null ? null : this.tail.getValue();
    }

    protected Node<T> getNode(int index) {
        if (index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException(index);
        }
        Node<T> node = this.head;
        for (int i = 0; i < this.size; i++) {
            if (index == i) {
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
        for (int i = 0; i < this.size && node != null; i++) {
            if (i != 0) {
                sb.append(", ");
            }
            sb.append(node.getValue());
            node = node.getTail();

        }
        return sb.append("]").toString();
    }

    @Override
    protected Queue<T> clone() throws CloneNotSupportedException {
//        super.clone();
        Queue<T> q = new Queue<>();
        Node<T> node = this.head;
        int i = 0;
        while(node != null && i < size) {
            q.add(node.getValue());
            node = node.getTail();
            ++i;
        }
        return q;
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

    private static class QueueIterator<T> implements Iterator<T> {

        Queue<T> data;

        QueueIterator(Queue<T> data) throws CloneNotSupportedException {
            this.data = data.clone(); // Clone it
        }

        @Override
        public boolean hasNext() {
            return !data.isEmpty();
        }

        @Override
        public T next() {
            if (!hasNext()) {
                throw new RuntimeException("No next value");
            }
            return data.poll();
        }
    }
}
