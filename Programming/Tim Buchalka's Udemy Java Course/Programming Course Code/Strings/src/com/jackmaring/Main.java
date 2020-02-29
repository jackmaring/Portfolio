package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        String myString = "This is a string";
        System.out.println("myString = " + myString);
        System.out.println("myString = " + myString + " \u00A9 2015");

        String numberString = "250.55";
        numberString = numberString + "49.95";

        System.out.println(numberString);

        String lastSring = "10";
        int myInt = 50;
        lastSring = lastSring + myInt;
        System.out.println(lastSring);
        double doubleNumber = 120.78;
        lastSring = lastSring + doubleNumber;
        System.out.println(lastSring);

    }
}
