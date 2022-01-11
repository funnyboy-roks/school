package com.funnyboyroks.three.Trees;

import java.util.*;
import java.util.stream.Collectors;

public class BinarySearchTree<T> {

    public static void main(String[] args) {
//        BinarySearchTree<Integer> tree = new BinarySearchTree<>(Comparator.comparingInt(String::length));
        BinarySearchTree<Integer> tree = new BinarySearchTree<>(Integer::compare);
        tree.add(2);
        tree.add(12);
        tree.add(35);
        tree.add(8);
        tree.add(16);
        tree.add(7);
//        System.out.println(tree);
        System.out.println(tree.toString2());
        System.out.println(tree.getSize());
        System.out.println(tree.inOrderTransversal());
        tree.remove(12);
        System.out.println(tree.getSize());
        System.out.println(tree.inOrderTransversal());
    }

    public final Comparator<T> comparator;
    public Node<T> root;

    public BinarySearchTree(Comparator<T> comparator) {
        this.root = null;
        this.comparator = comparator;
    }

    public BinarySearchTree(Comparator<T> comparator, T rootValue) {
        this.root = new Node<>(rootValue);
        this.comparator = comparator;
    }

    public T find(T value) {
        if (this.root == null) return null;
        return this.root.find(value, comparator);
    }

    public void add(T value) {
        if (root == null){
            this.root = new Node<>(value);
            return;
        }

        this.root.add(value, this.comparator);
    }

    public int getSize() {
        if(this.root == null) return 0;
        return this.root.size();
    }

    /**
     * If the tree contains the provided value, relies on the {@link Comparator} provided
     */
    public boolean contains(T value) {
        return root != null && root.contains(value);
    }

    public boolean remove(T value) {
        return this.root.remove(value, this);
    }

    public List<T> inOrderTransversal() {
        return this.root.inOrderTransversal().stream().map(Node::value).collect(Collectors.toList());
    }

    public boolean clear() {
        if(this.root == null) return false;
        this.root = null;
        return true;
    }

    public boolean isEmpty() {
        return this.root == null;
    }

    @Override
    public String toString() {
        return "BinarySearchTree{" +
               "comparator=" + comparator +
               ", root=" + root +
               '}';
    }

    public String toString2() {
        return String.join("\n", this.root.toStringList(0, ""));
    }

    private static final class Node<T> {

        private final T value;
        private Node<T> left;
        private Node<T> right;

        private Node(T value, Node<T> left, Node<T> right) {
            this.value = value;
            this.left = left;
            this.right = right;
        }

        private Node(T value) {
            this(value, null, null);
        }

        public T value() {
            return value;
        }

        public Node<T> left() {
            return left;
        }

        public Node<T> right() {
            return right;
        }

        public void left(Node<T> val) {
            left = val;
        }

        public void right(Node<T> val) {
            right = val;
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (obj == null || obj.getClass() != this.getClass()) return false;
            var that = (Node) obj;
            return Objects.equals(this.value, that.value) &&
                   Objects.equals(this.left, that.left) &&
                   Objects.equals(this.right, that.right);
        }

        @Override
        public int hashCode() {
            return Objects.hash(value, left, right);
        }

        @Override
        public String toString() {
            return "Node[" +
                   "value=" + value + ",\n" +
                   "left=" + left + ",\n" +
                   "right=" + right + ']';
        }


        public void add(T value, Comparator<T> comparator) {
            int comp = comparator.compare(value, this.value);
            if (comp == 0) throw new IllegalArgumentException(value + " already exists in tree");
            Node<T> newNode = new Node<>(value);
            boolean left = comp < 0;
            Node<T> node = left ? this.left() : this.right();
            if (node != null) {
                node.add(value, comparator);
                return;
            }
            if (left) {
                this.left(newNode);
                return;
            }
            this.right(newNode);
        }

        public boolean contains(T value) {
            return this.value().equals(value)
                   || this.left() != null && this.left().contains(value)
                   || this.right() != null && this.right().contains(value);
        }

        public List<String> toStringList(int indentation, String prefix) {
            List<String> values = new ArrayList<>();
            String indent = "  ".repeat(Math.max(0, indentation - 1));
            if (indentation != 0) indent += "- ";
            values.add(indent + prefix + this.value);
            indentation++;
            if (this.left() != null || this.right() != null) {
                if (this.left() != null) {
                    values.addAll(this.left().toStringList(indentation, "L: "));
                } else {
                    values.add("  " + indent + "L: ");
                }
                if (this.right() != null) {
                    values.addAll(this.right().toStringList(indentation, "R: "));
                } else {
                    values.add("  " + indent + "R: ");
                }
            }
            return values.stream().filter(s -> !s.isBlank()).toList();
        }

        public T find(T value, Comparator<T> comparator) {
            int comp = comparator.compare(value, this.value);
            if (comp == 0) {
                return this.value();
            } else if (comp > 0) {
                return this.right() == null ? null : this.right().find(value, comparator);
            } else {
                return this.left() == null ? null : this.left().find(value, comparator);
            }
        }

        public boolean remove(T value, BinarySearchTree<T> tree) {
            if (this.left() != null) {
                if (this.left().value().equals(value)) {
                    List<T> values = this.left()
                        .inOrderTransversal()
                        .stream()
                        .map(Node::value)
                        .filter(n -> !n.equals(value)) // I'm too lazy to do this properly :P
                        .toList();

                    this.left(null);
                    tree.addAll(values);
                    return true;
                }
                if(this.left().remove(value, tree)) {
                    return true;
                }
            }
            if (this.right() != null) {
                if (this.right().value().equals(value)) {
                    List<T> values = this.right()
                        .inOrderTransversal()
                        .stream()
                        .map(Node::value)
                        .filter(n -> !n.equals(value)) // I'm too lazy to do this properly :P
                        .toList();

                    this.right(null);
                    tree.addAll(values);
                    return true;
                }
                return this.right().remove(value, tree);
            }
            return false;
        }

        public List<Node<T>> inOrderTransversal() {
            List<Node<T>> l = new ArrayList<>();
            if (this.left != null) {
                l.addAll(this.left.inOrderTransversal());
            }
            l.add(this);
            if (this.right != null) {
                l.addAll(this.right.inOrderTransversal());
            }
            return l;
        }

        public int size() {
            int size = 1;
            if(this.left() != null) {
                size += this.left().size();
            }
            if(this.right() != null) {
                size += this.right().size();
            }
            return size;

        }
    }



    private void addAll(Collection<T> values) {
        values.forEach(this::add);
    }

}
