package com.jackmaring;

public class Lamborghini extends Car {

    private String name;

    public Lamborghini(int speed, int capacity, int doors, int seats, String model, String color, String name) {
        super(speed, capacity, doors, seats, model, color);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void lamborghiniLurkin() {
        System.out.println("Your " + getModel() + " " + name + " raised its " + getDoors() + " doors.");
    }

}
