package com.jackmaring;

import java.util.ArrayList;
import java.util.List;

public class Customer {

    private String name;
    private List<Double> transactions;

    public Customer(String name, double startingAmount) {
        this.name = name;
        this.transactions = new ArrayList<>();
        this.transactions.add(startingAmount);
    }

    public String getName() {
        return name;
    }

    public List<Double> getTransactions() {
        return transactions;
    }

    public Double getLastValue() {
        return transactions.get(transactions.size() - 1);
    }

    public void addTransaction(double amount) {
        if (getLastValue() + amount >= 0) {
            transactions.add(getLastValue() + amount);
        } else {
            System.out.println("Not enough money in account");
        }
    }

}
