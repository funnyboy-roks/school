package com.funnyboyroks.three.Queues.CheckoutLineSim;

import java.awt.*;
import java.util.List;
import java.util.Queue;

public abstract class Customer {

    private int items;
    private Queue<Customer> queue;

    public Customer(int items) {

        this.items = items;
        this.queue = null;
    }

    public int getItems() {
        return items;
    }

    public void setItems(int items) {
        this.items = items;
    }

    public void decrementItems() {
        --this.items;
    }

    private void draw() {
        Graphics graphics = DrawHandler.graphics;
        DrawingPanel panel = DrawHandler.panel;

        int posX = Main.queues.indexOf(this.queue);
        int posY = List.of(this.queue.toArray()).indexOf(this);

        int colWidth = (panel.getWidth() / Main.queues.size());
        int x = ((colWidth - 25) / 2) + colWidth * (posX);

        int y = panel.getHeight() - ((posY + 1) * 30);

        graphics.drawString(this.items + "", x, y + 25);

        graphics.drawRect(x, y, 25, 25);
    }

    public void update() {
        if (this.queue == null) {
            (this.queue = this.selectQueue(Main.queues)).add(this);
        }

        int position = this.queue.stream().toList().indexOf(this);

        switch (position) {
            case -1:
                return;
            case 0:
                if (this.items > 0) {
                    this.decrementItems();
                }
            default:
                if (this.items == 0) {
                    this.queue.poll();
                }
        }

        this.draw();

    }

    @Override
    public String toString() {
        return "Customer{items=" + items + "}";
    }

    public abstract Queue<Customer> selectQueue(List<Queue<Customer>> items);
}
