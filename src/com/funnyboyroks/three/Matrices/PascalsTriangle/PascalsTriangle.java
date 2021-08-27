package com.funnyboyroks.three.Matrices.PascalsTriangle;

import java.util.Arrays;

/**
 * Pascal's Triangle done in Java with jagged matrices
 */
public class PascalsTriangle {

    public static void main(String[] args) {

        int[][] mat = pascal(5);
        System.out.println(prettify(mat));
    }

    /**
     * Generate pascal's triangle in a matrix
     *
     * @param rows The amount of rows
     * @return The output matrix
     */
    public static int[][] pascal(int rows) {
        int[][] mat = new int[rows][];
        mat[0] = new int[]{1};

        for (int i = 1; i < mat.length; i++) {
            mat[i] = getNext(mat[i - 1]);
        }
        return mat;
    }

    /**
     * Get the next step in the triangle
     *
     * @param prev The preview layer
     * @return The next layer
     */
    public static int[] getNext(int... prev) {
        int[] out = new int[prev.length + 1];
        int p = 0; // Store previous value
        for (int i = 0; i < out.length; i++) {
            int n2 = i == prev.length ? 0 : prev[i];
            out[i] = p + n2;
            p = n2;
        }
        return out;
    }

    /**
     * Prettify the 2d matrix to make it a triangle
     * @param mat The matrix
     * @return The formatted String
     */
    public static String prettify(int[][] mat) {
        int padAmt = mat[mat.length-1].length;
        StringBuilder sb = new StringBuilder();
        for (int[] row : mat) {
            sb.append(" ".repeat(padAmt));
            for (int i : row) {
                sb.append(i).append(' ');
            }
            sb.append(" ".repeat(padAmt));
            padAmt--;
            sb.append('\n');
        }
        return sb.toString();
    }
}
