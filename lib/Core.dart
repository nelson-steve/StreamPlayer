import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Pages/Explore.dart';
import 'package:music_player/Pages/MusicPlayer.dart';
import 'package:music_player/Pages/Player.dart';
import 'package:music_player/Pages/Profile.dart';
import 'package:music_player/Pages/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:music_player/Pages/UserProfile.dart';
import 'modals/SongModal.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Explore(),
    UserProfile(),
  ];
  void _onTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black12,
              Color.fromARGB(255, 158, 60, 30),
            ],
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(Icons.grid_view_rounded),
              actions: [
                GestureDetector(
                  onTap: (() => Get.toNamed("/logIn")),
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.home_rounded),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: const Color.fromARGB(255, 212, 82, 6),
              unselectedItemColor: Colors.grey.shade800,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Home'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onTapped,
            ),
            body: _pages[_selectedIndex],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.855,
          child: GestureDetector(
            onTap: (() => Get.toNamed("/musicPlayer")),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.070,
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(Song.songs[0].coverUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Blinding Lights",
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                          Text(
                            "The Weeknd",
                            style: Theme.of(context).primaryTextTheme.caption,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "0:00/5:23",
                        style: Theme.of(context).primaryTextTheme.caption,
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: const Icon(
                          Icons.play_circle_outline_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
