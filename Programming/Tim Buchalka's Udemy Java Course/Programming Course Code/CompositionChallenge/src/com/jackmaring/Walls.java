package com.jackmaring;

public class Walls {

    private int num;
    private String color;

    public Walls(int num, String color) {
        this.num = num;
        this.color = color;
    }

    public void wally() {
        System.out.println("This room has " + num + " " + color + " walls");
    }

    public int getNum() {
        return num;
    }

    public String getColor() {
        return color;
    }

}
