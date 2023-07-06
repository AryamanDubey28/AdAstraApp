import 'package:firebase_attempt/change_theme_button_widget.dart';
import 'package:firebase_attempt/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  ///Gets the correct sun or night icon based on dark mode being enabled
  Widget getIcon(bool darkModeOn) {
    return darkModeOn
        ? const Icon(Icons.nightlight_round_outlined)
        : const Icon(Icons.sunny);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getIcon(themeProvider.isDarkMode),
                const SizedBox(
                  width: 10,
                ),
                const ChangeThemeButtonWidget(),
              ],
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Your user id = ${firebaseAuth.currentUser!.uid}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
