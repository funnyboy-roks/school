package com.funnyboyroks.three.LinkedList.practice2;

public class LinkedList<T> {

    private Node<T> head;

    public LinkedList() {
        this.head = null;
    }

    public void add(T item) {
        if (this.head == null) {
            this.head = new Node<>(item);
            return;
        }
        Node<T> curr = this.head;
        while (curr.getNext() != null) {
            curr = curr.getNext();
        }
        curr.setNext(new Node<>(item));
    }

    public void add(int index, T item) {
        if (this.head == null) {
            this.head = new Node<>(item);
            return;
        }
        Node<T> prev = getNode(index - 1);
        Node<T> next = getNode(index);

        Node<T> insert = new Node<>(item);
        insert.setNext(next);
        prev.setNext(insert);

    }

    public int size() {
        Node<T> curr = this.head;
        if (this.head == null) return 0;
        int count = 1;
        while (curr.getNext() != null) {
            curr = curr.getNext();
            ++count;
        }
        return count;
    }

    public T get(int index) {
        return getNode(index).getValue(); // Possible NPE, but consider that an error for out of bounds :)
    }

    private Node<T> getNode(int index) {
        if (this.head == null) return null;
        Node<T> curr = this.head;
        while (curr != null) {
            if (index == 0) {
                return curr;
            }
            --index;
            curr = curr.getNext();
        }
        return null;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("[");
        Node<T> curr = this.head;
        if (this.head == null) return "[]";
        while (curr != null) {
            sb.append(curr.getValue());
            if (curr.getNext() != null) {
                sb.append(", ");
            }
            curr = curr.getNext();
        }
        return sb.append("]").toString();

    }

    public void remove(int index) {
        if (index == 0) {
            this.head = this.head.getNext();
            return;
        }
        Node<T> prev = getNode(index - 1);
        Node<T> curr = getNode(index);

        prev.setNext(curr.getNext());
    }

    public int indexOf(T item) {
        int i = 0;
        Node<T> curr = this.head;
        while (curr != null) {
            if (curr.getValue() == item) return i;
            ++i;
            curr = curr.getNext();
        }
        return -1;
    }

    public static void main(String[] args) {
        LinkedList<Integer> list = new LinkedList<>();
        list.add(1); // [1]
        list.add(2); // [1, 2]
        list.add(3); // [1, 2, 3]
        list.add(1, 2); // [1, 2, 2, 3]
        list.remove(2); // [1, 2, 3]
        System.out.println(list.size());
        System.out.println(list.indexOf(3));
        System.out.println(list);
    }

}
