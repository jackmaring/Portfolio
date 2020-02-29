package com.jackmaring;

public class Hamburger {


    protected double price;
    protected String meat;
    protected String bread;
    protected Addition addition1;
    protected Addition addition2;
    protected Addition addition3;
    protected Addition addition4;
    protected int additionCounter = 0;

    public Hamburger() {
        this.price = 3.00;
        this.meat = "beef";
        this.bread = "basic";
    }

    public double getPrice() {
        return price;
    }

    public String getMeat() {
        return meat;
    }

    public String getBread() {
        return bread;
    }

    public void addOneAddition(Addition addition1) {
        this.addition1 = addition1;
        this.additionCounter = 1;
    }

    public void addTwoAdditions(Addition addition1, Addition addition2) {
        this.addition1 = addition1;
        this.addition2 = addition2;
        this.additionCounter = 2;
    }

    public void addThreeAdditions(Addition addition1, Addition addition2, Addition addition3) {
        this.addition1 = addition1;
        this.addition2 = addition2;
        this.addition3 = addition3;
        this.additionCounter = 3;
    }

    public void addFourAdditions(Addition addition1, Addition addition2, Addition addition3, Addition addition4) {
        this.addition1 = addition1;
        this.addition2 = addition2;
        this.addition3 = addition3;
        this.addition4 = addition4;
        this.additionCounter = 4;
    }

    public void getContents() {
        if(additionCounter == 0) {
            System.out.println("You have a burger at " + price + "\n" + "total: " + price);
        } else if(additionCounter == 1) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + "total: " + (price + addition1.getPrice()));
        } else if(additionCounter == 2) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + addition2.getName() + " at " + addition2.getPrice() + "\n" + "total: " + (price + addition1.getPrice() + addition2.getPrice()));
        } else if(additionCounter == 3) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + addition2.getName() + " at " + addition2.getPrice() + "\n" + addition3.getName() + " at " + addition3.getPrice() + "\n" + "total: " + (price + addition1.getPrice() + addition2.getPrice() + addition3.getPrice()));
        } else if(additionCounter == 4) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + addition2.getName() + " at " + addition2.getPrice() + "\n" + addition3.getName() + " at " + addition3.getPrice() + "\n" + addition4.getName() + " at " + addition4.getPrice() + "\n" + "total: " + (price + addition1.getPrice() + addition2.getPrice() + addition3.getPrice() + addition4.getPrice()));
        }
    }

}
