package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        ITelephone timsPhone;
        timsPhone = new Deskphone(1234);
        timsPhone.powerOn();
        timsPhone.callPhone(1234);
        timsPhone.answer();

        timsPhone = new MobilePhone(4321);
        timsPhone.powerOn();
        timsPhone.callPhone(4321);
        timsPhone.answer();

    }
}
