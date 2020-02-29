package com.jackmaring;

public class IsEvenNumber {

    public static boolean isEvenNumber(int num) {

        if(num % 2 == 0) {
            return true;
        } else {
            return false;
        }

    }

    public static int sumDigits(int num) {

        if (num < 10) {
            return -1;
        }

        int sum = 0;

        while(num > 0) {
            int slicedOff = num % 10;
            sum += slicedOff;
            num /= 10;
        }

        return sum;
    }

}
