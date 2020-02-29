package com.jackmaring;

import java.util.ArrayList;

public class ContactsList {

    private String myNumber;
    private ArrayList<Contacts> contactsList = new ArrayList<>();

//    public ContactsList(String myNumber) {
//        this.myNumber = myNumber;
//        this.contactsList = new ArrayList<Contacts>();
//    }

    public boolean addContact(Contacts contact) {
        if(findContact(contact.getName()) >=0) {
            System.out.println("Contact is already on file");
            return false;
        }

        contactsList.add(contact);
        return true;

    }

    public ArrayList<Contacts> getContactsList() {
        return contactsList;
    }

    public void printContactsList() {
        System.out.println("You have " + contactsList.size() + " contacts");
        for(int i=0; i<contactsList.size(); i++) {
            System.out.println((i+1) + ". " + contactsList.get(i).getName() + " : " + contactsList.get(i).getNum());
        }
    }

    public void modifyContactsList(String contactName, Contacts newContact) {
        int position = findContact(contactName);
        if(position >= 0) {
            modifyContactsList(position, newContact);
        }
    }

    public void removeContact(String contactName) {
        int position = findContact(contactName);
        if(position >= 0) {
            removeContact(position);
        }
    }

    private void modifyContactsList(int position, Contacts newContact) {
        contactsList.set(position, newContact);
        System.out.println("Contact " + (position+1) + " has been modified");
    }

    private void removeContact(int position) {
        Contacts contact = contactsList.get(position);
        contactsList.remove(position);
    }

    private int findContact(Contacts contact) {
        return this.contactsList.indexOf(contact);
    }

    private int findContact(String contactName) {
        for(int i=0; i<this.contactsList.size(); i++) {
            Contacts contact = this.contactsList.get(i);
            if(contact.getName().equals(contactName)) {
                return i;
            }
        }
        return -1;
    }

    public boolean onFile(String contactName) {
        int position = findContact(contactName);
        if(position >= 0) {
            return true;
        }

        return false;
    }

}
