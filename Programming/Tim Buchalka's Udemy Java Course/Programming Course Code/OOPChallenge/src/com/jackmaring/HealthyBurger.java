package com.jackmaring;

public class HealthyBurger extends Hamburger {

    private Addition addition5;
    private Addition addition6;


    public HealthyBurger() {
        this.price = 3.50;
        this.meat = "Turkey";
        this.bread = "Brown Rye";
    }

    @Override
    public double getPrice() {
        return super.getPrice();
    }

    @Override
    public String getMeat() {
        return super.getMeat();
    }

    @Override
    public String getBread() {
        return super.getBread();
    }

    @Override
    public void addOneAddition(Addition addition1) {
        super.addOneAddition(addition1);
    }

    @Override
    public void addTwoAdditions(Addition addition1, Addition addition2) {
        super.addTwoAdditions(addition1, addition2);
    }

    @Override
    public void addThreeAdditions(Addition addition1, Addition addition2, Addition addition3) {
        super.addThreeAdditions(addition1, addition2, addition3);
    }

    @Override
    public void addFourAdditions(Addition addition1, Addition addition2, Addition addition3, Addition addition4) {
        super.addFourAdditions(addition1, addition2, addition3, addition4);
    }

    public void addFiveAdditions(Addition addition1, Addition addition2, Addition addition3, Addition addition4, Addition addition5) {
        this.addition1 = addition1;
        this.addition2 = addition2;
        this.addition3 = addition3;
        this.addition4 = addition4;
        this.addition5 = addition5;
        this.additionCounter = 5;
    }

    public void addSixAdditions(Addition addition1, Addition addition2, Addition addition3, Addition addition4, Addition addition5, Addition addition6) {
        this.addition1 = addition1;
        this.addition2 = addition2;
        this.addition3 = addition3;
        this.addition4 = addition4;
        this.addition5 = addition5;
        this.addition6 = addition6;
        this.additionCounter = 6;
    }

    @Override
    public void getContents() {
        super.getContents();
        if(additionCounter == 5) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + addition2.getName() + " at " + addition2.getPrice() + "\n" + addition3.getName() + " at " + addition3.getPrice() + "\n" + addition4.getName() + " at " + addition4.getPrice() + "\n" + addition5.getName() + " at " + addition5.getPrice() + "\n" + "total: " + (price + addition1.getPrice() + addition2.getPrice() + addition3.getPrice() + addition4.getPrice() + addition5.getPrice()));
        } else if(additionCounter == 6) {
            System.out.println("You have a burger at " + price + "\n" + addition1.getName() + " at " + addition1.getPrice() + "\n" + addition2.getName() + " at " + addition2.getPrice() + "\n" + addition3.getName() + " at " + addition3.getPrice() + "\n" + addition4.getName() + " at " + addition4.getPrice() + "\n" + addition5.getName() + " at " + addition5.getPrice() + "\n" + addition6.getName() + " at " + addition6.getPrice() + "\n" + "total: " + (price + addition1.getPrice() + addition2.getPrice() + addition3.getPrice() + addition4.getPrice() + addition5.getPrice() + addition6.getPrice()));
        }
    }
}
