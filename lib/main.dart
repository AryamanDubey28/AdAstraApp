import 'package:firebase_attempt/central%20screens/activity1.dart';
import 'package:firebase_attempt/central%20screens/congrats_screen.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_g1.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_layout.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/score_screen.dart';
import 'package:firebase_attempt/central%20screens/hidden_drawer.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles_nvr.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/main_page.dart';
import 'package:firebase_attempt/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'central screens/question_sheets.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await QuestionSheets.init();
  await Hive.initFlutter(); //init local storage
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: const MainPage(),
          routes: {
            '/congrats': (context) => const CongratsScreen(),
            '/mtsection': (context) => const HiddenDrawer(),
            '/playpage': (context) => PlayPage(),
            '/settings': (context) => const SettingsPage(),
            '/info': (context) => const InformationSheet(),
            '/game1': (context) => const MatchingTilesGame1(),
            '/game2': (context) => const QuizLayout(),
            '/scoreScreen': (context) => ScoreScreen(),
            '/nvrtiles': (context) => SelectionTilesNVR(),
          },
        );
      },
    );
  }
}
