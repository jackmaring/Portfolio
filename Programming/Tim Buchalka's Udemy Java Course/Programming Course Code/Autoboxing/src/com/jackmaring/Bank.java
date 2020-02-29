package com.jackmaring;

import java.util.ArrayList;

public class Bank {

    private String name;
    private ArrayList<Branch> branchList;

    public Bank(String name) {
        this.name = name;
        this.branchList = new ArrayList<>();
    }

    public void addBranch(Branch branch) {
        this.branchList.add(branch);
    }

    public boolean addBranch(String branchName) {
        if(findBranch(branchName) == null) {
            this.branchList.add(new Branch(branchName));
            return true;
        }

        return false;
    }

    public boolean addCustomer(String branchName, String customerName, double initialAmount) {
        Branch branch = findBranch(branchName);
        if(branch != null) {
            return branch.addCustomer(customerName, initialAmount);
        }

        return false;
    }

    public boolean addCustomerTransaction(String branchName, String customerName, double amount) {
        Branch branch = findBranch(branchName);
        if(branch != null) {
            return branch.addCustomerTransaction(customerName, amount);
        }

        return false;
    }

    private Branch findBranch(String name) {
        for(int i=0; i<this.branchList.size(); i++) {
            Branch checkedBranch = this.branchList.get(i);
            if(checkedBranch.getName().equals(name)) {
                return checkedBranch;
            }
        }

        return null;
    }

    public boolean listCustomers(String branchName, boolean showTransactions) {
        Branch branch = findBranch(branchName);
        if(branch != null) {
            System.out.println("Customers for branch " + branch.getName());

            ArrayList<Customer> branchCustomers = branch.getBranchCustomers();
            for(int i=0; i<branchCustomers.size(); i++) {
                Customer branchCustomer = branchCustomers.get(i);
                System.out.println("Customer: " + branchCustomer.getName() + "[" + (i+1) + "]");
                if(showTransactions) {
                    System.out.println("Transactions");
                    ArrayList<Double> transactions = branchCustomer.getTransactions();
                    for(int j=0; j<transactions.size(); j++) {
                        System.out.println("[" + (j+1) + "] Amount: " + transactions.get(j));
                    }
                }
            }

            return true;
        } else {

            return false;
        }
    }

}
