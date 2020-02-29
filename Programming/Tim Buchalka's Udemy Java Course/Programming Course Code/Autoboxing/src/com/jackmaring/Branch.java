package com.jackmaring;

import java.util.ArrayList;

public class Branch {

    private String name;
    private ArrayList<Customer> branchCustomers;

    public Branch(String name) {
        this.name = name;
        this.branchCustomers = new ArrayList<>();
    }

    public ArrayList<Customer> getBranchCustomers() {
        return branchCustomers;
    }

    public String getName() {
        return name;
    }

    public boolean addCustomer(String name, double initialValue) {
        if(findCustomer(name) == null) {
            this.branchCustomers.add(new Customer(name, initialValue));
            return true;
        }

        return false;
    }

    public boolean addCustomerTransaction(String name, double amount) {
        Customer existingCustomer = findCustomer(name);
        if(existingCustomer != null) {
            existingCustomer.addTransaction(amount);
            return true;
        }

        return false;
    }

    private Customer findCustomer(String name) {
        for(int i=0; i<this.branchCustomers.size(); i++) {
            Customer checkedCustomer = this.branchCustomers.get(i);
            if(checkedCustomer.getName().equals(name)) {
                return checkedCustomer;
            }
        }

        return null;
    }

}
