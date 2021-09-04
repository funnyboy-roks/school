package com.funnyboyroks.three.Matrices.Rotation;

import java.util.Random;

public class AdvancedMatrixRotation {

    public static void main(String[] args) {

        int[][] mat = countedMatrix(4, 4);

        System.out.println("Before: ");
        print(mat);

        rotate(mat);

        System.out.println("After: ");
        print(mat);

    }

    /**
     * Rotate a full matrix clockwise (Recursive)
     *
     * @param mat    The matrix to rotate
     * @param amount The amount of times to rotate (negative to rotate anti-clockwise)
     */
    public static void rotate(int[][] mat, int amount) {
        for (int i = 0; i < Math.abs(amount); ++i) {
            rotate(mat, amount < 0);
        }
    }

    /**
     * Rotate full matrix clockwise (Recursive)
     *
     * @param mat The matrix to rotate
     */
    public static void rotate(int[][] mat) {
        rotate(mat, true);
    }

    /**
     * Rotate full matrix (Recursive)
     *
     * @param mat       The matrix to rotate
     * @param clockwise Should it rotate clockwise?
     */
    public static void rotate(int[][] mat, boolean clockwise) {
        int[] values = getBorder(mat);
        setBorder(mat, rotate(values, clockwise));
        if (mat.length <= 2 || mat[0].length <= 2) return;
        int[][] sub = getSubMatrix(mat);
        rotate(sub, clockwise);
        setSubMatrix(mat, sub);
    }

    /**
     * Get the matrix that is one level down
     *
     * @param mat The parent matrix
     * @return The output matrix
     */
    public static int[][] getSubMatrix(int[][] mat) {
        int[][] out = new int[mat.length - 2][mat[0].length - 2];
        int ox, oy = 0;
        for (int y = 1; y < mat.length - 1; y++) {
            ox = 0;
            for (int x = 1; x < mat[y].length - 1; x++) {
                out[oy][ox] = mat[y][x];
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
        int ox, oy = 0;
        for (int y = 1; y < mat[0].length - 1; y++) {
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
     * @param arr   The array to rotate
     * @param right If the array should be rotated to the right
     * @return The rotated array
     */
    public static int[] rotate(int[] arr, boolean right) {
        int[] out = new int[arr.length]; // Output array
        if (right) {
            out[0] = arr[arr.length - 1];
            System.arraycopy(arr, 0, out, 1, arr.length - 1); // Copy the array to the right by one value
        } else {
            out[out.length - 1] = arr[0];
            System.arraycopy(arr, 1, out, 0, arr.length - 1);
        }
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
        int[] values = new int[mat.length * 2 + (mat[0].length - 2) * 2]; // The border values
        int pos = 0; // The position to add new values

        // Add top row values
        for (int n : mat[0]) {
            values[pos] = n;
            ++pos;
        }
        // Add right side values
        for (int i = 1; i < mat.length - 1; ++i) {
            values[pos] = mat[i][mat[i].length - 1];
            ++pos;
        }
        // Add bottom row values
        int[] lastRow = mat[mat.length - 1];
        for (int i = lastRow.length - 1; i >= 0; i--) {
            values[pos] = lastRow[i];
            pos++;

        }
        // Add left side values
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
        int pos = 0; // The position to read new values to set
        // Set top row values
        for (int i = 0; i < mat[0].length; i++) {
            mat[0][i] = values[pos];
            ++pos;
        }
        // Set right side values
        for (int i = 1; i < mat.length - 1; ++i) {
            mat[i][mat[i].length - 1] = values[pos];
            ++pos;
        }
        // Set bottom row values
        int[] lastRow = mat[mat.length - 1];
        for (int i = lastRow.length - 1; i >= 0; i--) {
            lastRow[i] = values[pos];
            pos++;

        }
        // Set left side values
        for (int i = mat.length - 2; i >= 1; i--) {
            mat[i][0] = values[pos];
            ++pos;
        }
    }

    /**
     * Create a counted matrix for testing purposes
     *
     * @param rows The amount of rows in the matrix
     * @param cols The amount of columns in the matrix
     * @return The created matrix
     */
    public static int[][] countedMatrix(int rows, int cols) {
        int[][] out = new int[cols][rows];

        int i = 0;
        for (int y = 0; y < out.length; y++) {
            for (int x = 0; x < out[y].length; x++) {
                out[y][x] = i % 10; // Don't go higher than 10 to keep to single digits
                ++i;
            }
        }
        return out;
    }

    /**
     * Create a random matrix for testing purposes
     *
     * @param rows The amount of rows in the matrix
     * @param cols The amount of columns in the matrix
     * @return The created matrix
     */
    public static int[][] randomMatrix(int rows, int cols) {
        int[][] out = new int[cols][rows];
        Random rand = new Random();

        for (int y = 0; y < out.length; y++) {
            for (int x = 0; x < out[y].length; x++) {
                out[y][x] = rand.nextInt(10);
            }
        }
        return out;
    }

    /**
     * Print a matrix in a nicely formatted fashion
     *
     * @param mat The matrix to print
     */
    public static void print(int[][] mat) {
        StringBuilder sb = new StringBuilder();
        for (int[] row : mat) {
            for (int i : row) {
                sb.append(i).append(' ');
            }
            sb.append('\n');
        }
        System.out.println(sb);
    }
}
