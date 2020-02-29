package com.jackmaring;

public class SIBTest {

    public static final String owner;

    static {
        owner = "jack";
        System.out.println("SIBTest static initialization block called");
    }

    public SIBTest() {
        System.out.println("SIB constructor called");
    }

    static {
        System.out.println("2nd initailization block called");
    }

    public void someMethod() {
        System.out.println("someMethod() called");
    }


}
