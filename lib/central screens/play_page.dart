import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_g1.dart';
import 'package:firebase_attempt/central%20screens/hidden_drawer.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/discover.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../login_page.dart';
import 'PageColor.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  static int tilesScreenIndex = 0;

  Future<bool> _onWillPop() async {
    return false;
  }

  //colour used for bottom tabs
  Color? mygrey = Colors.grey[500];

  //all screens shown in the bottom tabs
  final screens = [
    SelectionTiles(ExplorePage.index),
    ExplorePage(),
    const DiscoverPage(),
    ProfilePage(),
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
        backgroundColor: getPageColor(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: mygrey!,
            gap: 7,
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
                icon: Icons.explore,
                text: "Explore",
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
