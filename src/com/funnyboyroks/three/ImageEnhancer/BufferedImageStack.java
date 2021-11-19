package com.funnyboyroks.three.ImageEnhancer;

import java.awt.image.BufferedImage;
import java.util.Arrays;
import java.util.EmptyStackException;

public class BufferedImageStack {

    BufferedImage[] items;
    int end = -1;

    public BufferedImageStack() {
        this.items = new BufferedImage[2];
    }

    private void extendArray() {
        BufferedImage[] newArr = new BufferedImage[this.items.length * 2];
        System.arraycopy(this.items, 0, newArr, 0, this.items.length);
        this.items = newArr;

    }

    public void push(BufferedImage img) {

        if (this.end == this.items.length || this.items[this.items.length - 1] != null) {
            extendArray();
        }

        this.items[++this.end] = img;

    }

    public boolean isEmpty() {
        return this.end == -1 || this.items[this.end] == null;
    }

    public BufferedImage pop() {
        if (this.isEmpty()) throw new EmptyStackException();

        BufferedImage out = this.items[this.end];
        this.items[this.end--] = null;
        return out;
    }

    public BufferedImage get(int index) {
        BufferedImage img = this.items[index + this.end];
        if (img == null) throw new IndexOutOfBoundsException();
        return img;
    }

    public int getSize() {
        return this.end + 1;
    }

    public int getArraySize() {
        return this.items.length;
    }

    public void reset() {
        this.items = new BufferedImage[2];
    }

    @Override
    public String toString() {
        return "BufferedImageStack{items=" + Arrays.toString(items) +
            ", currentOutput=" + end +
            '}';
    }
}
