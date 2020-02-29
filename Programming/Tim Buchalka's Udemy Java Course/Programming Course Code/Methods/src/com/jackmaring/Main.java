package com.jackmaring;

public class Main {

    public static void main(String[] args) {

        boolean gameOver = true;

        int highScore = calculateScore(true, 800, 5, 100);
        System.out.println("Your final score was " + highScore);


        int score = 10000;
        int levelCompleted = 8;
        int bonus = 200;

        highScore = calculateScore(gameOver, score, levelCompleted, bonus);
        System.out.println("Your final score was " + highScore);


        int playerScore = calculateHighScorePosition(1500);
        displayHighScorePosition("Jack", playerScore);

        playerScore = calculateHighScorePosition(900);
        displayHighScorePosition("Hans", playerScore);

        playerScore = calculateHighScorePosition(400);
        displayHighScorePosition("Jess", playerScore);

        playerScore = calculateHighScorePosition(50);
        displayHighScorePosition("Isaac", playerScore);

    }

    public static int calculateScore(boolean gameOver, int score, int levelCompleted, int bonus) {

        if (gameOver) {
            int finalScore = score + (levelCompleted * bonus);
            finalScore += 2000;
            return finalScore;
        }

        return -1;

    }

    public static void displayHighScorePosition(String playerName, int playerPosition) {
        System.out.println(playerName + " managed to get into position " + playerPosition + " on the high score table");
    }

    public static int calculateHighScorePosition(int playerScore) {
//        if (playerScore >= 1000) {
//            return 1;
//        } else if (playerScore >= 500) {
//            return 2;
//        } else if (playerScore >= 100) {
//            return 3;
//        } else {
//            return 4;
//        }
        
        int position = 4;

        if (playerScore >= 1000) {
            position = 1;
        } else if (playerScore >= 500) {
            position = 2;
        } else if (playerScore >= 100) {
            position = 3;
        }

        return position;
    }

}
