package com.funnyboyroks.three.Graphs;

public class Graph {

    public static void main(String[] args) {
        // Test Graph class
        Graph graph = new Graph(5);
        graph.addEdge(0, 1);
        graph.addEdge(0, 4);
        graph.addEdge(1, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 3);
        graph.addEdge(3, 4);
        graph.printGraph();
        System.out.println();
        graph.visualiseGraph();
    }

    private int[][] adjMatrix;
    private int size;

    public Graph(int size) {
        this.size = size;
        adjMatrix = new int[size][size];
    }

    public void addEdge(int v1, int v2) {
        adjMatrix[v1][v2] = 1;
        adjMatrix[v2][v1] = 1;
    }

    public void removeEdge(int v1, int v2) {
        adjMatrix[v1][v2] = 0;
        adjMatrix[v2][v1] = 0;
    }

    public boolean isEdge(int v1, int v2) {
        return adjMatrix[v1][v2] == 1;
    }

    public int getSize() {
        return size;
    }

    public int[][] getAdjMatrix() {
        return adjMatrix;
    }

    public void printGraph() {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print(adjMatrix[i][j] + " ");
            }
            System.out.println();
        }
    }

    public void visualiseGraph() {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print(adjMatrix[i][j] + " ");
            }
            System.out.println();
        }
    }

}
