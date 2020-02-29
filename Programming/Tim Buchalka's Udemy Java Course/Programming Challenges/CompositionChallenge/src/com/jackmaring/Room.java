package com.jackmaring;

public class Room {

    private Wall nWall;
    private Wall eWall;
    private Wall sWall;
    private Wall wWall;
    private Bed bed;
    private Closet closet;
    private Desk desk;
    private Window window;

    public Room(Wall nWall, Wall eWall, Wall sWall, Wall wWall, Bed bed, Closet closet, Desk desk, Window window) {
        this.nWall = nWall;
        this.eWall = eWall;
        this.sWall = sWall;
        this.wWall = wWall;
        this.bed = bed;
        this.closet = closet;
        this.desk = desk;
        this.window = window;
    }
}
