import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_attempt/alert%20dialog/custom_dialog.dart';
import 'package:firebase_attempt/central%20screens/PageColor.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/heartedTopics.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/database/database.dart';
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

  SelectionTiles(int screenIndex) {
    index = screenIndex;
  }
  static List likedTopics = [];

  static List vr_section = [
    "Matching Tiles",
    "Letter Codes",
    "Word Codes",
    "Number Sequences",
    "Word Connections",
    "Missing Letter",
    "Missing Number",
    "Make A Word From Another Word",
    // "Match the Codes",
    // "Make a Word",
    // "Word and Letter Patterns Practice",
    // "Synonyms",
    // "Antonyms",
    // "Analogies",
    // "Odd One Out",
    // "Vocabulary Practice",
    // "Shuffled Sentences",
    // "Move a Letter",
    // "Missing Three Letters",
    // "Spot the Word",
    // "Join Two Words to Make One",
    // "Spelling Practice",
    // "Letters for Numbers",
    // "Number Connections",
    // "Number Patterns Practice",
    // "Days and Dates",
    // "Time",
    // "Position",
    // "Sorting Information",
    // "True Statements",
    // "Problem Solving Practice",
  ];

  static List nvr_section = [
    "Practice Quiz",
    "Odd One Out",
    "Series",
    "Similarities",
    "Analogies",
    "Hidden Shapes",
    "Matricies",
    "Reflected Shapes",
    "Nets of Cubes",
    "Codes",
    "Combined Shapes"
  ];

  static List numeracy_section = [
    "Quick Maths",
    "Fractions",
    "Algebra",
    "Shapes"
  ];

  @override
  State<SelectionTiles> createState() => _SelectionTilesState();
}

class _SelectionTilesState extends State<SelectionTiles> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Color myPageCol = getPageColor()!;
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
          return CustomAlertDialog(
            title: "Added to Liked",
          );
        });

    HeartedTopics ht = const HeartedTopics();
    print(widget.uid);
    _myBox.put("LIKEDTOPICS_${widget.uid}", SelectionTiles.likedTopics);
    print("Saved change to DB");
  }

  Widget getVRScreen(BuildContext context, bool isDarkMode) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 750,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        itemCount: SelectionTiles.vr_section.length,
        itemBuilder: ((context, index, realIndex) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                  child: GestureDetector(
                    onTap: () {
                      SelectionTiles.topic = SelectionTiles.vr_section[index];
                      Widget screen; //allows for transitions
                      if (SelectionTiles.topic == "Matching Tiles") {
                        screen = const InformationSheet();
                      } else {
                        screen = const QuizScreen();
                      }
                      Get.to(() => screen,
                          transition: Transition.upToDown,
                          duration: const Duration(milliseconds: 750));
                    },
                    onDoubleTap: () {
                      SelectionTiles.topic = SelectionTiles.vr_section[index];
                      if (ExplorePage.index == 0) {
                        SelectionTiles.likedTopics
                            .add("${SelectionTiles.topic} - VR");
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
                            //TODO:Change to VR screen
                            image: isDarkMode
                                ? const AssetImage(
                                    'lib/assets/central_screen/numeracy_screen_gradient.JPG')
                                : const AssetImage(
                                    'lib/assets/Numeracy_LM.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: 600,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                SelectionTiles.vr_section[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24.0,
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
        }));
  }

  Widget getNVRScreen(BuildContext context, bool isDarkMode) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 750,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      itemCount: 5,
      itemBuilder: ((context, index, realIndex) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                child: GestureDetector(
                  onTap: () {
                    SelectionTiles.topic = SelectionTiles.nvr_section[index];
                    print(SelectionTiles.topic);
                    Widget screen = const QuizScreen();
                    Get.to(() => screen,
                        transition: Transition.upToDown,
                        duration: const Duration(milliseconds: 750));
                  },
                  onDoubleTap: () {
                    SelectionTiles.topic = SelectionTiles.nvr_section[index];
                    if (ExplorePage.index == 0) {
                      SelectionTiles.likedTopics
                          .add("${SelectionTiles.topic} - VR");
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
                              ? const AssetImage('lib/assets/NVR_DM.png')
                              : const AssetImage('lib/assets/NVR_LM.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              SelectionTiles.nvr_section[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
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

  Widget getNumeracyScreen(BuildContext context, bool isDarkMode) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 750,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      itemCount: SelectionTiles.numeracy_section.length,
      itemBuilder: ((context, index, realIndex) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                child: GestureDetector(
                  onTap: () {
                    SelectionTiles.topic =
                        SelectionTiles.numeracy_section[index];
                    print(SelectionTiles.topic);
                    Widget screen = const QuizScreen();
                    Get.to(() => screen,
                        transition: Transition.upToDown,
                        duration: const Duration(milliseconds: 750));
                  },
                  onDoubleTap: () {
                    SelectionTiles.topic =
                        SelectionTiles.numeracy_section[index];
                    if (ExplorePage.index == 0) {
                      SelectionTiles.likedTopics
                          .add("${SelectionTiles.topic} - VR");
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
                              ? const AssetImage(
                                  'lib/assets/central_screen/numeracy_screen_gradient.JPG')
                              : const AssetImage('lib/assets/Numeracy_LM.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              SelectionTiles.numeracy_section[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
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
      return getVRScreen(context, isDarkMode);
    } else if (ExplorePage.index == 1) {
      return getNVRScreen(context, isDarkMode);
    } else {
      return getNumeracyScreen(context, isDarkMode);
    }
  }

  String getTitle() {
    if (ExplorePage.index == 0) {
      return "Verbal Reasoning";
    } else if (ExplorePage.index == 1) {
      return "Non Verbal Reasoning";
    } else {
      return "Numeracy";
    }
  }

  Future _refresh() async {
    setState(() {});
    return Future.delayed(const Duration(seconds: 1));
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
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Icon(Icons.logout)),
            ),
            Center(
              child: FocusedMenuHolder(
                menuWidth: MediaQuery.of(context).size.width * 0.5,
                blurBackgroundColor: getPageColor(),
                openWithTap: true,
                duration: const Duration(seconds: 0),
                animateMenuItems: false,
                onPressed: () {},
                menuItems: [
                  FocusedMenuItem(
                      title: const Text(
                        "VR",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {
                        ExplorePage.index = 0;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                  FocusedMenuItem(
                      title: const Text("NVR",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        ExplorePage.index = 1;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                  FocusedMenuItem(
                      title: const Text("Numeracy",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      onPressed: () {
                        ExplorePage.index = 2;
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                PlayPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                ],
                menuOffset: 10,
                child: Text(
                  getTitle(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllTopics(),
                        transition: Transition.topLevel,
                        duration: const Duration(seconds: 1));
                  },
                  child: const Icon(Icons.list)),
            ),
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
