package com.funnyboyroks.three.Queues.CheckoutLineSim;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class Main {

    public static final List<Queue<Customer>> queues = new ArrayList<>();
    public static final int CUSTOMER_CREATE_SPEED = 2; // Cycles between creating a new customer

    public static void main(String[] args) {
        for (int i = 0; i < 10; ++i) { // Create 10 queues
            Queue<Customer> q = new LinkedList<>();
//            for(int j = 0; j < Math.random() * 5; j++) {
//                q.add(new Customers.Random((int) (Math.random() * 20)));
//            }
            queues.add(q);
        }
        for (int i = 0; i < 15; i++) { // Create customers
            Customer customer = new Customers.Select2(10);
            customer.update();

        }

        queues.forEach(System.out::println);

        DrawHandler.runLoop(0.1); // Don't remove this line, but feel free to change the parameter
    }

    public static Customer createCustomer() {
        // Use this to create a new customer using whatever class you make.

        return new Customers.Select2((int) (Math.random() * 50));
    }
}
