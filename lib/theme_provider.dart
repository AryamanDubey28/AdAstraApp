import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

///A class to have different themes for light mode and dark mode
class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(color: Colors.grey[200]),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)));
}
