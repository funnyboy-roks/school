package com.funnyboyroks.three.Matrices.Rotation;

import java.util.Arrays;

public class AdvancedMatrixRotation {

    public static void main(String[] args) {

        int[][] mat = {
            {0, 1, 2, 3},
            {4, 5, 6, 7},
            {8, 9, 0, 1},
            {2, 3, 4, 5},
            };

        rotate(mat);

        System.out.println(Arrays.deepToString(mat));

    }

    /**
     * Rotate the full matrix (Recursive)
     *
     * @param mat The matrix to rotate(Must be square)
     */
    public static void rotate(int[][] mat) {
        if (mat.length != mat[0].length) throw new IllegalArgumentException("mat must be a square matrix");
        int[] values = getBorder(mat);
        setBorder(mat, rotate(values));
        if (mat.length == 2) return;
        int[][] sub = getSubMatrix(mat);
        rotate(sub);
        setSubMatrix(mat, sub);
//        System.out.println(Arrays.toString(values));
    }

    /**
     * Get the matrix that is one level down
     *
     * @param mat The parent matrix
     * @return The output matrix
     */
    public static int[][] getSubMatrix(int[][] mat) {
        int[][] out = new int[mat.length - 2][mat.length - 2];
        int oy = 0;
        int ox = 0;
        for (int y = 1; y < mat.length - 1; y++) {
            ox = 0;
            for (int x = 1; x < mat.length - 1; x++) {
                out[ox][oy] = mat[x][y];
                ++ox;
            }
            ++oy;
        }
        return out;
    }

    /**
     * Set the matrix that is one level down
     *
     * @param mat The parent matrix
     */
    public static void setSubMatrix(int[][] mat, int[][] sub) {
        int oy = 0;
        int ox = 0;
        for (int y = 1; y < mat.length - 1; y++) {
            ox = 0;
            for (int x = 1; x < mat.length - 1; x++) {
                mat[x][y] = sub[ox][oy];
                ++ox;
            }
            ++oy;
        }
    }

    /**
     * Rotate the values of a 1D array
     *
     * @param arr The array to rotate
     * @return The rotated array
     */
    public static int[] rotate(int[] arr) {
        int[] out = new int[arr.length]; // Output array
        out[0] = arr[arr.length - 1];
        System.arraycopy(arr, 0, out, 1, arr.length - 1); // Copy the array to the right by one value
        return out;
    }

    /**
     * Get the border items from the matrix
     * <br>
     * <strong>B</strong> in the example:
     * <br>
     * <code>
     * <strong>B B B B</strong><br>
     * <strong>B</strong> 1 1 <strong>B</strong><br>
     * <strong>B</strong> 1 1 <strong>B</strong><br>
     * <strong>B B B B</strong><br>
     * </code>
     *
     * @param mat The matrix
     * @return The border items
     */
    public static int[] getBorder(int[][] mat) {

        int[] values = new int[mat.length * 2 + (mat.length - 2) * 2];
        int pos = 0; // The position to add new values
        for (int n : mat[0]) {
            values[pos] = n;
            ++pos;
        }
        for (int i = 1; i < mat.length - 1; ++i) {
            values[pos] = mat[i][mat[i].length - 1];
            ++pos;
        }
        int[] lastRow = mat[mat.length - 1];
        for (int i = lastRow.length - 1; i >= 0; i--) {
            values[pos] = lastRow[i];
            pos++;

        }
        for (int i = mat.length - 2; i >= 1; i--) {
            values[pos] = mat[i][0];
            ++pos;
        }
        return values;
    }

    /**
     * Set the border items of the matrix
     *
     * @param mat    The matrix
     * @param values The new border items to use
     */
    public static void setBorder(int[][] mat, int[] values) {

        int pos = 0; // The position to read new values
        for (int i = 0; i < mat[0].length; i++) {
            mat[0][i] = values[pos];
            ++pos;
        }
        for (int i = 1; i < mat.length - 1; ++i) {
            mat[i][mat[i].length - 1] = values[pos];
            ++pos;
        }
        int[] lastRow = mat[mat.length - 1];
        for (int i = lastRow.length - 1; i >= 0; i--) {
            lastRow[i] = values[pos];
            pos++;

        }
        for (int i = mat.length - 2; i >= 1; i--) {
            mat[i][0] = values[pos];
            ++pos;
        }
    }
}
