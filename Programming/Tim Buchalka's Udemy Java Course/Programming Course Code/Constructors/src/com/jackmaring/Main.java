package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        BankAccount acct = new BankAccount("12345", 100.00, "Bob Brown", "jmaring1@cord.edu", "791-212-0652");

        acct.withdrawl(20);
        acct.deposit(60);

        BankAccount jacksAccount = new BankAccount("Tim", "jmaring1@cord.edu", "123412");
        System.out.println(jacksAccount.getAccountNumber() + " name " + jacksAccount.getName());


        VipCustomer jack = new VipCustomer("Jack", "jmaring1@cord.edu");

        System.out.println("VIP customer " + jack.getName() + " has a limit of " + jack.getCreditLimit());

    }
}
