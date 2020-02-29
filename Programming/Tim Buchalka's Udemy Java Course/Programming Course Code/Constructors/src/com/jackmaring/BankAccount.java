package com.jackmaring;

public class BankAccount {

    private String accountNumber;
    private double balance;
    private String name;
    private String email;
    private String phoneNumber;

    public BankAccount() {
        this("000000", 0.00, "Default name", "Default address", "default phone");
        System.out.println("Empty constructor called");
    }

    public BankAccount(String number, double balance, String name, String email, String phoneNumber) {
        this.accountNumber = number;
        this.balance = balance;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;

    }

    public BankAccount(String name, String email, String phoneNumber) {
        this("999999", 100.00, name, email, phoneNumber);
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void deposit(double amount) {
        this.balance += amount;
        System.out.println("Your balance is now " + balance);
    }

    public void withdrawl(double amount) {

        if(amount > balance) {
            System.out.println("Only " + balance + " available");
        } else {
            this.balance -= amount;
            System.out.println("Remaining balance = " + balance);
        }

    }

}
