package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Account jacksAccount = new Account("Jack");
        jacksAccount.deposit(1000);
        jacksAccount.withdraw(500);
        jacksAccount.withdraw(-200);
        jacksAccount.deposit(-20);
        jacksAccount.calculateBalance();

        System.out.println("Balance on account is " + jacksAccount.getBalance());

    }
}
