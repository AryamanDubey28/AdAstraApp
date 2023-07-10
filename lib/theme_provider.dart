import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //returns isDark if there is a value saved, otherwise returns true

  Future<bool> getDarkModeFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDarkMode");
    return isDark ?? true;
  }

  Future setDarkModeInSharedPref(bool newVal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkMode", newVal);
  }

  Future<bool?> getSystemModeFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isSystemMode = prefs.getBool("isSystemMode");
    return isSystemMode;
  }

  Future setSystemModeInSharedPref(bool newVal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isSystemMode", newVal);
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  // bool get isSystemThemeMode => themeMode == ThemeMode.system;

  final SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper();
  Future<void> _saveThemeMode(bool isOn) async {
    await sharedPreferencesHelper.setDarkModeInSharedPref(isOn);
  }

  Future<void> loadThemeMode() async {
    // bool? isSystemMode =
    //     await sharedPreferencesHelper.getSystemModeFromSharedPref();
    bool isDark = await sharedPreferencesHelper.getDarkModeFromSharedPref();

    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setSystemTheme() {
    themeMode = ThemeMode.system;
    bool isDark = (themeMode == ThemeMode.dark);
    _saveThemeMode(isDark);
    notifyListeners();
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode(isOn);
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
