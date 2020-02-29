package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        int value = 3;
        if(value == 1) {
            System.out.println("Value was 1");
        } else if (value == 2) {
            System.out.println("Value was 2");
        } else {
            System.out.println("Was not 1 or 2");
        }


        int switchValue = 3;

        switch(switchValue) {
            case 1:
                System.out.println("Value was 1");
                break;

            case 2:
                System.out.println("Value was 2");
                break;

            case 3: case 4: case 5:
                System.out.println("was a 3, or a 4, or a 5");
                System.out.println("Actually it was a " + switchValue);
                break;

            default:
                System.out.println("Was not 1 or 2");
                break;
        }

        char letter = 'A';

        switch(letter) {
            case 'A':
                System.out.println("You have an A");
                break;
            case 'B':
                System.out.println("You have a B");
                break;
            case 'C':
                System.out.println("You have a C");
                break;
            case 'D':
                System.out.println("You have a D");
                break;
            case 'E':
                System.out.println("You have an E");
                break;
            default:
                System.out.println("You don't have an A, B, C, D, or E!");
                break;
        }

        String month = "JaNUARy";
        switch(month.toLowerCase()) {
            case "january":
                System.out.println("Jan");
                break;
            case "june":
                System.out.println("Jun");
                break;
            default:
                System.out.println("Not sure");
        }

        DayOfTheWeekChallenge.printDayOfTheWeek(0);
        DayOfTheWeekChallenge.printDayOfTheWeek(3);
        DayOfTheWeekChallenge.printDayOfTheWeek(9);

        DayOfTheWeekChallenge.printDayOfTheWeekIfElse(0);
        DayOfTheWeekChallenge.printDayOfTheWeekIfElse(3);
        DayOfTheWeekChallenge.printDayOfTheWeekIfElse(9);

    }
}
