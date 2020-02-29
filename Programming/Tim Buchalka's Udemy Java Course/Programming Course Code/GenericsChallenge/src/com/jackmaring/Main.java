package com.jackmaring;

import java.util.Collections;

public class Main {

    public static void main(String[] args) {

        BasketballTeam bulls = new BasketballTeam("Bulls");
        BasketballTeam heat = new BasketballTeam("Heat");
        BasketballTeam lakers = new BasketballTeam("Lakers");

        FootballTeam vikings = new FootballTeam("Vikings");
        FootballTeam patriots = new FootballTeam("Patriots");
        FootballTeam saints = new FootballTeam("Saints");

        SoccerTeam barcelona = new SoccerTeam("Barcelona");
        SoccerTeam psg = new SoccerTeam("PSG");
        SoccerTeam germany = new SoccerTeam("Germany");

        League<BasketballTeam> nba = new League<>("NBA");
        League<FootballTeam> nfl = new League<>("NFL");
        League<SoccerTeam> worldCup = new League<>("World Cup");

        nba.addTeam(bulls);
        nba.addTeam(heat);
        nba.addTeam(lakers);

        nfl.addTeam(vikings);
        nfl.addTeam(patriots);
        nfl.addTeam(saints);

        worldCup.addTeam(barcelona);
        worldCup.addTeam(psg);
        worldCup.addTeam(germany);

        nba.displayTeams();
        nfl.displayTeams();
        worldCup.displayTeams();


    }
}
