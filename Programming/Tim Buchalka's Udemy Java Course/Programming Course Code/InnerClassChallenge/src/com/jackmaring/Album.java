package com.jackmaring;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Created by dev on 18/09/15.
 */
public class Album {
    private String name;
    private String artist;
    private SongList songs;

    public Album(String name, String artist) {
        this.name = name;
        this.artist = artist;
        this.songs = new SongList();
    }

    public void addSong(String title, double duration) {
        if(this.songs.addSong(title, duration)) {
            this.songs.getSongs().add(new Song(title, duration));
        }
    }

    public boolean addToPlayList(int trackNumber, LinkedList<Song> playList) {
        Song checkedSong = this.songs.findSong(trackNumber);
        if(checkedSong != null) {
            playList.add(checkedSong);
            return true;
        }
        return false;
    }

    public void addToPlayList(String name, LinkedList playlist) {
        Song checkedSong = this.songs.findSong(name);
        if(checkedSong != null) {
            playlist.add(checkedSong);
        }
    }



    private class SongList {

        private ArrayList<Song> songs;

        public SongList() {
            this.songs = new ArrayList<Song>();
        }

        public ArrayList<Song> getSongs() {
            return songs;
        }

        private boolean addSong(String title, double duration) {
            if (findSong(title) == null) {
                this.songs.add(new Song(title, duration));
                return true;
            }
            return false;
        }

        private Song findSong(String title) {
            for (Song checkedSong : this.songs) {
                if (checkedSong.getTitle().equals(title)) {
                    return checkedSong;
                }
            }
            return null;
        }

        public Song findSong(int trackNumber) {
            int index = trackNumber -1;
            if((index > 0) && index<songs.size()) {
                return songs.get(index);
            }
            return null;
        }



    }
}
