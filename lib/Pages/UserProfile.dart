import 'package:flutter/material.dart';

import '../modals/SongModal.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          width: MediaQuery.of(context).size.width * 0.55,
          height: MediaQuery.of(context).size.width * 0.55,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
              image: AssetImage(Song.songs[6].coverUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "Nelson Steve",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            border: Border.all(width: 1.5, color: Colors.white),
          ),
          child: Center(child: Text("Edit Profile")),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text("999"),
                Text(
                  "FOLLOWERS",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Column(
              children: [
                const Text("156"),
                Text(
                  "FOLLOWING",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text("Recent Activity")
      ],
    );
  }
}
