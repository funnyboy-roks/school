package com.funnyboyroks.three.ImageEnhancer;

import java.util.ArrayList;
import java.util.List;

public class CustomStack<T> {

    List<T> items;

    public CustomStack() {
        this.items = new ArrayList<>();
    }

    public void push(T item) {
        this.items.add(item);
    }

    public T pop() {
        return this.items.remove(0);
    }

    public T peek() {
        return this.items.get(0);
    }

    public T get(int i) {
        return this.items.get(i);
    }

    public int size() {
        return this.items.size();
    }

    public int getArraySize() {
        return size();
    }

    public int getSize() {
        return size();
    }

    public void clear() {
        this.items.clear();
    }

    public boolean isEmpty() {
        return this.items.isEmpty();
    }

    @Override
    public String toString() {
        return items.toString();
    }



}
