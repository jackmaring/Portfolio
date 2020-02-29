package com.jackmaring;

public class Windows {

    private int num;

    public Windows(int num) {
        this.num = num;
    }

    public void windowz() {
        System.out.println("This room has " + num + " windows");
    }

    public int getNum() {
        return num;
    }
}
