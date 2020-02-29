package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Printer duplexPrinter = new Printer(30, true);
        duplexPrinter.refillToner(40);
        duplexPrinter.printPaper(9);
        duplexPrinter.printPaper(3);

        Printer printer = new Printer(80, false);
        printer.refillToner(40);
        printer.printPaper(4);
        printer.printPaper(2);

    }
}
