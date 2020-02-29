package com.jackmaring;

public class VipCustomer {

    private String name;
    private int creditLimit;
    private String email;

    public VipCustomer() {
        this("Customer name", 0, "customer@email.com");
    }

    public VipCustomer(String name, int creditLimit, String email) {
        this.name = name;
        this.creditLimit = creditLimit;
        this.email = email;
    }

    public VipCustomer(String name, String email) {
        this(name, 200000, email);
    }

    public String getName() {
        return name;
    }

    public int getCreditLimit() {
        return creditLimit;
    }

    public String getEmail() {
        return email;
    }
}
