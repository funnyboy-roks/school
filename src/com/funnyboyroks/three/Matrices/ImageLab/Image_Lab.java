package com.funnyboyroks.three.Matrices.ImageLab;

import java.awt.*;

class Image_Lab {

    public static void main(String[] args) {
        //This is the code used to create the image you see on the panel.
        //I would make changes after you completed the 2 functions!

        DrawingPanel panel = new DrawingPanel(300, 300); //The Canvas
        panel.setBackground(Color.WHITE);
        Graphics g = panel.getGraphics();//The paintbrush

        g.setColor(Color.RED);
        g.drawString("Hello, world!", 20, 50);

        g.setColor(Color.BLACK);
        g.fillOval(10, 100, 20, 70);

        // Draw cyan/green rect on bottom of panel
        g.setColor(Color.CYAN);
        g.fillRect(0, panel.getHeight() - 50, panel.getWidth(), 50);
        g.setColor(Color.GREEN);
        g.drawRect(0, panel.getHeight() - 50, panel.getWidth(), 50);

        mirror(panel);
        negative(panel);
        rotateClockwise(panel);
    }

    //Flips the pixels of the given drawing panel horizontally
    public static void mirror(DrawingPanel panel) {
        Color[][] pixels = panel.getPixels();
        // Loop through each row and reverse it
        for (int i = 0; i < pixels.length; i++) {
            reverseArray(pixels[i]);
        }

        panel.setPixels(pixels);
    }

    /**
     * Reverses an array
     *
     * @param array The array to reverse
     */
    public static void reverseArray(Color[] array) {
        Color[] t = array.clone();
        for (int i = 1; i < array.length + 1; ++i) {
            array[array.length - i] = t[i - 1];
        }
    }

    //Rotates the image clockwise by 90 degrees(a quarter turn)
    public static void rotateClockwise(DrawingPanel panel) {
        Color[][] pixels = panel.getPixels();
        Color[][] out = new Color[pixels.length][pixels[0].length]; // A temp holding spot that will be used to set the new array

        for (int y = 0; y < pixels.length; y++) {
            Color[] row = pixels[y]; // Single row in Matrix
            for (int x = 0; x < row.length; x++) {
                Color pixel = row[x]; // Single pixel item
                if (x <= pixels.length && y <= pixels[0].length) {
                    out[x][y] = pixel; // Se the pixel
                }
            }
        }

        panel.setPixels(out);
    }

    //BONUS: Produces the negative of the given image by inverting all
    //RGB values in the matrix
    public static void negative(DrawingPanel panel) {
        Color[][] pixels = panel.getPixels();
        //Remember that every pixel is a Color object that has
        //a Red, Blue and Green Color value.
        for (int i = 0; i < pixels.length; i++) {
            Color[] row = pixels[i]; // The row
            for (int j = 0; j < row.length; j++) {
                Color px = row[j]; // The pixel (used for colour info 🠗)
                int r = 255 - px.getRed();
                int g = 255 - px.getGreen();
                int b = 255 - px.getBlue();
                row[j] = new Color(r, g, b); // Set the new colour
            }
        }

        panel.setPixels(pixels);
    }
}