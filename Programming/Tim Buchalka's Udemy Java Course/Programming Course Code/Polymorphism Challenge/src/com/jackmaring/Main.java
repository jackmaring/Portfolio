package com.jackmaring;

class Car {

    private String engine;
    private int wheels;
    private int cylinders;

    public Car(String engine, int cylinders) {
        this.engine = engine;
        this.wheels = 4;
        this.cylinders = cylinders;
    }

    public String startEngine() {
        return "Car engine has started";
    }

    public String accelerate() {
        return "Car is now accelerating";
    }

    public String brake() {
        return "Your car has hit the breaks";
    }

    public String getEngine() {
        return engine;
    }

    public int getWheels() {
        return wheels;
    }

    public int getCylinders() {
        return cylinders;
    }
}

class Toyota extends Car {

    private String name;

    public Toyota(String engine, int cylinders, String name) {
        super(engine, cylinders);
        this.name = name;
    }

    @Override
    public String startEngine() {
        return getName() + " engine has started";
    }

    public String getName() {
        return name;
    }
}

class Peugot extends Car {

    private String name;

    public Peugot(String engine, int cylinders, String name) {
        super(engine, cylinders);
        this.name = name;
    }

    @Override
    public String startEngine() {
        return getName() + " engine has started";
    }

    public String getName() {
        return name;
    }
}

class Forgetable extends Car {

    private String name;

    public Forgetable(String engine, int cylinders, String name) {
        super(engine, cylinders);
        this.name = name;
    }

    @Override
    public String startEngine() {
        return super.startEngine();
    }

    public String getName() {
        return name;
    }
}


public class Main {

    public static void main(String[] args) {

        Car car = new Car("big", 2);
        System.out.println(car.startEngine());

        Toyota toyota = new Toyota("big", 2, "4Runner");
        System.out.println(toyota.startEngine());

        Peugot peugot = new Peugot("big", 4, "francais");
        System.out.println(peugot.startEngine());

        Forgetable ayy = new Forgetable("small", 1, "pee pee poo poo");
        System.out.println(ayy.startEngine());

    }
}
