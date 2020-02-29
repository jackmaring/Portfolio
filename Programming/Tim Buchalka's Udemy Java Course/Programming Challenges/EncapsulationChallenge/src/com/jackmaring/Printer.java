package com.jackmaring;

public class Printer {

    private int tonerLevel;
    private int pagesPrinted = 0;
    private boolean isDuplex;

    public Printer(int tonerLevel, boolean isDuplex) {
        if (tonerLevel > 0 && tonerLevel <= 100) {
            this.tonerLevel = tonerLevel;
        }
        this.isDuplex = isDuplex;
    }

    public void fillToner(int fillToner) {
        if (this.tonerLevel + fillToner <= 100) {
            this.tonerLevel += fillToner;
        } else {
            System.out.println("You can't overfill the toner");
        }
    }

    public void printPages(int pages) {
        if (isDuplex) {
            int realPages = 0;
            if (pages % 2 == 0) {
                realPages += (pages / 2);
                this.pagesPrinted += realPages;
                System.out.println("You just printed " + realPages + " pages");
                System.out.println("You now have printed " + this.pagesPrinted + " total pages");
            } else if (pages % 2 == 1) {
                realPages = ((pages / 2) + 1);
                this.pagesPrinted += realPages;
                System.out.println("You just printed " + realPages + " pages");
                System.out.println("You now have printed " + this.pagesPrinted + " total pages");
            }
        } else {
            this.pagesPrinted += pages;
            System.out.println("You just printed " + pages + " pages");
            System.out.println("You now have printed " + this.pagesPrinted + " total pages");
        }
    }

    public int getPagesPrinted() {
        return pagesPrinted;
    }
}
