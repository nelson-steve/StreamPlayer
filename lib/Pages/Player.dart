// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/modals/SongModal.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/modals/SeekBar.dart';
import 'package:rxdart/src/rx.dart' as rxdart;

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////-NOT USING-////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    GetAudio();
    // player.setAudioSource(
    //   ConcatenatingAudioSource(
    //     children: [
    //       AudioSource.uri(
    //         Uri.parse(Song.songs[1].url),
    //       ),
    //     ],
    //   ),
    // );
  }

  void GetAudio() async {
    final duration = await player.setAsset(Song.songs[0].url);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          player.positionStream, player.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: const Icon(Icons.grid_view_rounded),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Blinding Lights",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(Song.songs[0].songName),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(Song.songs[3].coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.065,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.grid_view_rounded,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.playlist_play_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.play_arrow, color: Colors.white),
                        const Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                        StreamBuilder<PlayerState>(
                          stream: player.playerStateStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final playerState = snapshot.data;
                              final processingState =
                                  playerState!.processingState;

                              if (processingState == ProcessingState.loading ||
                                  processingState ==
                                      ProcessingState.buffering) {
                                return Container(
                                  width: 64.0,
                                  height: 64.0,
                                  margin: const EdgeInsets.all(10.0),
                                  child: const CircularProgressIndicator(),
                                );
                              } else if (!player.playing) {
                                return IconButton(
                                  onPressed: player.play,
                                  iconSize: 75,
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: Colors.white,
                                  ),
                                );
                              } else if (processingState !=
                                  ProcessingState.completed) {
                                return IconButton(
                                  icon: const Icon(
                                    Icons.pause_circle,
                                    color: Colors.white,
                                  ),
                                  iconSize: 75.0,
                                  onPressed: player.pause,
                                );
                              } else {
                                return IconButton(
                                  icon: const Icon(
                                    Icons.replay_circle_filled_outlined,
                                    color: Colors.white,
                                  ),
                                  iconSize: 75.0,
                                  onPressed: () => player.seek(
                                    Duration.zero,
                                    index: player.effectiveIndices!.first,
                                  ),
                                );
                              }
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        const Icon(Icons.play_arrow,
                            size: 40, color: Colors.white),
                        const Icon(Icons.play_arrow, color: Colors.white),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.01,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// Flexible(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 Song.songs[3].coverUrl,
//               ),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),

// Expanded(
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   color: Colors.blueGrey,
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10),
//                     Slider(
//                       value: 0,
//                       onChanged: (double value) {},
//                     ),
//                     Container(
//                       width: 10,
//                       height: 10,
//                       color: Colors.blueAccent,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
