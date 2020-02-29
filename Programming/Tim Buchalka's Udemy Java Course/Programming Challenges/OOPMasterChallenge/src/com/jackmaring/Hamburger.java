package com.jackmaring;

public class Hamburger {

    private String name;
    private double price;
    private String bunType;
    private String meat;
    private Addition cheese;
    private Addition onion;
    private Addition lettuce;
    private Addition tomato;
    private boolean hasLettuce = false;
    private boolean hasTomato = false;
    private boolean hasCheese = false;
    private boolean hasOnion = false;

    public Hamburger() {
        this.name = "Basic Burger";
        this.price = 4.00;
        this.bunType = "white";
        this.meat = "beef";
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getBunType() {
        return bunType;
    }

    public String getMeat() {
        return meat;
    }

    public boolean hasLettuce() {
        return hasLettuce;
    }

    public void setLettuce(boolean hasLettuce) {
        this.hasLettuce = hasLettuce;
    }

    public boolean hasTomato() {
        return hasTomato;
    }

    public void setTomato(boolean hasTomato) {
        this.hasTomato = hasTomato;
    }

    public boolean hasCheese() {
        return hasCheese;
    }

    public void setCheese(boolean hasCheese) {
        this.hasCheese = hasCheese;
    }

    public boolean hasOnion() {
        return hasOnion;
    }

    public void setOnion(boolean hasOnion) {
        this.hasOnion = hasOnion;
    }

    public void addAddition(Addition addition) {
        if (addition.getName().equals("Lettuce")) {
            setLettuce(true);
            this.lettuce = new Lettuce();
        } else if (addition.getName().equals("Tomato")) {
            setTomato(true);
            this.tomato = new Tomato();
        } else if (addition.getName().equals("Onion")) {
            setOnion(true);
            this.onion = new Onion();
        } else if (addition.getName().equals("Cheese")) {
            setCheese(true);
            this.cheese = new Cheese();
        } else {
            System.out.println("You can't add this addition");
        }
    }

    public void printAdditions() {
        System.out.println(getName() + ": " + getPrice());
        if (hasCheese) {
            System.out.println(cheese.getName() + ": " + cheese.getPrice());
        }
        if (hasLettuce) {
            System.out.println(lettuce.getName() + ": " + lettuce.getPrice());
        }
        if (hasTomato) {
            System.out.println(tomato.getName() + ": " + tomato.getPrice());
        }
        if (hasOnion) {
            System.out.println(onion.getName() + ": " + onion.getPrice());
        }
    }

    public double calculatePrice() {
        double totalPrice = getPrice();
        if (hasCheese) {
            totalPrice += cheese.getPrice();
        }
        if (hasLettuce) {
            totalPrice += lettuce.getPrice();
        }
        if (hasTomato) {
            totalPrice += tomato.getPrice();
        }
        if (hasOnion) {
            totalPrice += onion.getPrice();
        }
        return totalPrice;
    }

    public void printHamburgerAdditionsAndTotalPrice() {
        printAdditions();
        System.out.println("Your total price is: " + calculatePrice());
    }

}
