import 'package:flutter/material.dart';
import 'package:music_player/Pages/Explore.dart';
import 'package:music_player/Pages/Profile.dart';
import 'package:music_player/Pages/Settings.dart';
import 'package:music_player/Pages/HomeScreen.dart';
import 'package:get/get.dart';

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
    Profile(),
  ];
  void _onTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onTap: (() => Get.toNamed("/profile")),
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
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onTapped,
          ),
          body: _pages[_selectedIndex]),
    );
  }
}
