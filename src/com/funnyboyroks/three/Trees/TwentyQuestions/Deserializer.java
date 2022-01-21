package com.funnyboyroks.three.Trees.TwentyQuestions;

import com.funnyboyroks.three.Trees.TwentyQuestions.BinaryTree.Node;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public class Deserializer {

    private static final int LEFT = 1001;
    private static final int RIGHT = 1002;
    private static final int ROOT = 1003;
    private static final int DOWN = 1004;

    private final File file;

    public Deserializer(String path) {
        this(new File(path));
    }

    public Deserializer(File file) {
        this.file = file;
    }

    private Iterator<GameData> linesIterator; // lines iterator to help with recursion

    public BinaryTree<String> deserialize() {
        List<GameData> lines = getLines();
        if (lines == null) return null;
        this.linesIterator = lines.iterator();
        var tree = new BinaryTree<>(this.linesIterator.next().value);
        generateTree(tree.root);
        return tree;
    }

    private void generateTree(Node<String> node) {
        try {
            var next = this.linesIterator.next();
            node.left = new Node<>(next.value);
            if (!next.leaf) {
                generateTree(node.left);
            }
            next = this.linesIterator.next();
            node.right = new Node<>(next.value);
            if (!next.leaf) {
                generateTree(node.right);
            }
        } catch (NoSuchElementException ex) {
            throw new IllegalArgumentException("Invalid Tree Structure in File!", ex);
        }
    }

    private List<GameData> getLines() {
        try {
            // One-liner, why not :)
            return Files.readString(this.file.toPath())
                .replaceAll("([QA]):\n", "$1:§") // Convert from the format of A:\nValue to A:§Value
                .lines()
                .map(l -> new GameData(l.substring(l.indexOf('§') + 1), l.toUpperCase().startsWith("A:")))
                .toList();
        } catch (IOException ex) {
            System.out.printf("Unable to load file %s.%n", file.getName());
            ex.printStackTrace();
            return null;
        }
    }

    public record GameData(String value, boolean leaf) {

        @Override
        public String toString() {
            return (leaf ? "A: " : "Q: ") + value;
        }
    }
}
