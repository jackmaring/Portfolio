package com.jackmaring;

public class Printer {

    private int tonerLevel;
    private int pagesPrinted;
    private boolean isDuplex;

    public Printer(int tonerLevel, boolean isDuplex) {
        this.tonerLevel = tonerLevel;
        this.isDuplex = isDuplex;
        this.pagesPrinted = 0;
    }

    public void refillToner(int toner) {
        if(this.tonerLevel + toner > 100) {
            System.out.println("Sorry but you cannot overfill the toner level");
        } else {
            this.tonerLevel += toner;
            System.out.println("The toner level is now at " + this.tonerLevel + "%");
        }
    }

    public void printPaper(int numOfPages) {
        if(isDuplex) {
            if(numOfPages % 2 == 1) {
                numOfPages += 1;
            }
            int duplexPages = numOfPages / 2;
            pagesPrinted += duplexPages;
            System.out.println("You have printed " + duplexPages + " pages of paper");
        } else {
            pagesPrinted += numOfPages;
            System.out.println("You have printed " + numOfPages + " pages of paper");
        }
        System.out.println("You have now printed a total of " + pagesPrinted + " sheets of paper");
    }



}
