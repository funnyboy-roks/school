package com.funnyboyroks.three.ImageEnhancer;

import java.awt.image.BufferedImage;
import java.util.Arrays;
import java.util.EmptyStackException;

public class BufferedImageQueue {

    BufferedImage[] items;
    int currentInput = 0;
    int currentOutput = 0;

    public BufferedImageQueue() {
        this.items = new BufferedImage[2];
    }

    private void extendArray() {
        BufferedImage[] newArr = new BufferedImage[this.items.length * 2];
        System.arraycopy(this.items, 0, newArr, 0, this.items.length);
        this.items = newArr;

    }

    public void push(BufferedImage img) {

        if (this.currentInput == this.items.length || this.items[this.items.length - 1] != null) {
            extendArray();
        }

        this.items[this.currentInput] = img;
        ++this.currentInput;

    }

    public boolean isEmpty() {
        return this.currentInput == this.currentOutput || this.items[this.currentOutput] == null;
    }

    public BufferedImage pop() {
        if (this.isEmpty()) throw new EmptyStackException();

        BufferedImage out = this.items[this.currentOutput];
        this.items[this.currentOutput] = null;

        ++this.currentOutput;
        return out;
    }

    public BufferedImage get(int index) {
        BufferedImage img = this.items[index + this.currentOutput];
        if (img == null) throw new IndexOutOfBoundsException();
        return img;
    }

    public int getSize() {
        return this.currentInput - this.currentOutput;
    }

    public int getArraySize() {
        return this.items.length;
    }

    public void reset() {
        this.items = new BufferedImage[2];
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("BufferedImageStack{");
        sb.append("items=").append(Arrays.toString(items));
        sb.append(", currentInput=").append(currentInput);
        sb.append(", currentOutput=").append(currentOutput);
        sb.append('}');
        return sb.toString();
    }
}
