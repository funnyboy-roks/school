package com.funnyboyroks.three.Matrices.FallingSand;

import java.awt.*;
import java.util.Random;

public class SandLab {

    public static void main(String[] args) {
        SandLab lab = new SandLab(120, 80);
        lab.run();
    }

    // add constants for particle types here
    public static final int EMPTY = 0;
    public static final int METAL = 1;
    public static final int SAND = 2;
    public static final int WATER = 3;

    // do not add any more fields
    private int[][] grid;
    private SandDisplay display;

    public SandLab(int numRows, int numCols) {
        String[] names = {
            "Empty",
            "Metal",
            "Sand",
            "Water",
        };
        display = new SandDisplay("Cypress Ranch Lab: Falling Sand", numRows, numCols, names);
        grid = new int[numRows][numCols];
    }

    // called when the user clicks on a location using the given tool
    private void locationClicked(int row, int col, int tool) {
        grid[row][col] = tool;
    }

    // copies each element of grid into the display
    public void updateDisplay() {
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                int t = grid[i][j];
                Color c = Color.BLUE;
                switch (t) {
                    case METAL:
                        c = Color.LIGHT_GRAY;
                        break;
                    case SAND:
                        c = Color.YELLOW;
                        break;
                    case WATER:
                        c = Color.CYAN;
                        break;
                }
                display.setColor(i, j, c);
            }
        }
    }

    // called repeatedly.
    // causes one random particle to maybe do something.
    public void step() {
        Random rand = new Random();
        int x = rand.nextInt(grid[0].length);
        int y = rand.nextInt(grid.length);
        if (y == grid.length - 1) return;
        if (grid[y + 1][x] != EMPTY && grid[y + 1][x] != WATER) return;
        int t = grid[y][x];
        switch (t) {
            case SAND: {
                int y1 = y + 1;
                locationClicked(y, x, EMPTY);
                locationClicked(y1, x, SAND);
            }
            break;
            case WATER: {
                int y1 = y, x1 = x;
                int dir = rand.nextInt(2);
                try {
                    switch (dir) {
                        case 0:
                            y1++;
                            break;
                        case 1:
                            x1++;
                            break;
                        case 2:
                            x1--;
                            break;
                    }
                } catch (ArrayIndexOutOfBoundsException e) {
                    return;
                }
                locationClicked(y, x, EMPTY);
                if(x1 >= 0 && x1 < grid[0].length) {
                    locationClicked(y1, x1, WATER);
                }
            }
            break;
        }

    }

    // do not modify
    public void run() {
        while (true) {
            for (int i = 0; i < display.getSpeed(); i++) {
                step();
            }
            updateDisplay();
            display.repaint();
            display.pause(1);  // wait for redrawing and for mouse
            int[] mouseLoc = display.getMouseLocation();
            if (mouseLoc != null)  // test if mouse clicked
            {
                locationClicked(mouseLoc[0], mouseLoc[1], display.getTool());
            }
        }
    }
}
