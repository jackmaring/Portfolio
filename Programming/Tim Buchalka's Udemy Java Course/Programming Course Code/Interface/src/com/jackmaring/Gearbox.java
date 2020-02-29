package com.jackmaring;

public class Gearbox {

    private boolean clutchIn;

    public void operateClutch(String inOrOut) {
        this.clutchIn = inOrOut.equalsIgnoreCase("in");
    }

}
