package com.jackmaring;

import java.util.ArrayList;
import java.util.List;

public class Bank {

    private String name;
    private List<Branch> branches;

    public Bank(String name) {
        this.name = name;
        this.branches = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Branch> getBranches() {
        return branches;
    }

    public void addBranch(Branch branch) {
        branches.add(branch);
    }

    public void displayBranchesAndCustomers() {
        for (Branch branch : branches) {
            System.out.println(branch.getName() + ": ");
            branch.displayCustomers();
            System.out.println("-----------------------");
        }
    }
}
