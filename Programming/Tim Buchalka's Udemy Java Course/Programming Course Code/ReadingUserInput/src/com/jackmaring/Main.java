package com.jackmaring;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

//        Scanner scanner = new Scanner (System.in);
//
//        System.out.println("Enter your year of birth: ");
//
//        boolean hasNextInt = scanner.hasNextInt();
//
//        if(hasNextInt) {
//            int yearOfBirth = scanner.nextInt();
//            scanner.nextLine();
//
//            System.out.println("Enter you name: ");
//            String name = scanner.nextLine();
//            int age = 2019 - yearOfBirth;
//
//            if(age >= 0 && age <= 100) {
//                System.out.println("Your name is " + name + ", and you are " + age + " years old.");
//
//            } else {
//                System.out.println("Invalid year of birth");
//            }
//        } else {
//            System.out.println("Unable to parse year of birth.");
//        }
//
//        scanner.close();

        Scanner scanner = new Scanner(System.in);

        int counter = 1;
        int sum = 0;

        while(counter <= 10) {

            System.out.println("Enter number #" + counter + ":");

            boolean isAnInt = scanner.hasNextInt();

            if(isAnInt) {
                int num = scanner.nextInt();
                sum += num;
                counter ++;
            } else {
                System.out.println("Invalid number");
            }

            scanner.nextLine();

        }

        scanner.close();
        System.out.println("Your sum is: " + sum);

    }
}
