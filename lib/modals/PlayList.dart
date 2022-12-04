import 'SongModal.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<PlayList> playlist = [
    PlayList(
        title: "playlist1",
        songs: Song.songs,
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "playlist2",
        songs: Song.songs,
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "playlist3",
        songs: Song.songs,
        imageUrl: "assets/images/image3.jpg"),
    PlayList(
        title: "playlist1",
        songs: Song.songs,
        imageUrl: "assets/images/image4.jpg"),
    PlayList(
        title: "playlist2",
        songs: Song.songs,
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "playlist3",
        songs: Song.songs,
        imageUrl: "assets/images/image3.jpg"),
    PlayList(
        title: "playlist1",
        songs: Song.songs,
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "playlist2",
        songs: Song.songs,
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "playlist3",
        songs: Song.songs,
        imageUrl: "assets/images/image3.jpg"),
    PlayList(
        title: "playlist1",
        songs: Song.songs,
        imageUrl: "assets/images/image1.jpg"),
    PlayList(
        title: "playlist2",
        songs: Song.songs,
        imageUrl: "assets/images/image2.jpg"),
    PlayList(
        title: "playlist3",
        songs: Song.songs,
        imageUrl: "assets/images/image3.jpg"),
  ];
}
