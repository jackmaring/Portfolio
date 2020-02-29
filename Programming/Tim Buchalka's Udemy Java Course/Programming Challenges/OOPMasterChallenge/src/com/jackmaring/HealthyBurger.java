package com.jackmaring;

public class HealthyBurger extends Hamburger {

    private String name;
    private double price;
    private String bunType;
    private String meat;
    private HealthyAddition yogurt;
    private HealthyAddition fruit;
    private boolean hasYogurt = false;
    private boolean hasFruit = false;

    public HealthyBurger() {
        this.name = "Healthy Burger";
        this.price = 5.00;
        this.bunType = "Brown Rye";
        this.meat = "Turkey";
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

    public boolean hasYogurt() {
        return hasYogurt;
    }

    public void setYogurt(boolean hasYogurt) {
        this.hasYogurt = hasYogurt;
    }

    public boolean hasFruit() {
        return hasFruit;
    }

    public void setFruit(boolean hasFruit) {
        this.hasFruit = hasFruit;
    }
    
    public void addHealthyAddition(HealthyAddition addition) {
        if (addition.getName().equals("Yogurt")) {
            setYogurt(true);
            this.yogurt = new Yogurt();
        } else if (addition.getName().equals("Fruit")) {
            setFruit(true);
            this.fruit = new Fruit();
        } else {
            System.out.println("You can't add this addition");
        }
    }

    @Override
    public void printAdditions() {
        super.printAdditions();
        if (hasYogurt) {
            System.out.println(yogurt.getName() + ": " + yogurt.getPrice());
        }
        if (hasFruit) {
            System.out.println(fruit.getName() + ": " + fruit.getPrice());
        }
    }

    @Override
    public double calculatePrice() {
        double healthyBurgerPrice = super.calculatePrice();
        if (hasYogurt) {
            healthyBurgerPrice += yogurt.getPrice();
        }
        if (hasFruit) {
            healthyBurgerPrice += fruit.getPrice();
        }
        return healthyBurgerPrice;
    }

    public void printHealthyBurgerAdditionsAndTotalPrice() {
        printAdditions();
        System.out.println("The total price is: " + calculatePrice());
    }
}
