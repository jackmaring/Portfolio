package com.jackmaring;

import java.util.*;

public class Playlist {

    private String name;
    private List<Song> songList;

    public Playlist(String name) {
        this.name = name;
        this.songList = new LinkedList<>();
    }

    public String getName() {
        return name;
    }

    public List<Song> getSongList() {
        return songList;
    }

    public void addSongToPlaylist(Library library, Song song) {
        for (Album album : library.getLibrary()) {
            if (album.songExists(song)) {
                songList.add(song);
            }
        }
    }

    public void displaySongs() {
        for (Song song : songList) {
            System.out.println(song.getName() + " - " + song.getDuration());
        }
    }

    public void displayMenu() {
        System.out.println("Press 0 for instructions \n" +
                "Press 1 to go to next song \n" +
                "Press 2 to go to previous song \n" +
                "Press 3 to replay current song \n" +
                "Press 4 to remove current song \n" +
                "Press 5 to exit");
    }

    public void play() {

        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        boolean goingForward = true;

        ListIterator<Song> listIterator = songList.listIterator();

        System.out.println("This is " + getName());
        displayMenu();
        System.out.println("This is the beginning of the playlist");

        while (!quit) {

            int choice = scanner.nextInt();
            switch (choice) {

                case 0:
                    displayMenu();
                    break;
                case 1:
                    if (!goingForward) {
                        if (listIterator.hasNext()) {
                            listIterator.next();
                        }
                        goingForward = true;
                    }
                    if (listIterator.hasNext()) {
                        Song nextSong = listIterator.next();
                        System.out.println("Now playing " + nextSong.getName());
                    } else {
                        System.out.println("You've reached the end of the playlist");
                    }
                    break;
                case 2:
                    if (goingForward) {
                        if (listIterator.hasPrevious()) {
                            listIterator.previous();
                        }
                        goingForward = false;
                    }
                    if (listIterator.hasPrevious()) {
                        Song previousSong = listIterator.previous();
                        System.out.println("Now playing " + previousSong.getName());
                    } else {
                        System.out.println("This is the beginning of the playlist");
                    }
                    break;
                case 3:
                    if (goingForward) {
                        Song currentSong = listIterator.previous();
                        goingForward = false;
                        System.out.println("You replayed " + currentSong.getName());
                    } else if (!goingForward) {
                        Song currentSong = listIterator.next();
                        goingForward = true;
                        System.out.println("You replayed " + currentSong.getName());
                    }
                    break;
                case 4:
                    listIterator.remove();
                    break;
                case 5:
                    quit = true;
                    break;
            }

        }


    }


}
