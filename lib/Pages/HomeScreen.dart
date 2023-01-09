import 'package:flutter/material.dart';
import 'package:music_player/modals/SongModal.dart';
import 'package:music_player/modals/PlayList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Song> songs = Song.songs;
    List<PlayList> playlists = PlayList.playlist;
    return Column(
      children: [
        const Search(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Songs",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text("More"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(playlists[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 320,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                          Colors.blueGrey,
                          Colors.transparent,
                        ])),
                  ),
                  Positioned(
                      left: 5,
                      top: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Song.songs[index].songName,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            Song.songs[index].artist,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ))
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Your playlists",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: playlists.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        height: 50,
                        width: 50,
                        playlists[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(playlists[index].title),
                        Text(playlists[index].songList)
                        // Text(
                        //   "Hip/Hop",
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Text("Eminem, Drake, Jay-Z, Lil Wayne...")
                      ],
                    )
                  ]),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}

class PlayListMusic extends StatelessWidget {
  final List<PlayList> playlists;
  const PlayListMusic({super.key, required this.playlists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: playlists.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  height: 50,
                  width: 50,
                  playlists[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(playlists[index].title),
                  Text(playlists[index].title)
                ],
              )
            ]),
          );
        }),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            "Enjoy your favorite music",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              hintText: "Search",
              fillColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
