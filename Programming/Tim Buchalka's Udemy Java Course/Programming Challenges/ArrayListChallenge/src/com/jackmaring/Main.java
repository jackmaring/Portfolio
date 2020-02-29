package com.jackmaring;

import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);
    private static MobilePhone phone = new MobilePhone();

    public static void main(String[] args) {

        boolean quit = false;

        printInstructions();

        while (!quit) {
            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 0:
                    printInstructions();
                    break;
                case 1:
                    displayContacts();
                    break;
                case 2:
                    addContact();
                    break;
                case 3:
                    deleteContact();
                    break;
                case 4:
                    editContact();
                    break;
                case 5:
                    findContact();
                    break;
                case 6:
                    quit = true;
                    break;
            }
        }
    }

    public static void printInstructions() {
        System.out.println("Press 0 for instructions " +
                "\nPress 1 to display contacts" +
                "\nPress 2 to add a contact" +
                "\nPress 3 to delete an existing contact" +
                "\nPress 4 to edit an existing contact" +
                "\nPress 5 to find an existing contact" +
                "\nPress 6 to exit the program");
    }

    public static void displayContacts() {
        int i = 1;
        for (Contact contact : phone.getContacts()) {
            System.out.println((i) + ". " + contact.getName() + " - " + contact.getNumber());
            i++;
        }
    }

    public static void addContact() {

        System.out.print("Please type the name of new contact: ");
        String name = scanner.nextLine();
        System.out.print("Now type the number: ");
        String number = scanner.nextLine();


        Contact newContact = new Contact(name, number);
        phone.addContact(newContact);
        System.out.println("You just added " + name + " - " + number + " to your contacts list!");
    }

    public static void deleteContact() {

        System.out.print("Please enter the name of the contact you would like to delete: ");
        phone.remove(scanner.nextLine());
        System.out.println("You just deleted this contact");
    }

    public static void editContact() {

        System.out.print("Please enter the name of the contact you would like to edit: ");
        String name = scanner.nextLine();

        if (phone.findContact(name) != null) {
            Contact oldContact = phone.findContact(name);
            System.out.print("Please enter new name: ");
            String newName = scanner.nextLine();
            System.out.print("Please enter new number: ");
            String newNumber = scanner.nextLine();
            phone.modifyContact(name, new Contact(newName, newNumber));
            System.out.println("You changed " + oldContact.getName() + " - " + oldContact.getNumber() + " to " + newName + " - " + newNumber + "!");
        } else {
            System.out.println("Couldn't find this contact");
        }
    }

    public static void findContact() {

        System.out.print("Please enter name of contact to find: ");
        String name = scanner.nextLine();

        if (phone.findContact(name) != null) {
            Contact contactToFind = phone.findContact(name);
            System.out.println("Found the contact " + contactToFind.getName() + " - " + contactToFind.getNumber());
        } else {
            System.out.println("Couldn't find the contact");
        }
    }

}
