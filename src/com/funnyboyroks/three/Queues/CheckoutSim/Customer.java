package com.funnyboyroks.three.Queues.CheckoutSim;

import java.util.ArrayList;
import java.util.List;

/**
 * A class to store Customer data
 */
public abstract class Customer {

    public static final List<Customer> instances = new ArrayList<>();
    private int items;

    public Customer() {
        instances.add(this);
        this.items = 0;
    }

    public Customer(int items) {
        super();
        this.items = items;
    }

    public int getItems() {
        return items;
    }

    public void setItems(int items) {
        this.items = items;
    }

    public void draw() {

    }
}
