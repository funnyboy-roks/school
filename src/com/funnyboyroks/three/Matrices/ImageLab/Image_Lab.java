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
        /**Insert your code here!
         Think of "pixels" as a normal matrix
         */
        for (int i = 0; i < pixels.length; i++) {
            reverseArr(pixels[i]);
        }

        panel.setPixels(pixels);
    }

    public static void reverseArr(Color[] arr) {
        Color[] t = arr.clone();
        for (int i = 1; i < arr.length + 1; ++i) {
            arr[arr.length - i] = t[i - 1];
        }
    }

    //Rotates the image clockwise by 90 degrees(a quarter turn)
    public static void rotateClockwise(DrawingPanel panel) {
        Color[][] pixels = panel.getPixels();
        Color[][] out = new Color[pixels.length][pixels[0].length];

        for (int y = 0; y < pixels.length; y++) {
            Color[] row = pixels[y];
            for (int x = 0; x < row.length; x++) {
                Color pixel = row[x];
                if (x <= pixels.length && y <= pixels[0].length) {
                    out[x][y] = pixel;
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
            Color[] row = pixels[i];
            for (int j = 0; j < row.length; j++) {
                Color px = row[j];
                int r = 255 - px.getRed();
                int g = 255 - px.getGreen();
                int b = 255 - px.getBlue();
                row[j] = new Color(r, g, b);
            }
        }

        panel.setPixels(pixels);
    }
}