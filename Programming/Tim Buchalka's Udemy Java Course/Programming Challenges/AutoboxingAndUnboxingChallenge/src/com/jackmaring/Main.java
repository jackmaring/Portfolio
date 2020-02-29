package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Bank bellBank = new Bank("BellBank");

        Branch fargo = new Branch("Fargo");
        Customer jack = new Customer("Jack", 20.0);
        Customer brooke = new Customer("Brooke", 1.00);
        Customer barry = new Customer("Barry", 500.0);

        Branch grandForks = new Branch("Grand Forks");
        Customer nate = new Customer("Nate", 30.0);
        Customer mukai = new Customer("Muaki", 20.0);

        bellBank.addBranch(fargo);
        bellBank.addBranch(grandForks);

        fargo.addCustomer(jack);
        jack.addTransaction(30);
        jack.addTransaction(-40);
        jack.addTransaction(70);
        jack.addTransaction(-50);

        fargo.addCustomer(brooke);
        fargo.addCustomer(barry);

        grandForks.addCustomer(nate);
        grandForks.addCustomer(mukai);

        bellBank.displayBranchesAndCustomers();


    }
}
