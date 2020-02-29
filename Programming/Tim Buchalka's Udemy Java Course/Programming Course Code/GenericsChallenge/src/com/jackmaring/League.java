package com.jackmaring;

import java.util.ArrayList;
import java.util.Collections;

public class League<T extends Team> {

    private String name;

    private ArrayList<T> teams = new ArrayList<>();

    public League(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public ArrayList<T> getTeams() {
        return teams;
    }

    public boolean addTeam(T teamToAdd) {
        if(this.teams.contains(teamToAdd)) {
            System.out.println(teamToAdd.getName() + " already exists in " + getName());
            return false;
        } else {
            System.out.println(getName() + " now has " + teamToAdd.getName());
            this.teams.add(teamToAdd);
            return true;
        }
    }

    public void displayTeams() {
        for(Team t : this.teams) {
            System.out.println(t.getName());
        }
    }

}
