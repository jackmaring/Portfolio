package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Cheese cheese = new Cheese();
        Chips chips = new Chips();
        Drink drink = new Drink();
        Lettuce lettuce = new Lettuce();
        Onion onion = new Onion();
        Tomato tomato = new Tomato();
        Avocado avacado = new Avocado();
        Yogurt yogurt = new Yogurt();

        Hamburger hamburger1 = new Hamburger();
        hamburger1.addThreeAdditions(cheese, tomato, lettuce);
        hamburger1.getContents();

        HealthyBurger healthyBurger1 = new HealthyBurger();
        healthyBurger1.addSixAdditions(cheese, lettuce, onion, tomato, avacado, yogurt);
        healthyBurger1.getContents();
        System.out.println(healthyBurger1.getBread());

        DeluxeBurger deluxeBurger1 = new DeluxeBurger(chips, drink);
        deluxeBurger1.getContents();

    }
}
