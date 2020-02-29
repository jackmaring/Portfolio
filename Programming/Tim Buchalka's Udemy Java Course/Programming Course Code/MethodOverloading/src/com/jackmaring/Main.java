package com.jackmaring;

public class Main {

    public static void main(String[] args) {
        int newScore = calculateScore("Tim", 500);
        System.out.println("New score is " + newScore);
        calculateScore(75);
        calculateScore();

        Conversions.calcFeetAndInchesToCentimeters(1, 4);
        Conversions.calcFeetAndInchesToCentimeters(25);

        System.out.println(SecondsAndMinutes.getDurationString(60, 1));
        System.out.println(SecondsAndMinutes.getDurationString(3945));
        System.out.println(SecondsAndMinutes.getDurationString(-32));
    }

    public static int calculateScore(String playerName, int score) {
        System.out.println("Player " + playerName + " scored " + score + " points");
        return score * 1000;
    }

    public static int calculateScore(int score) {
        System.out.println("Unnamed player scored " + score + " points");
        return score * 1000;
    }

    public static int calculateScore() {
        System.out.println("No player name, no player score");
        return 0;
    }


}
