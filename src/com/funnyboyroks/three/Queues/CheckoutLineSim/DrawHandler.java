package com.funnyboyroks.three.Queues.CheckoutLineSim;

import java.awt.*;
import java.util.ArrayList;
import java.util.Queue;

public class DrawHandler {

    public static final DrawingPanel panel = new DrawingPanel();
    public static final Graphics graphics = panel.getGraphics();

    public static void drawBg() {
        panel.clear();
        int lines = Main.queues.size();
        for (int i = 0; i < lines; ++i) {
            int x = i * (panel.getWidth() / lines);
            graphics.drawLine(x, panel.getHeight(), x, 200);
            graphics.drawString(i + "", x, 100);
        }
    }

    public static void runLoop(double speed) {
        while (true) {
            try {
                Thread.sleep((long) (speed * 1000));
                DrawHandler.run();
            } catch (InterruptedException e) {
                System.exit(1);
            }
        }
    }

    private static int iterations = 0;
    private static void run() {
        ++iterations;
        drawBg();
        for (Queue<Customer> q : Main.queues) {
            for (int i = 0; i < q.size(); i++) {
                Customer c = new ArrayList<>(q).get(i);
                c.update();
            }
        }
        if(iterations % Main.CUSTOMER_CREATE_SPEED == 0) {
            Main.createCustomer().update();
        }
    }
}
