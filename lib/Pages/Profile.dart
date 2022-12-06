import 'package:flutter/material.dart';
import 'package:music_player/modals/SongModal.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                    image: AssetImage(Song.songs[6].coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
            Expanded(
                child: Column(
              children: [
                const SizedBox(height: 60),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                      ),
                      child: Text("Nelson Steve"),
                    ),
                    const Text("Data 1"),
                    const Text("Data 1"),
                    const Text("Data 1"),
                    const Text("Data 1"),
                  ],
                )
              ],
            )),
          ],
        ),
        Center(
          child: Container(
            width: 180,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text("Nelson Steve",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ),
        )
      ],
    );
  }
}
