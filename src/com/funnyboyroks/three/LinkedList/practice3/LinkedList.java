package com.funnyboyroks.three.LinkedList.practice3;

// Linked List before Generics were introduced
public class LinkedList {

    private Node head;

    public LinkedList() {
        this.head = null;
    }

    public void add(Object item) {
        if (this.head == null) {
            this.head = new Node(item);
            return;
        }
        Node curr = this.head;
        while (curr.getNext() != null) {
            curr = curr.getNext();
        }
        curr.setNext(new Node(item));
    }

    public void add(int index, Object item) {
        if (this.head == null) {
            this.head = new Node(item);
            return;
        }
        Node prev = getNode(index - 1);
        Node next = getNode(index);

        Node insert = new Node(item);
        insert.setNext(next);
        prev.setNext(insert);

    }

    public int size() {
        Node curr = this.head;
        if (this.head == null) return 0;
        int count = 1;
        while (curr.getNext() != null) {
            curr = curr.getNext();
            ++count;
        }
        return count;
    }

    public Object get(int index) {
        return getNode(index).getValue(); // Possible NPE, but consider that an error for out of bounds :)
    }

    private Node getNode(int index) {
        if (this.head == null) return null;
        Node curr = this.head;
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
        Node curr = this.head;
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
        Node prev = getNode(index - 1);
        Node curr = getNode(index);

        prev.setNext(curr.getNext());
    }

    public int indexOf(Object item) {
        int i = 0;
        Node curr = this.head;
        while (curr != null) {
            if (curr.getValue() == item) return i;
            ++i;
            curr = curr.getNext();
        }
        return -1;
    }

    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        list.add(1); // [1]
        list.add(2); // [1, 2]
        list.add(3); // [1, 2, 3]
        list.add(1, 2); // [1, 2, 2, 3]
        list.remove(2); // [1, 2, 3]
        System.out.println(list.size()); // 3
        System.out.println(list.indexOf(3)); // 2
        System.out.println(list); // [1, 2, 3]
    }

}
