// // ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_attempt/alert%20dialog/custom_dialog.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/database/database.dart';
import 'package:firebase_attempt/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../main_page.dart';
import '../../theme_provider.dart';

class SelectionTiles extends StatefulWidget {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  static int index = 0;
  static String topic = "";

  SelectionTiles(int screenIndex, {super.key}) {
    index = screenIndex;
  }
  static List likedTopics = [];

  static List variables_and_dataTypes = [
    "Data Types",
    "Variables",
    "Smart Variable Names",
    "Strings"
  ];

  static List operations = [
    "Arithmetic Operations",
    "Comparison Operations",
    "Using Variables in Operations"
  ];

  static List conditionalStatements = ["If Else", "Elif", "Logic Problems"];

  static List loops = ["For Loops", "While Loops", "Nested Loops"];

  @override
  State<SelectionTiles> createState() => _SelectionTilesState();
}

class _SelectionTilesState extends State<SelectionTiles> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _myBox = Hive.box('mybox');

  SelectionTilesDB db = SelectionTilesDB();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getLikedTopics() {
    if (_myBox.get("LIKEDTOPICS_${widget.uid}") == null) {
      SelectionTiles.likedTopics = [];
    } else {
      SelectionTiles.likedTopics = db.loadDataList();
    }
  }

  //called when tile is double tapped
  void showLike(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return const CustomAlertDialog(
            title: "Added to Liked",
          );
        });

    _myBox.put("LIKEDTOPICS_${widget.uid}", SelectionTiles.likedTopics);
  }

  Widget buildScreen(BuildContext context, bool isDarkMode, String l_imagePath,
      String d_imagePath, List currentTopic) {
    double tilesHeight = 0.78 * logicalHeight;
    double tilesWidth = 0.75 * logicalWidth;
    double tilesText = 0.0825 * tilesWidth;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: tilesHeight,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      itemCount: currentTopic.length,
      itemBuilder: ((context, index, realIndex) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                child: GestureDetector(
                  onTap: () {
                    SelectionTiles.topic = currentTopic[index];

                    Widget screen = const QuizScreen();
                    Get.to(
                      () => screen,
                      transition: Transition.upToDown,
                    );
                  },
                  onDoubleTap: () {
                    SelectionTiles.topic = currentTopic[index];
                    if (ExplorePage.index == 0) {
                      SelectionTiles.likedTopics
                          .add("${SelectionTiles.topic} - V&D");
                    } else if (ExplorePage.index == 1) {
                      SelectionTiles.likedTopics
                          .add("${SelectionTiles.topic} - NVR");
                    } else if (ExplorePage.index == 2) {
                      SelectionTiles.likedTopics
                          .add("${SelectionTiles.topic} - Numeracy");
                    }
                    showLike(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.white10),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: isDarkMode
                              ? AssetImage(d_imagePath)
                              : AssetImage(l_imagePath),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: tilesWidth,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              currentTopic[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: tilesText,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget getScreen(BuildContext context, bool isDarkMode) {
    if (ExplorePage.index == 0) {
      return buildScreen(
          //variables and data types
          context,
          isDarkMode,
          'lib/assets/tile_images/blue_tile.png',
          'lib/assets/tile_images/blue_tile.png',
          SelectionTiles.variables_and_dataTypes);
    } else if (ExplorePage.index == 1) {
      return buildScreen(
          context, //operations
          isDarkMode,
          'lib/assets/tile_images/phone.png',
          'lib/assets/tile_images/phone.png',
          SelectionTiles.operations);
    } else if (ExplorePage.index == 2) {
      return buildScreen(
          context, //conditionals
          isDarkMode,
          'lib/assets/tile_images/two_colour.png',
          'lib/assets/tile_images/two_colour.png',
          SelectionTiles.conditionalStatements);
    } else {
      return buildScreen(
          context, //loops
          isDarkMode,
          'lib/assets/tile_images/yellow_tile.png',
          'lib/assets/tile_images/yellow_tile.png',
          SelectionTiles.loops);
    }
  }

  String getTitle() {
    if (ExplorePage.index == 0) {
      return "Variables & Data Types";
    } else if (ExplorePage.index == 1) {
      return "Operations";
    } else if (ExplorePage.index == 2) {
      return "Conditionals";
    } else {
      return "Loops";
    }
  }

  Future _refresh() async {
    setState(() {});
    return Future.delayed(const Duration(seconds: 1));
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Logout Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                  onTap: () => _showLogoutConfirmationDialog(context),
                  child: const Icon(Icons.logout)),
            ),
            Center(
              child: FocusedMenuHolder(
                menuWidth: MediaQuery.of(context).size.width * 0.5,
                blurBackgroundColor: Colors.transparent,
                openWithTap: true,
                duration: const Duration(seconds: 0),
                animateMenuItems: false,
                onPressed: () {},
                menuItems: [
                  FocusedMenuItem(
                    title: GestureDetector(
                      child: const Text(
                        "Variables \n& Data Types",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onPressed: () {
                      ExplorePage.index = 0;
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const PlayPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                  FocusedMenuItem(
                      title: GestureDetector(
                        child: const Text("Operations",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      onPressed: () {
                        ExplorePage.index = 1;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                  FocusedMenuItem(
                      title: GestureDetector(
                        child: const Text("Conditionals",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      onPressed: () {
                        ExplorePage.index = 2;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                  FocusedMenuItem(
                      title: GestureDetector(
                        child: const Text("Loops",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      onPressed: () {
                        ExplorePage.index = 3;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                ],
                menuOffset: 10,
                child: Row(
                  children: [
                    Text(
                      getTitle(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(
                    () => AllTopics(),
                    transition: Transition.upToDown,
                  );
                },
                child: const Icon(Icons.list)),
          ],
        ),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
          onRefresh: _refresh,
          color: Colors.deepPurple,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [getScreen(context, themeProvider.isDarkMode)],
          )),
    );
  }
}
