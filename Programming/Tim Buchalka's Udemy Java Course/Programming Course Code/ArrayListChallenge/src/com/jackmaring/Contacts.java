package com.jackmaring;

public class Contacts {

    private String name;
    private String num;

    public Contacts(String name, String num) {
        this.name = name;
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public String getNum() {
        return num;
    }

    public static Contacts createContact(String name, String num) {
        return new Contacts(name, num);
    }

}
