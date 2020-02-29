package com.jackmaring;

import java.util.ArrayList;

public class Customer {

    private String name;
    private ArrayList<Double> transactions;

    public Customer(String name, double initalAmount) {
        this.name = name;
        this.transactions = new ArrayList<>();
        this.transactions.add(initalAmount);
    }

    public String getName() {
        return name;
    }

    public ArrayList<Double> getTransactions() {
        return transactions;
    }

    public void addTransaction(Double transaction) {
        transactions.add(transaction);
    }

}
