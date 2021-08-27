package com.funnyboyroks.three.Matrices.PascalsTriangle;

import java.util.Arrays;

/**
 * Pascal's Triangle done in Java with jagged matrices
 */
public class PascalsTriangle {

    public static void main(String[] args) {
        int height = 10;

        int[][] mat = new int[height][];
        mat[0] = new int[]{1};

        for (int i = 1; i < mat.length - 1; i++) {
            mat[i] = getNext(mat[i - 1]);
        }

        System.out.println(Arrays.deepToString(mat));

    }

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
}
