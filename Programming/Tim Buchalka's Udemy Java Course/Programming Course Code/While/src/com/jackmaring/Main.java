package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        int count = 1;
        while(count != 6) {
            System.out.println("Count value is " + count);
            count++;
        }

        for(count=1; count != 6; count++) {
            System.out.println("Count value is " + count);
        }

        count = 1;
        while(true) {
            if(count == 6) {
                break;
            }
            System.out.println("Count value is " + count);
            count++;
        }

        count = 1;
        do {
            System.out.println("Count value was " + count);
            count++;

            if(count > 100) {
                break;
            }

        } while(count != 6);

        int number = 4;
        int finishNumber = 20;
        int index = 0;

        while(number <= finishNumber) {
            number++;
            if(!IsEvenNumber.isEvenNumber(number)) {
                continue;
            }
            index ++;
            System.out.println("Even number " + number);
            if(index == 5) {
                break;
            }
        }

        System.out.println("You have " + index + " even numbers");

        int sumTotal = IsEvenNumber.sumDigits(541);
        System.out.println("Your digit sum is " + sumTotal);

    }
}
