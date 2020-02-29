package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        // int has a width of 32
        int myMinValue = -2_147_483_648;
        int myMaxValue = 2_147_483_647;
        int myTotal = (myMinValue/2);
        //System.out.println("myTotal = " + myTotal);

        // byte has a width of 8
        byte myByteValue = -128;
        byte myNewByteValue = (byte) (myByteValue/2);
        //System.out.println("myNewByteValue = " + myNewByteValue);

        // short has a width of 16
        short myShortValue = -32738;
        short myNewShortValue = (short) (myShortValue/2);

        // long has a width of 64
        long myLongValue = 100L;


        byte bestByte = 2;
        short bestShort = 6;
        int bestInt = 4;
        long bestLong = 50000L + (10L * (bestByte + bestInt + bestShort));
        short shortTotal = (short) (1000 + (10 * (bestByte + bestInt + bestShort)));

        System.out.println("bestLong = " + bestLong);
        System.out.println("shortTotal = " + shortTotal);
    }
}
