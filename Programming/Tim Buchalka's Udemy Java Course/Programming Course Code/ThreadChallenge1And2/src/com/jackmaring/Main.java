package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        BankAccount account = new BankAccount(1000.00, "12345-678");

        System.out.println("The account is starting with: " + account.getBalance());

//        Thread trThread1 = new Thread() {
//            public void run() {
//                account.deposit(300);
//                account.withdraw(50);
//                System.out.println("1st thread balance now: " + account.getBalance());
//            }
//        };
//
//        Thread trThread2 = new Thread() {
//            public void run() {
//                account.deposit(203.75);
//                account.withdraw(100);
//                System.out.println("2nd thread balance now: " + account.getBalance());
//            }
//        };

        Thread trThread1 = new Thread(new Runnable() {
            @Override
            public void run() {
                account.deposit(300);
                account.withdraw(70);
            }
        });

        Thread trThread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                account.deposit(203.75);
                account.withdraw(50);
            }
        });

        trThread1.start();
        trThread2.start();

        System.out.println("The account balance ended with: " + account.getBalance());
    }
}
