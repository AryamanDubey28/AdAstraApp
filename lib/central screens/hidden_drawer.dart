import 'package:firebase_attempt/central%20screens/about_page.dart';
import 'package:firebase_attempt/central%20screens/activity1.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> pages = [];

  final myStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Matching Tiles",
          baseStyle: myStyle,
          selectedStyle: myStyle,
          colorLineSelected: Color.fromARGB(255, 0, 106, 192),
        ),
        Activity1(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle: myStyle,
          selectedStyle: myStyle,
          colorLineSelected: Color.fromARGB(255, 0, 106, 192),
        ),
        SettingsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "About",
          baseStyle: myStyle,
          selectedStyle: myStyle,
          colorLineSelected: Color.fromARGB(255, 0, 106, 192),
        ),
        AboutPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Quit",
          baseStyle: myStyle,
          selectedStyle: myStyle,
          colorLineSelected: Color.fromARGB(255, 0, 106, 192),
        ),
        GestureDetector(
          onTap: () => Navigator.popAndPushNamed(context, '/playpage'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: Color.fromARGB(255, 140, 197, 223),
      initPositionSelected: 0,
      slidePercent: 45,
    );
  }
}
