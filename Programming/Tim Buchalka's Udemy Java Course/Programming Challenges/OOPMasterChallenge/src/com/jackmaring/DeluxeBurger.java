package com.jackmaring;

public class DeluxeBurger extends Hamburger {

    private String name;
    private double price;
    private String bunType;
    private String meat;
    private DeluxeAddition fries;
    private DeluxeAddition drink;

    public DeluxeBurger() {
        this.name = "Deluxe Burger";
        this.price = 6.00;
        this.bunType = "White";
        this.meat = "Beef";
        this.fries = new Fries();
        this.drink = new Drink();
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public double getPrice() {
        return price;
    }

    @Override
    public String getBunType() {
        return bunType;
    }

    @Override
    public String getMeat() {
        return meat;
    }

    @Override
    public void addAddition(Addition addition) {
        System.out.println("You can't add any additions to a deluxe burger");
    }

    @Override
    public void printAdditions() {
        System.out.println(getName() + ": " + getPrice());
        System.out.println(fries.getName() + ": " + fries.getPrice());
        System.out.println(drink.getName() + ": " + drink.getPrice());
    }

    @Override
    public double calculatePrice() {
        return getPrice() + fries.getPrice() + drink.getPrice();
    }

    public void printDeluxeAdditionsAndPrice() {
        printAdditions();
        System.out.println("Your total price is: " + calculatePrice());
    }
}
