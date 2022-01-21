package com.funnyboyroks.three.Trees.TwentyQuestions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BinaryTree<T> {

    public Node<T> root;

    public BinaryTree() {
        this.root = null;
    }

    public BinaryTree(T data) {
        this.root = new Node<T>(data);
    }

    public BinaryTree(Node<T> root) {
        this.root = root;
    }

    @SafeVarargs
    public final <N> List<N> join(List<N>... lists) {
        List<N> arr = new ArrayList<>();
        for (List<N> list : lists) {
            arr.addAll(list);
        }
        return arr;
    }

    public List<Node<T>> preOrder() {
        return this.root == null ? Collections.emptyList() : this.root.preOrder();
    }

    public int getHeight() {
        if (this.root == null) return 0;
        return this.root.getHeight();
    }

    public static class Node<T> {

        public T value;
        public Node<T> left;
        public Node<T> right;


        public Node(T data) {
            this.value = data;
        }

        public boolean isLeaf() {
            return this.left == null && this.right == null;
        }

        public List<Node<T>> preOrder() {
            List<Node<T>> list = new ArrayList<>();
            list.add(this);
            if (this.left != null) list.addAll(this.left.preOrder());
            if (this.right != null) list.addAll(this.right.preOrder());
            return list;
        }

        public int getHeight() {
            int l = this.left == null ? -1 : this.left.getHeight();
            int r = this.right == null ? -1 : this.right.getHeight();
            if (l != -1 && r != -1) {
                return Math.max(l, r);
            }
            return 1;
        }
    }
}
