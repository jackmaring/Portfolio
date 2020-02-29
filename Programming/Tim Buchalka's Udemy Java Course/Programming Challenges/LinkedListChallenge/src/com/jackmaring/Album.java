package com.jackmaring;

import java.util.ArrayList;
import java.util.List;

public class Album {

    private String name;
    private List<Song> trackList;

    public Album(String name) {
        this.name = name;
        this.trackList = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Song> getTrackList() {
        return trackList;
    }

    public void addSongToAlbum(Song song) {
        if (songExists(song)) {
            System.out.println(song.getName() + " has already been added to " + getName());
        } else {
            trackList.add(song);
        }
    }

    private Song findSong(String name) {
        for (int i = 0; i < trackList.size(); i++) {
            Song currentSong = trackList.get(i);
            if (currentSong.getName().equals(name)) {
                return currentSong;
            }
        }
        return null;
    }

    public boolean songExists(Song song) {
        if (trackList.contains(song)) {
            return true;
        }
        return false;
    }

    public void displaySongs() {
        System.out.println(getName() + ": ");
        for (Song song : trackList) {
            System.out.println(song.getName() + " - " + song.getDuration());
        }
        System.out.println("=========================");
    }

}
