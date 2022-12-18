// ignore_for_file: unnecessary_string_escapes

class Song {
  final String songName;
  final String artist;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.songName,
    required this.artist,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      songName: "Blinding Lights",
      artist: "The Weeknd",
      description: "description1",
      url: "assets/music/09 - Blinding Lights.mp3",
      coverUrl: "assets/images/image1.jpg",
    ),
    Song(
      songName: "Jimmy Crooks",
      artist: "Drake",
      description: "description1",
      url: "assets/music/glass.mp3",
      coverUrl: "assets/images/image2.jpg",
    ),
    Song(
      songName: "A lot",
      artist: "21 Savage",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image3.jpg",
    ),
    Song(
      songName: "song4",
      artist: "The Weeknd",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image11.jpg",
    ),
    Song(
      songName: "song5",
      artist: "The Weeknd",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image12.jpg",
    ),
    Song(
      songName: "A lot",
      artist: "21 Savage",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image3.jpg",
    ),
    Song(
      songName: "song4",
      artist: "The Weeknd",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image4.jpg",
    ),
    Song(
      songName: "song5",
      artist: "The Weeknd",
      description: "description1",
      url: "assets/music/song1.mp3",
      coverUrl: "assets/images/image5.jpg",
    ),
  ];
}
