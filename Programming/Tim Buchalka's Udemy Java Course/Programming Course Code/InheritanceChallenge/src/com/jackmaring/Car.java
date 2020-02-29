package com.jackmaring;

public class Car extends Vehicule {

    private int doors;
    private int seats;
    private String model;
    private String color;

    public Car(int speed, int capacity, int doors, int seats, String model, String color) {
        super(4, "Medium", speed, capacity);
        this.doors = doors;
        this.seats = seats;
        this.model = model;
        this.color = color;
    }

    public int getDoors() {
        return doors;
    }

    public void setDoors(int doors) {
        this.doors = doors;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void steer(String direction) {
        System.out.println("You decided to steer the car " + direction);
    }

    public void changeGear(int gear) {
        System.out.println("You changed to gear " + gear);
    }

    @Override
    public void changeSpeed(int speed) {
        System.out.println("Your " + getModel() + " is now going " + speed);
    }
}
