package com.jackmaring;

import java.util.ArrayList;
import java.util.LinkedList;

public class Album {

    private String name;
    private ArrayList<Song> songList;

    public Album(String name) {
        this.songList = new ArrayList<>();
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Song> getSongList() {
        return songList;
    }

    public void addSong(String name) {
        this.songList.add(new Song(name));
    }

    private Song findSong(String name) {
        for(Song checkedSong: this.songList) {
            if(checkedSong.getTitle().equals(name)) {
                return checkedSong;
            }
        }
        return null;
    }

    public boolean addToPlaylist(int trackNumber, LinkedList<Song> playlist) {
        int index = trackNumber -1;
        if((index >= 0) && (index <= this.songList.size())) {
            playlist.add(this.songList.get(index));
            return true;
        }
        System.out.println("This album does not have a track " + trackNumber);
        return false;
    }

    public boolean addToPlaylist(String name, LinkedList<Song> playlist) {
        Song checkedSong = findSong(name);
        if(checkedSong != null) {
            playlist.add(checkedSong);
            return true;
        }
        System.out.println("The song " + name + " is not in this album");
        return false;
    }




}
