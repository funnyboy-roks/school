package com.funnyboyroks.three.Matrices;

import java.util.Arrays;
import java.util.Scanner;

public class Matrix2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Rows");
        int rows = scanner.nextInt();

        System.out.println("Columns");
        int cols = scanner.nextInt();

        int[][] matrix = new int[rows][cols];

        int c = 1;
        for (int i = 0; i < cols; ++i) {
            for (int j = 0; j < rows; ++j) {
                if (i % 2 == 0) {
                    matrix[i][j] = c;
                } else {
                    matrix[i][j] = c 
                }
                ++c;
            }
        }

        System.out.println(
        Arrays.deepToString(matrix)
        );

    }

}
