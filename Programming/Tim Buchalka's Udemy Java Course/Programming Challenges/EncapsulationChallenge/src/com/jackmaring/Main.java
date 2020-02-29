package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Printer isNotDuplex = new Printer(20, false);
        Printer isDuplex = new Printer(80, true);

        isNotDuplex.fillToner(50);
        isNotDuplex.printPages(6);
        isNotDuplex.printPages(3);
        isNotDuplex.printPages(9);
        isNotDuplex.printPages(1);

        System.out.println("**************************");

        isDuplex.fillToner(30);
        isDuplex.printPages(5);
        isDuplex.printPages(4);
        isDuplex.printPages(9);

    }
}
