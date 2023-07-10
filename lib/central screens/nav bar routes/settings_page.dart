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
  Widget getSunIcon(bool darkModeOn) {
    return darkModeOn
        ? const Icon(Icons.nightlight_round_outlined)
        : const Icon(Icons.sunny);
  }

  Widget deviceThemeModeWidget({
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Colors.blue.withOpacity(0.25) : null,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                getSunIcon(themeProvider.isDarkMode),
                const SizedBox(
                  width: 10,
                ),
                const ChangeThemeButtonWidget(),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const [
          //       Icon(Icons.phone_iphone_outlined),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       DeviceThemeButtonWidget()
          //     ],
          //   ),
          // ),
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
