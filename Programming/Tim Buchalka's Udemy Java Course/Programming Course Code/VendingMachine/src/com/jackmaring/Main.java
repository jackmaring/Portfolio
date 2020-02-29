package com.jackmaring;

import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);

    private static VendingMachine<DrinkItem> drinkVendingMachine = new VendingMachine<>("Drink Vending Machine");
    private static VendingMachine<FoodItem> foodVendingMachine = new VendingMachine<>("Food Vending Machine");
    private static VendingMachine<Item> itemVendingMachine = new VendingMachine<>("Item Vending Machine");

    public static void main(String[] args) {
        vending();
    }

    public static void vending() {
        drinkVendingMachine.addItem(1, new DrinkItem("Coke", 2.50), 5);
        drinkVendingMachine.addItem(2, new DrinkItem("Sprite", 3.00), 4);
        drinkVendingMachine.addItem(3, new DrinkItem("Lemonade", 4.00), 6);

        foodVendingMachine.addItem(1, new FoodItem("Twix", 1.50), 3);
        foodVendingMachine.addItem(2, new FoodItem("Kit Kat", 2.50), 6);
        foodVendingMachine.addItem(3, new FoodItem("Chips", 2.00), 5);

        itemVendingMachine.addItem(1, new DrinkItem("Youth Water", 100.00), 2);
        itemVendingMachine.addItem(2, new FoodItem("Ambrosia", 50.00), 3);
        itemVendingMachine.addItem(3, new Item("Badass Shit", 0.99), 5);

        System.out.println("Your choices for vending machines are: \n" +
                "\n" +
                "(1) " + drinkVendingMachine.displayItems() + "\n" +
                "\n" +
                "(2) " + foodVendingMachine.displayItems() + "\n" +
                "\n" +
                "(3) " + itemVendingMachine.displayItems() + "\n" +
                "\n" +
                "Please enter either 1, 2, or 3");


        int vendingMachineChoice = scanner.nextInt();
        vendingChoice(vendingMachineChoice);

        System.out.println();

        System.out.println("Please enter either 1, 2, or 3");
        int slotChoice = scanner.nextInt();
        slotChoice(slotChoice);

        }

    public static void vendingChoice(int choice) {
        if(choice == 1) {
            System.out.println("You chose " + drinkVendingMachine.getName() + "! Your choices are: \n" +
                    drinkVendingMachine.anotherDisplayItems());
        } else if(choice == 2) {
            System.out.println("You chose " + foodVendingMachine.getName() + "! Your choices are: \n" +
                    foodVendingMachine.anotherDisplayItems());
        } else if(choice == 3) {
            System.out.println("You chose " + itemVendingMachine.getName() + "! Your choices are: \n" +
                    itemVendingMachine.anotherDisplayItems());
        } else {
            System.out.println("Please enter correct number");
        }
    }

    public static void slotChoice(int choice) {
        if(choice == 1) {
            drinkVendingMachine.dispenseItem(1);
        } else if(choice == 2) {
            foodVendingMachine.dispenseItem(2);
        } else if(choice == 3) {
            itemVendingMachine.dispenseItem(3);
        }
    }

}
