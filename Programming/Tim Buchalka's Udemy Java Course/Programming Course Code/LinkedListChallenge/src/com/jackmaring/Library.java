package com.jackmaring;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class Library {

    private String name;
    private ArrayList<Album> albumsList;
    private ArrayList<Playlist> playlists;

    public Library(String name) {
        this.name = name;
        this.albumsList = new ArrayList<>();
        this.playlists = new ArrayList<>();
    }

    public ArrayList<Album> getAlbumsList() {
        return albumsList;
    }

    public void addAlbum(String name) {
        Album album = findAlbum(name);
        if(album == null) {
            this.albumsList.add(new Album(name));
        } else {
            System.out.println("This album already exists in this playlist");
        }
    }

    private Album findAlbum(String name) {
        for(int i=0; i<albumsList.size(); i++) {
            Album album = albumsList.get(i);
            if(album.getName().equals(name)) {
                return album;
            }
        }
        return null;
    }

    public ArrayList<Playlist> getPlaylists() {
        return playlists;
    }

    public void createPlaylist(String name) {
        if(findPlaylist(name) == null) {
            this.playlists.add(new Playlist(name));
        } else {
            System.out.println("You already have a playlist with this name");
        }
    }

    private Playlist findPlaylist(String name) {
        for(int i=0; i<this.playlists.size(); i++) {
            Playlist playlist = playlists.get(i);
            if(playlist.getName().equals(name)) {
                return playlist;
            }
        }
        return null;
    }

    public void addSongToPlaylist(String playlistName, String songName) {
        if(doesSongExist(songName)) {
            findPlaylist(playlistName).getPlaylist().add(findSong(songName));
        } else {
            System.out.println("Sorry something went wrong");
        }
    }

    public void interactWithPlaylist(String name) {
        Playlist playlist = findPlaylist(name);
        LinkedList<Song> thePlaylist = playlist.getPlaylist();
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        boolean goingForward = true;
        ListIterator<Song> listIterator = thePlaylist.listIterator();

        if(thePlaylist.isEmpty()) {
            System.out.println("There are no song in the playlist");
        } else {
            System.out.println("You are now listening to " + listIterator.next());
            printMenu();
        }

        while(!quit) {
            int action = scanner.nextInt();
            scanner.nextLine();
            switch(action) {
                case 0:
                    System.out.println("You have stopped listening to music");
                    quit = true;
                    break;
                case 1:
                    if(!goingForward) {
                        if(listIterator.hasNext()) {
                            listIterator.next();
                        }
                        goingForward = true;
                    }
                    if(listIterator.hasNext()) {
                        System.out.println("Now listening to " + listIterator.next().getTitle());
                        goingForward = false;
                    }
                    break;
                case 2:
                    if(goingForward) {
                        if(listIterator.hasPrevious()) {
                            listIterator.hasPrevious();
                        }
                        goingForward = false;
                    }
                    if(listIterator.hasPrevious()) {
                        System.out.println("Now listening to " + listIterator.previous().getTitle());
                        goingForward = true;
                    }
                case 3:
                    System.out.println();
                case 4:
                    for(int i=0; i<thePlaylist.size(); i++) {
                        System.out.println((i+1) + ". " + thePlaylist.get(i).getTitle() + ": " + thePlaylist.get(i).getDuration());
                    }
            }
        }
    }

    private static void printMenu() {
        System.out.println("Available actions:\npress ");
        System.out.println("0 - to quit\n" +
                "1 - next song\n" +
                "2 - previous song\n" +
                "3 - replay\n" +
                "4 - list playlist songs");
    }

    private Song findSong(String name) {
        for(int i=0; i<albumsList.size(); i++) {
            Album album = albumsList.get(i);
            for(int j=0; j<album.getSongList().size(); j++) {
                Song song = album.getSongList().get(j);
                if(song.getTitle().equals(name)) {
                    return song;
                }
            }
        }
        return null;
    }

    private boolean doesSongExist(String name) {
        for(int i=0; i<albumsList.size(); i++) {
            Album album = albumsList.get(i);
            for(int j=0; j<album.getSongList().size(); j++) {
                Song song = album.getSongList().get(j);
                if(song.getTitle().equals(name)) {
                    return true;
                }
            }
        }
        return false;
    }

}
