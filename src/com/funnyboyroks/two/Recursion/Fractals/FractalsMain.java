package com.funnyboyroks.two.Recursion.Fractals;

import com.funnyboyroks.three.Matrices.ImageLab.DrawingPanel;

import java.awt.*;

class FractalsMain {

    public static DrawingPanel panel;
    public static Graphics graphics;

    public static final double THETA = Math.PI / 20.0;

    public static void main(String[] args) {
        // This is the code used to create the image you see on the panel.

        panel = new DrawingPanel(800, 800); // The Canvas
        panel.setBackground(Color.WHITE);
        graphics = panel.getGraphics(); // Create the paintbrush

        // Everything else in main is for adding aspects to the canvas

        graphics.setColor(Color.BLACK); // Setting the paintbrush to the color BLACK

        graphics.drawLine(panel.getWidth() / 2, panel.getHeight(), panel.getWidth() / 2, panel.getHeight() - 200);
        tree(200, panel.getWidth() / 2, panel.getHeight() - 200, 0);
    }

    public static void tree(int len, int offsetX, int offsetY, double angle) {
        if (len <= 2) return;

        len *= .75;

        int x = (int) (len * Math.sin(angle));
        int y = (int) (len * Math.cos(angle));

        graphics.drawLine(offsetX, offsetY, offsetX + x, offsetY - y);
        tree(len, offsetX + x, offsetY - y, angle + THETA);


        x = (int) (len * Math.sin(-angle));
        y = (int) (len * Math.cos(-angle));

        graphics.drawLine(offsetX, offsetY, offsetX + x, offsetY - y);
        tree(len, offsetX + x, offsetY - y, angle + THETA);


//        drawLine(offsetX, offsetY, len, THETA);
//        drawLine(offsetX, offsetY, len, -THETA);

    }

    public static void drawLine(int offsetX, int offsetY, int len, double rotation) {
    }
}