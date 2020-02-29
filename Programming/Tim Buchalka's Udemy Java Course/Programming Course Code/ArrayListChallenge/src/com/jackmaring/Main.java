package com.jackmaring;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);
    private static ContactsList contactsList = new ContactsList();

    public static void main(String[] args) {

        boolean quit = false;
        int choice = 0;

        printInstructions();
        while(!quit) {
            System.out.println("Enter your choice: ");
            choice = scanner.nextInt();
            scanner.nextLine();

            switch(choice) {
                case 0:
                    printInstructions();
                    break;
                case 1:
                    contactsList.printContactsList();
                    break;
                case 2:
                    addItem();
                    break;
                case 3:
                    modifyItem();
                    break;
                case 4:
                    removeItem();
                    break;
                case 5:
                    searchForItem();
                    break;
                case 6:
                    quit = true;
                    break;
            }
        }
    }

    public static void printInstructions() {
        System.out.println("\nPress ");
        System.out.println("\t 0 - to print choice options");
        System.out.println("\t 1 - to print the list of contacts");
        System.out.println("\t 2 - to add a contact");
        System.out.println("\t 3 - to modify a contact");
        System.out.println("\t 4 - to remove a contact");
        System.out.println("\t 5 - to search for a contact");
        System.out.println("\t 6 - to quit the application");
    }

    public static void addItem() {
        System.out.print("Enter contact name: ");
        String name = scanner.nextLine();
        System.out.print("Enter contact number: ");
        String number = scanner.nextLine();
        Contacts newContact = Contacts.createContact(name, number);
        contactsList.addContact(newContact);
        System.out.println("You added a contact with the name of " + name + " whose number is " + number);
    }

    public static void modifyItem() {
        System.out.print("Enter contact name: ");
        String contactName = scanner.nextLine();
        System.out.print("Enter new name: ");
        String newName = scanner.nextLine();
        System.out.print("Enter new number");
        String newNumber = scanner.nextLine();
        Contacts newContact = new Contacts(newName, newNumber);
        contactsList.modifyContactsList(contactName, newContact);
    }

    public static void removeItem() {
        System.out.print("Enter item number: ");
        String name = scanner.nextLine();
        contactsList.removeContact(name);
    }

    public static void searchForItem() {
        System.out.println("Contact to search for: ");
        String name = scanner.nextLine();
        if(contactsList.onFile(name)) {
            System.out.println("Found " + name + " in contact list");
        } else {
            System.out.println(name + " is not in the contact list");
        }
    }

}
