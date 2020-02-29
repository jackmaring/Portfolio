package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Bank bank = new Bank("BellBank");

        bank.addBranch("Fargo");

        bank.addCustomer("Fargo", "Jack", 20.0);
        bank.addCustomer("Fargo", "Jacques", 10.0);
        bank.addCustomer("Fargo", "Pike", 40.0);

        bank.addBranch("Grand Forks");
        bank.addCustomer("Grand Forks", "Liz", 134.0);

        bank.addCustomerTransaction("Fargo", "Jack", 30.0);
        bank.addCustomerTransaction("Fargo", "Jack", 43.0);
        bank.addCustomerTransaction("Fargo", "Jack", 12.0);

        bank.listCustomers("Fargo", true);

    }
}
