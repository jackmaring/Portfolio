package com.jackmaring;

public class Main {


    public static void main(String[] args) {

        Library spotify = new Library("Spotify");

        Album ginger = new Album("GINGER");
        Song noHalo = new Song("NO HALO", 4.19);
        Song boyBye = new Song("BOY BYE", 2.22);
        Song ifYouPrayRight = new Song("IF YOU PRAY RIGHT", 5.02);

        Album theMoneyStore = new Album("The Money Store");
        Song getGot = new Song("Get Got", 2.51);
        Song iveSeenFootage = new Song("I've Seen Footage", 3.22);
        Song hacker = new Song("Hacker", 4.35);

        Album igor = new Album("IGOR");
        Song earfquake = new Song("EARFQUAKE", 3.10);
        Song newMagicWand = new Song("NEW MAGIC WAND", 3.15);
        Song whatsGood = new Song("WHAT'S GOOD", 3.25);

        ginger.addSongToAlbum(noHalo);
        ginger.addSongToAlbum(boyBye);
        ginger.addSongToAlbum(ifYouPrayRight);

        theMoneyStore.addSongToAlbum(getGot);
        theMoneyStore.addSongToAlbum(iveSeenFootage);
        theMoneyStore.addSongToAlbum(hacker);

        igor.addSongToAlbum(earfquake);
        igor.addSongToAlbum(newMagicWand);
        igor.addSongToAlbum(whatsGood);

        Song counterait = new Song("Ayy", 4.20);

        spotify.addAlbum(ginger);
        spotify.addAlbum(theMoneyStore);
        spotify.addAlbum(igor);

        Playlist playlist = new Playlist("Dank ass shit");

        playlist.addSongToPlaylist(spotify, noHalo);
        playlist.addSongToPlaylist(spotify, ifYouPrayRight);
        playlist.addSongToPlaylist(spotify, boyBye);
        playlist.addSongToPlaylist(spotify, hacker);
        playlist.addSongToPlaylist(spotify, getGot);
        playlist.addSongToPlaylist(spotify, iveSeenFootage);
        playlist.addSongToPlaylist(spotify, earfquake);
        playlist.addSongToPlaylist(spotify, newMagicWand);
        playlist.addSongToPlaylist(spotify, whatsGood);
        playlist.displaySongs();
        playlist.play();
    }
}



