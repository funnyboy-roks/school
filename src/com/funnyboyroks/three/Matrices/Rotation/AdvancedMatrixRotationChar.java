package com.funnyboyroks.three.Matrices.Rotation;

import java.util.Random;

public class AdvancedMatrixRotationChar {

    public static void main(String[] args) {

        char[][] mat = countedMatrix(5, 8);

        System.out.println("Before: ");
        print(mat);

        rotate(mat, -1);

        System.out.println("After: ");
        print(mat);

    }

    /**
     * Rotate a full matrix clockwise (Recursive)
     *
     * @param mat    The matrix to rotate
     * @param amount The amount of times to rotate (negative to rotate anti-clockwise)
     */
    public static void rotate(char[][] mat, int amount) {
        for (int i = 0; i < Math.abs(amount); ++i) {
            rotate(mat, amount >= 0);
        }
    }

    /**
     * Rotate full matrix clockwise (Recursive)
     *
     * @param mat The matrix to rotate(Must be square)
     */
    public static void rotate(char[][] mat) {
        rotate(mat, true);
    }

    /**
     * Rotate full matrix (Recursive)
     *
     * @param mat       The matrix to rotate(Must be square)
     * @param clockwise Should it rotate clockwise?
     */
    public static void rotate(char[][] mat, boolean clockwise) {
        char[] values = getBorder(mat);
        setBorder(mat, rotate(values, clockwise));
        if (mat.length <= 2 || mat[0].length <= 2) return;
        char[][] sub = getSubMatrix(mat);
        rotate(sub);
        setSubMatrix(mat, sub);
    }

    /**
     * Get the matrix that is one level down
     *
     * @param mat The parent matrix
     * @return The output matrix
     */
    public static char[][] getSubMatrix(char[][] mat) {
        char[][] out = new char[mat.length - 2][mat[0].length - 2];
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
    public static void setSubMatrix(char[][] mat, char[][] sub) {
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
    public static char[] rotate(char[] arr, boolean right) {
        char[] out = new char[arr.length]; // Output array
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
    public static char[] getBorder(char[][] mat) {
        char[] values = new char[mat.length * 2 + (mat[0].length - 2) * 2]; // The border values
        int pos = 0; // The position to add new values

        // Add top row values
        for (char n : mat[0]) {
            values[pos] = n;
            ++pos;
        }
        // Add right side values
        for (int i = 1; i < mat.length - 1; ++i) {
            values[pos] = mat[i][mat[i].length - 1];
            ++pos;
        }
        // Add bottom row values
        char[] lastRow = mat[mat.length - 1];
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
    public static void setBorder(char[][] mat, char[] values) {
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
        char[] lastRow = mat[mat.length - 1];
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
    public static char[][] countedMatrix(int rows, int cols) {
        char[][] out = new char[cols][rows];

        int i = 0;
        for (int y = 0; y < out.length; y++) {
            for (int x = 0; x < out[y].length; x++) {
                out[y][x] = (char) ((i % 94) + 33);
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
    public static char[][] randomMatrix(int rows, int cols) {
        char[][] out = new char[cols][rows];
        Random rand = new Random();

        for (int y = 0; y < out.length; y++) {
            for (int x = 0; x < out[y].length; x++) {
                char c = (char) (rand.nextInt(94) + 33);
            }
        }
        return out;
    }

    /**
     * Print a matrix in a nicely formatted fashion
     *
     * @param mat The matrix to print
     */
    public static void print(char[][] mat) {
        StringBuilder sb = new StringBuilder();
        for (char[] row : mat) {
            for (char i : row) {
                sb.append(i).append(' ');
            }
            sb.append('\n');
        }
        System.out.println(sb);
    }
}
