package com.jackmaring;

import java.util.Stack;

public class VendingMachine<T extends Item> {

    private String name;
    private Slot slot1;
    private Slot slot2;
    private Slot slot3;

    public VendingMachine(String name) {
        this.name = name;
        this.slot1 = new Slot();
        this.slot2 = new Slot();
        this.slot3 = new Slot();
    }

    public String getName() {
        return name;
    }

    public Stack<T> getSlotItems(Slot slot) {
        return slot.getSlotItems();
    }

    public int getQuantity(Slot slot) {
        int sum = 0;
        for (Item item : slot.getSlotItems()) {
            sum ++;
        }
        return sum;
    }

    public void addItem(int slot, T item, int quantity) {
        if(slot == 1) {
            for(int i=0; i<quantity; i++) {
                this.slot1.addItem(item);
            }
        } else if(slot == 2) {
            for(int i=0; i<quantity; i++) {
                this.slot2.addItem(item);
            }
        } else if(slot == 3) {
            for(int i=0; i<quantity; i++) {
                this.slot3.addItem(item);
            }
        } else {
            System.out.println("Please enter correct slot number");
        }
    }

    public void dispenseItem(int slot) {
        if(slot == 1) {
            if(getQuantity(slot1) > 0) {
                System.out.println("You got a " + this.slot1.getSlotItems().peek().getName() + "!");
                this.slot1.dispenseItem();
            } else {
                System.out.println("Sorry there is no more " + this.slot1.getSlotItems().peek().getName());
            }
        } else if(slot == 2) {
            if(getQuantity(slot2) > 0) {
                System.out.println("You got a " + this.slot2.getSlotItems().peek().getName() + "!");
                this.slot2.dispenseItem();
            } else {
                System.out.println("Sorry there is no more " + this.slot2.getSlotItems().peek().getName());
            }
        } else if(slot == 3) {
            if(getQuantity(slot3) > 0) {
                System.out.println("You got a " + this.slot3.getSlotItems().peek().getName() + "!");
                this.slot3.dispenseItem();
            } else {
                System.out.println("Sorry there is no more " + this.slot3.getSlotItems().peek().getName());
            }
        } else {
            System.out.println("Please enter correct slot number");
        }
    }

    public String displayItems() {
        return "The " + getName() + " has: \n" +
                            getSlotItems(slot1).peek().getName() + ": " + getSlotItems(slot1).peek().getPrice() + " (" + getQuantity(slot1) + ")" + "\n" +
                            getSlotItems(slot2).peek().getName() + ": " + getSlotItems(slot2).peek().getPrice() + " (" + getQuantity(slot2) + ")" + "\n" +
                            getSlotItems(slot3).peek().getName() + ": " + getSlotItems(slot3).peek().getPrice() + " (" + getQuantity(slot3) + ")";
    }

    public String anotherDisplayItems() {
        return "(1) " + getSlotItems(slot1).peek().getName() + ": " + getSlotItems(slot1).peek().getPrice() + " (" + getQuantity(slot1) + ")" + "\n" +
                "(2) " + getSlotItems(slot2).peek().getName() + ": " + getSlotItems(slot2).peek().getPrice() + " (" + getQuantity(slot2) + ")" + "\n" +
                "(3) " + getSlotItems(slot3).peek().getName() + ": " + getSlotItems(slot3).peek().getPrice() + " (" + getQuantity(slot3) + ")";
    }

    private class Slot {

        private Stack<T> slotItems = new Stack<>();

        public Stack<T> getSlotItems() {
            return slotItems;
        }

        public void addItem(T item) {
            this.slotItems.push(item);
        }

        public void dispenseItem() {
            this.slotItems.pop();
        }
    }
}
