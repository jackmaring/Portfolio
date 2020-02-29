package com.jackmaring;

import java.util.ArrayList;
import java.util.List;

public class Branch {

    private String name;
    private List<Customer> customers;

    public Branch(String name) {
        this.name = name;
        this.customers = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void addCustomer(Customer customer) {
        customers.add(customer);
    }

    public void displayCustomers() {
        for (Customer customer : customers) {
            System.out.println(customer.getName());
        }
    }

    public void displayCustomersAndTransations() {
        for (Customer customer : customers) {
            System.out.println(customer.getName() + ": ");
            System.out.println(customer.getTransactions());
            System.out.println("--------------------------");
        }
    }

    public void displaySingleCustomerAndTransactions(Customer customer) {
        if (findCustomer(customer) >= 0) {
            System.out.println(customer.getName() + ": ");
            System.out.println(customer.getTransactions());
        }
    }

    public void displaySingleCustomerAndTransations(String name) {
        Customer customer = findCustomer(name);
        if (findCustomer(name) != null) {
            displaySingleCustomerAndTransactions(customer);
        } else {
            System.out.println("Couldn't find this customer");
        }
    }

    private int findCustomer(Customer customer) {
        if (customers.contains(customer)) {
            return 1;
        } else {
            return -1;
        }
    }

    private Customer findCustomer(String name) {
        for (int i=0; i<customers.size(); i++) {
            Customer thisCustomer = customers.get(i);
            if (thisCustomer.getName().equals(name)) {
                return thisCustomer;
            }
        }

        return null;
    }

}
