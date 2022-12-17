import 'SongModal.dart';

class PlayList {
  final String title;
  final String songList;
  final List<Song> songs;
  final String imageUrl;

  PlayList({
    required this.title,
    required this.songs,
    required this.songList,
    required this.imageUrl,
  });

  static List<PlayList> playlist = [
    PlayList(
        title: "Hip/Hop",
        songs: Song.songs,
        songList: "Eminem, Drake, Jay-Z, Lil Wayne...",
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "RnB",
        songs: Song.songs,
        songList: "The Weeknd, Drake, Khalid, Joji...",
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "Pop",
        songs: Song.songs,
        songList: "Taylor Swift, Dua Lipa, Ariana Grande...",
        imageUrl: "assets/images/image3.jpg"),
    PlayList(
        title: "Hip/Hop",
        songs: Song.songs,
        songList: "Eminem, Drake, Jay-Z, Lil Wayne...",
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "RnB",
        songs: Song.songs,
        songList: "The Weeknd, Drake, Khalid, Joji...",
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "Pop",
        songs: Song.songs,
        songList: "Taylor Swift, Dua Lipa, Ariana Grande...",
        imageUrl: "assets/images/image3.jpg"),
    PlayList(
        title: "playlist1",
        songs: Song.songs,
        songList: "asdfasd",
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "playlist2",
        songs: Song.songs,
        songList: "asdfasd",
        imageUrl: "assets/images/image2.jpg"),
  ];
}
