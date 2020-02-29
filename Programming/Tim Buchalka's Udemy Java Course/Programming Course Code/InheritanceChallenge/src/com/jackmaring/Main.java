package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        Lamborghini murcielago = new Lamborghini(0, 2, 2, 2, "Lamborghini", "black", "Murcielago");
        murcielago.lamborghiniLurkin();
        murcielago.changeSpeed(60);

        Vehicule plane = new Vehicule(2, "Large", 0, 250);
        plane.changeSpeed(200);

    }
}
