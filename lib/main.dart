import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Pages/MusicPlayer.dart';
import 'package:music_player/Pages/Player.dart';
import 'package:music_player/Pages/UserProfile.dart';
import 'Core.dart';
import 'Pages/Login.dart';
import 'Pages/Profile.dart';
import 'Pages/Settings.dart';
import 'Pages/ArtistAccount.dart';
import 'Pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Player',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )),
      home: const Core(),
      getPages: [
        GetPage(name: '/', page: (() => const Core())),
        GetPage(name: '/logIn', page: (() => const Login())),
        GetPage(name: '/signUp', page: (() => const SignUp())),
        GetPage(name: '/player', page: (() => const Player())),
        GetPage(name: '/profile', page: (() => const Profile())),
        GetPage(name: '/settings', page: (() => const Settings())),
        GetPage(name: '/musicPlayer', page: (() => const MusicPlayer())),
        GetPage(name: '/userProfile', page: (() => const UserProfile())),
        GetPage(name: '/artistAccount', page: (() => const ArtistAccount())),
      ],
    );
  }
}
