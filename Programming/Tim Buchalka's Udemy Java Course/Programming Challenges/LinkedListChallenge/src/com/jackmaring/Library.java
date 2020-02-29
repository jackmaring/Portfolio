package com.jackmaring;

import java.util.ArrayList;
import java.util.List;

public class Library {

    private String name;
    private List<Album> library;

    public Library(String name) {
        this.name = name;
        this.library = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<Album> getLibrary() {
        return library;
    }

    public void addAlbum(Album album) {
        library.add(album);
    }

}
