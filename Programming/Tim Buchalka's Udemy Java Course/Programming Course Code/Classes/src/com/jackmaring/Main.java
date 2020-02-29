package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Car porsche = new Car();
        Car holdan = new Car();

        porsche.setModel("Carrera");
        System.out.println("Model is " + porsche.getModel());
    }
}
