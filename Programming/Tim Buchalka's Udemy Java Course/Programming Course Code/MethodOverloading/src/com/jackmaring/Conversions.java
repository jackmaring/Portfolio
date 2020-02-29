package com.jackmaring;

public class Conversions {

    public static double calcFeetAndInchesToCentimeters (int feet, int inches) {

        double cm = ((feet * 12) + inches) * 2.54;

        if ((feet >= 0) && (inches >= 0 && inches <= 12)) {

            System.out.println(feet + " feet and " + inches + " inches = " + cm + " cm");
            return cm;

        } else {

            System.out.println("Invalid feet or inches parameters");
            return -1;

        }

    }

    public static double calcFeetAndInchesToCentimeters (int inches) {

        if (inches >= 0) {

            int feet = inches / 12;
            int remainingInches = inches - (feet * 12);

            return calcFeetAndInchesToCentimeters(feet, remainingInches);

        } else {

            System.out.println("Invalid feet or inches parameters");
            return -1;

        }

    }

}
