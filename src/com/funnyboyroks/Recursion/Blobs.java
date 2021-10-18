package com.funnyboyroks.Recursion;

public class Blobs {

    private static final int[][] matrix = new int[20][20];
    private static int maxX = 4;
    private static int maxY = 4;

    public static void main(String[] args) {

//        long startTime = System.currentTimeMillis();
        fillMatrix();
//        System.out.println("Took " + (System.currentTimeMillis() - startTime) + "ms to fill matrix");
//
//        double size = matrix.length * matrix[0].length;
//        System.out.println((matSum(matrix) / size) * 100 + "% set to 1");
//
//        startTime = System.currentTimeMillis();
//        System.out.println(getLargestBlob(matrix));
//        System.out.println("Took " + (System.currentTimeMillis() - startTime) + "ms to get largest blob");
        print(matrix);

        int count = floodCount(4, 4, deepCloneMatrix(matrix));

        System.out.println(count);

    }

    public static int getLargestBlob(int[][] matrix) {
        int maxSize = Integer.MIN_VALUE;
        // Efficiency, what's that??
        for (int y = 0; y < matrix.length; y++) {
            for (int x = 0; x < matrix[y].length; x++) {
                int count = floodCount(x, y, deepCloneMatrix(matrix));
                if (count > maxSize) {
                    maxSize = count;
                    maxX = x;
                    maxY = y;
                }
            }
        }
        System.out.println("Max coords: (" + maxX + ", " + maxY + ")");
        return maxSize;
    }

    public static int getSmallestBlob(int[][] matrix) {
        int minSize = Integer.MAX_VALUE;
        // Efficiency, what's that??
        for (int y = 0; y < matrix.length; y++) {
            for (int x = 0; x < matrix[y].length; x++) {
                int count = floodCount(x, y, deepCloneMatrix(matrix));
                if (count < minSize) {
                    minSize = count;
                    maxX = x;
                    maxY = y;
                }
            }
        }
        System.out.println("Min coords: (" + maxX + ", " + maxY + ")");
        return minSize;
    }

    private static int[][] deepCloneMatrix(int[][] og) {
        int[][] out = new int[og.length][];
        for (int i = 0; i < out.length; i++) {
            out[i] = og[i].clone();
        }
        return out;
    }

    private static void fillMatrix() {
        for (int y = 0; y < matrix.length; y++) {
            for (int x = 0; x < matrix[y].length; x++) {
                matrix[y][x] = (int) Math.round(Math.random());
            }
        }
    }

    public static int matSum(int[][] matrix) {
        int sum = 0;
        for (int[] row : matrix) {
            for (int i : row) {
                sum += i;
            }
        }
        return sum;
    }

    public static int floodCount(int x, int y, int[][] matrix) {

        if (y >= matrix.length || y < 0 || x >= matrix[0].length || x < 0 || matrix[y][x] != 1) {
            return 0;
        }

        matrix[y][x] = 0;

        return 1 +
            floodCount(x - 1, y, matrix) +
            floodCount(x + 1, y, matrix) +
            floodCount(x, y + 1, matrix) +
            floodCount(x, y - 1, matrix);


    }


    /**
     * Print a matrix in a nicely formatted fashion
     *
     * @param mat The matrix to print
     */
    public static void print(int[][] mat) {
        StringBuilder sb = new StringBuilder();
        for (int yi = 0; yi < mat.length; yi++) {
            int[] row = mat[yi];
            for (int xi = 0; xi < row.length; xi++) {
                int i = row[xi];
                if (xi == maxX && yi == maxY) {
                    sb.append("\033[41m");
                }
                sb.append(i).append("\033[0m").append(' ');
            }
            sb.append('\n');
        }
        System.out.println(sb);
    }

}
