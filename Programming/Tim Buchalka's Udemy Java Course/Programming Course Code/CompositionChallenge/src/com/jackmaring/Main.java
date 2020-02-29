package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Walls walls = new Walls(4, "pink");
        Bed bed = new Bed("queen", 4);
        Windows windows = new Windows(2);

        Room maChambre = new Room(walls, bed, windows);
        maChambre.roomDescription();

    }
}
