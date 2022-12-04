import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Pages/HomeScreen.dart';
import 'Core.dart';
import 'Pages/Explore.dart';
import 'Pages/Profile.dart';
import 'Pages/Settings.dart';

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
      title: 'Music Player',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )),
      home: const Core(),
      getPages: [
        GetPage(name: '/', page: (() => const Core())),
        GetPage(name: '/home', page: (() => const HomeScreen())),
        GetPage(name: '/profile', page: (() => const Profile())),
        GetPage(name: '/settings', page: (() => const Settings())),
        GetPage(name: '/explore', page: (() => const Explore())),
      ],
    );
  }
}
