package com.jackmaring;

public class Room {

    private Walls walls;
    private Bed bed;
    private Windows windows;

    public Room(Walls walls, Bed bed, Windows windows) {
        this.walls = walls;
        this.bed = bed;
        this.windows = windows;
    }

    public void roomDescription() {
        getWalls().wally();
        bed.bedz();
        windows.windowz();
    }

    public Walls getWalls() {
        return walls;
    }

}
