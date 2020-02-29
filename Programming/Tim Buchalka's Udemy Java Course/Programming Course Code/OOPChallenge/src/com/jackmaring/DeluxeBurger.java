package com.jackmaring;

public class DeluxeBurger extends Hamburger {

    private Chips chips;
    private Drink drink;

    public DeluxeBurger(Chips chips, Drink drink) {
        this.price = 4.50;
        this.meat = "beef";
        this.bread = "basic";
        this.chips = chips;
        this.drink = drink;
        this.additionCounter = 2;
    }

    @Override
    public void getContents() {
        System.out.println("You have a burger, " + chips.getName() + ", and " + drink.getName() + " at " + price);
    }
}
