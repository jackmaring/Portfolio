package com.jackmaring;

public class Main {

    public static void main(String[] args) {
        System.out.println("10,000 at 2% interest = " + calculateInterest(10000, 2));
        System.out.println("10,000 at 3% interest = " + calculateInterest(10000, 3));
        System.out.println("10,000 at 4% interest = " + calculateInterest(10000, 4));
        System.out.println("10,000 at 5% interest = " + calculateInterest(10000, 5));

        for(int i=1; i<5; i++) {

            System.out.println("Loop " + i + " hello!");

        }

        for(int i=2; i<9; i++) {

            System.out.println("10,000 at " + i + "% interest = " + String.format("%.2f",calculateInterest(10000, i)));

        }

        System.out.println("******************************");

        for(int i=8; i>1; i--) {

            System.out.println("10,000 at " + i + "% interest = " + String.format("%.2f",calculateInterest(10000, i)));

        }

        int count = 0;

        for(int i=1; i<20; i++) {

            if (isPrime(i)) {
                count ++;
                System.out.println(i);
                if(count == 3) {
                    System.out.println("Exiting for loop");
                    break;
                }
            }
        }

        count = 0;
        int sum = 0;

        for(int i=1; i<=1000; i++) {

            if(i % 3 == 0) {
                if(i % 5 == 0) {
                    count++;
                    sum += i;
                    System.out.println("Found number = " + i);
                    if(count == 5) {
                        System.out.println("The sum of the numbers is: " + sum);
                        break;
                    }
                }

            }
        }
    }

    public static boolean isPrime(int n) {

        if(n == 1) {
            return false;
        }

        for(int i=2; i <= n/2; i++) {
            if(n % i == 0) {
                return false;
            }
        }

        return true;

    }

    public static double calculateInterest(double amount, double interestRate) {
        return(amount * (interestRate/100));
    }

}
