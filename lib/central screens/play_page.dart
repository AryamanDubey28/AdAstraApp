// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/chatPage.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/discover.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  Future<bool> _onWillPop() async {
    return false;
  }

  //colour used for bottom tabs
  Color? mygrey = Colors.grey[500];

  //all screens shown in the bottom tabs
  final screens = [
    SelectionTiles(ExplorePage.index),
    const ChatBotPage(),
    const DiscoverPage(),
    const ProfilePage(),
  ];

  int currentIndex = 0;
  int oldIndex = 0;

  Widget showScreen() {
    if (currentIndex != 1) {
      return screens[currentIndex];
    } else {
      return screens[oldIndex];
    }
  }

  Widget currentScreen() {
    setState(() {});
    return screens[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Theme.of(context).primaryColor,
            activeColor: Colors.grey[600],
            tabBackgroundColor: Colors.grey[100]!,
            gap: 5,
            onTabChange: (value) {
              setState(() {
                oldIndex = currentIndex;
                currentIndex = value;
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Iconsax.home1,
                text: "Home",
              ),
              GButton(
                icon: Iconsax.message,
                text: "Chat",
              ),
              GButton(
                icon: Icons.rocket_launch,
                text: "Discover",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
