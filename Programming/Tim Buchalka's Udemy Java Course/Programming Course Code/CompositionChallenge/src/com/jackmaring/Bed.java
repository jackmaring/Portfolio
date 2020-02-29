package com.jackmaring;

public class Bed {

    private String size;
    private int pillows;

    public Bed(String size, int pillows) {
        this.size = size;
        this.pillows = pillows;
    }

    public void bedz() {
        System.out.println("This room has a " + size + " bed with " + pillows + " pillows");
    }

    public String getSize() {
        return size;
    }

    public int getPillows() {
        return pillows;
    }
}
