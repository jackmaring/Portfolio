package com.jackmaring;

public class Vehicule {

    private int wheels;
    private String size;
    private int speed;
    private int capacity;

    public Vehicule(int wheels, String size, int speed, int capacity) {
        this.wheels = wheels;
        this.size = size;
        this.speed = speed;
        this.capacity = capacity;
    }

    public int getWheels() {
        return wheels;
    }

    public void setWheels(int wheels) {
        this.wheels = wheels;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public void changeSpeed(int speed) {
        System.out.println("This vehicule is now going " + speed);
    }

}
