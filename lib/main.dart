import 'package:firebase_attempt/central%20screens/activity1.dart';
import 'package:firebase_attempt/central%20screens/congrats_screen.dart';
import 'package:firebase_attempt/central%20screens/hidden_drawer.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'central screens/nav bar routes/settings_page.dart';
import 'central screens/question_sheets.dart';
import 'login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await QuestionSheets.init();

  runApp(const MyApp());
}

//final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/congrats': (context) => const CongratsScreen(),
        '/mtsection': (context) => HiddenDrawer(),
        '/playpage': (context) => PlayPage(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
