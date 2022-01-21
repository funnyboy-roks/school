package com.funnyboyroks.three.Trees.TwentyQuestions;

import java.io.PrintStream;
import java.util.Scanner;

public class QuestionsGame {

    public static void main(String[] args) {
        Serializer serializer = new Serializer("test.txt");
        var tree = new BinaryTree<String>();
        tree.root = new BinaryTree.Node<>("Hello World");
        tree.root.left = new BinaryTree.Node<>("Question 2 Test");
        tree.root.right = new BinaryTree.Node<>("Answer Test");
//        tree.root.right.left = new BinaryTree.Node<>("Answer Test");
        serializer.serialize(tree);

        Deserializer deserializer = new Deserializer("test.txt");
        var treeD = deserializer.deserialize();
        System.out.println(treeD);
        System.out.println(treeD.preOrder().stream().map(n -> (n.isLeaf() ? "A: " : "Q: ") + n.value).toList());
    }

    static {
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            System.out.println("Shutdown");
        }, "Shutdown-Thread"));
    }

    private final BinaryTree<String> questionTree = null;
    private final Serializer serializer;
    private final Deserializer deserializer;

    private QuestionsGame() {
        this.serializer = new Serializer("file.txt");
        this.deserializer = new Deserializer("file.txt");
    }

    public QuestionsGame(Scanner userInput) {
        this();
    }

    public QuestionsGame(String initialObject) {
        this();
    }


    public void play() {

    }

    public void save(PrintStream printStream) {
        serializer.serialize(questionTree);
    }
}