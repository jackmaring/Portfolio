package com.jackmaring;

import java.util.Arrays;
import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.println("Enter your count:");
        int count = scanner.nextInt();

        int[] intArray = readIntegers(count);
        System.out.println("Your min value is: " + findMin(intArray));
        reverse(intArray);

    }

    private static int[] readIntegers(int count) {

        int[] values = new int[count];

        for(int i=0; i<count; i++) {
            System.out.println("Enter your number");
            values[i] = scanner.nextInt();
        }

        return values;
    }

    private static int findMin(int[] array) {

        int minValue = Integer.MAX_VALUE;

        for(int i=0; i<array.length; i++) {
            if(array[i] <= minValue) {
                minValue = array[i];
            }
        }

        return minValue;
    }

    private static void reverse(int[] array) {

        int[] reverse = Arrays.copyOf(array, array.length);

        int temp;

        for(int i=0; i<reverse.length / 2; i++) {
            temp = reverse[i];
            reverse[i] = reverse[reverse.length-(i+1)];
            reverse[reverse.length-(i+1)] = temp;
        }

        System.out.println("Your array is " + Arrays.toString(array));
        System.out.println("Your reverse array is " + Arrays.toString(reverse));

    }

}
