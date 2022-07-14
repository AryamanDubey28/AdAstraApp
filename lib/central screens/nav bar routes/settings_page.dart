import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      backgroundColor: Colors.blue[200],
      body: Center(
          child: Text(
        "Settings page",
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}
