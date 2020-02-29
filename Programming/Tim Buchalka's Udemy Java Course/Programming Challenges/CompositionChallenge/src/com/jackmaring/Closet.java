package com.jackmaring;

public class Closet {

    private String size;
    private String amountOfClothes;

    public Closet(String size, String amountOfClothes) {
        this.size = size;
        this.amountOfClothes = amountOfClothes;
    }

    public String getSize() {
        return size;
    }

    public String getAmountOfClothes() {
        return amountOfClothes;
    }
}
