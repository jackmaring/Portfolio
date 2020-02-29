package com.jackmaring;

import java.util.ArrayList;

public class MobilePhone {

    private ArrayList<Contact> contacts;

    public MobilePhone() {
        this.contacts = new ArrayList<>();
    }

    public ArrayList<Contact> getContacts() {
        return contacts;
    }

    public void addContact(Contact contact) {
        this.contacts.add(contact);
    }

    private void modifyContact(Contact oldContact, Contact editedContact) {
        int position = this.contacts.indexOf(oldContact);
        this.contacts.set(position, editedContact);
    }

    public void modifyContact(String name, Contact editedContact) {
        Contact contactToEdit = findContact(name);
        if (findContact(name) != null) {
            modifyContact(contactToEdit, editedContact);
        }
    }

    private void remove(Contact contact) {
        this.contacts.remove(contact);
    }

    public void remove(String name) {
        Contact contactToRemove = findContact(name);
        if (findContact(name) != null) {
            remove(contactToRemove);
        } else {
            System.out.println("Could not find this contact");
        }
    }

    public Contact findContact(String name) {
        for (int i=0; i<contacts.size(); i++) {
            Contact foundContact = contacts.get(i);
            if (foundContact.getName().equals(name)) {
                return foundContact;
            }
        }
        return null;
    }

}
