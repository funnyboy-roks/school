package com.funnyboyroks.three.Queues.CheckoutLineSim;

import java.util.*;

public class Customers {

    public static class Random extends Customer {

        public Random(int items) {
            super(items);
        }

        @Override
        public Queue<Customer> selectQueue(List<Queue<Customer>> items) {
            return items.get((int) (Math.random() * items.size()));
        }
    }

    public static class Select1 extends Customer {

        public Select1(int items) {
            super(items);
        }

        @Override
        public Queue<Customer> selectQueue(List<Queue<Customer>> items) {
            List<Queue<Customer>> qs = new ArrayList<>(items);
            qs.sort(Comparator.comparingInt(Collection::size));
            return qs.get(0);
        }
    }

    public static class Select2 extends Customer {

        public Select2(int items) {
            super(items);
        }

        @Override
        public Queue<Customer> selectQueue(List<Queue<Customer>> items) {
            List<Queue<Customer>> qs = new ArrayList<>(items);
            qs.sort(Comparator.comparingInt(Collection::size));
            return qs.get(0).size() < qs.get(1).size() ? qs.get(0) : qs.get(1);
        }
    }
}
