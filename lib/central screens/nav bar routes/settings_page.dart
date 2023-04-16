import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:flutter/material.dart';

import '../PageColor.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: getPageColor(),
        elevation: 0.0,
      ),
      backgroundColor: getPageColor(),
      body: Column(
        children: [
          Center(
              child: Text(
            "Settings page",
            style: TextStyle(fontSize: 32.0, color: Colors.grey[200]),
          )),
          ButtonWidget(
              text: "Change Screen colour",
              onClicked: () {
                print("darkmode = $darkmode");
                darkmode = !darkmode;
                print(
                    "darkmode now = $darkmode . page colour = ${getPageColor()}");
              })
        ],
      ),
    );
  }
}
