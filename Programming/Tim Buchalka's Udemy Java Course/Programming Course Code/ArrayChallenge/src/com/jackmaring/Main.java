package com.jackmaring;

import java.util.Arrays;
import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {

        System.out.println("Enter your numbers: ");
        int[] intArray = getIntegers(5);
        printArray(intArray);

        int[] sortedArray = sortIntegers(intArray);
        for(int i=0; i<sortedArray.length; i++) {
            System.out.println("Sorted element " + i + " is: " + sortedArray[i]);
        }

    }

    public static int[] getIntegers(int num) {

        int[] values = new int[num];

        for(int i=0; i<num; i++) {
            values[i] = scanner.nextInt();
        }

        return values;
    }

    public static void printArray(int[] array) {

        for(int i=0; i<array.length; i++) {
            System.out.println("Element " + i + " is: " + array[i]);
        }

    }

    public static int[] sortIntegers(int array[]) {

        int[] sort = Arrays.copyOf(array, array.length);

        boolean flag = true;
        int temp;

        while(flag) {
            flag = false;
            for(int i=0; i<sort.length - 1; i++) {
                if(sort[i] < sort[i+1]) {
                    temp = sort[i];
                    sort[i] = sort[i+1];
                    sort[i+1] = temp;
                    flag = true;
                }
            }
        }
        return sort;
    }

}
