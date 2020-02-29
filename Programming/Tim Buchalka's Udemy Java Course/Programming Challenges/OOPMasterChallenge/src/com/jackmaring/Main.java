package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Hamburger burger = new Hamburger();

        burger.addAddition(new Cheese());
        burger.addAddition(new Lettuce());
        burger.addAddition(new Tomato());
        burger.addAddition(new Onion());

        burger.printHamburgerAdditionsAndTotalPrice();

        System.out.println("------------------------------------");

        HealthyBurger healthyBurger = new HealthyBurger();

        healthyBurger.addAddition(new Cheese());
        healthyBurger.addAddition(new Lettuce());
        healthyBurger.addAddition(new Tomato());
        healthyBurger.addAddition(new Onion());
        healthyBurger.addHealthyAddition(new Yogurt());
        healthyBurger.addHealthyAddition(new Fruit());

        healthyBurger.printHealthyBurgerAdditionsAndTotalPrice();

        System.out.println("------------------------------------");

        DeluxeBurger deluxeBurger = new DeluxeBurger();
        
        deluxeBurger.printDeluxeAdditionsAndPrice();

    }
}
