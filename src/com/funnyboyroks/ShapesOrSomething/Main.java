package com.funnyboyroks.ShapesOrSomething;

class Main {

    public static void main(String[] args) {

        Shape circle = new Circle(5);

        System.out.println(circle.calculateArea());
        System.out.println(circle.calculateCircumference());

        Triangle triangle = new Triangle(10, 5);

        System.out.println(triangle.calculateArea());
        System.out.println(triangle.calculateCircumference());

        triangle.setBase(10);
        triangle.setBase(5);

        System.out.println(triangle.calculateArea());
        System.out.println(triangle.calculateCircumference());

    }

}
