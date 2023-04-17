import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_attempt/alert%20dialog/custom_dialog.dart';
import 'package:firebase_attempt/central%20screens/PageColor.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/nvr%20draggable%20qs/nvr_draggable.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/heartedTopics.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/database/database.dart';
import 'package:firebase_attempt/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main_page.dart';
import '../game screens/matching tiles/matching_tiles_g1.dart';

class SelectionTiles extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;
  static int index = 0;
  static String topic = "";
  Color myPageCol = getPageColor()!;

  SelectionTiles(int screenIndex) {
    index = screenIndex;
    final User user = auth.currentUser!;
    final email = user.email!;
    uid = user.uid;
    print(uid);
  }
  static List likedTopics = [];

  final _myBox = Hive.box('mybox');
  SelectionTilesDB db = SelectionTilesDB();

  void getLikedTopics() {
    if (_myBox.get("LIKEDTOPICS_${uid}") == null) {
      likedTopics = [];
    } else {
      likedTopics = db.loadDataList();
    }
  }

  static List vr_section = [
    "Matching Tiles",
    "Letter Codes",
    "Word Codes",
    "Number Sequences",
    "Word Connections",
    "Missing Letter",
    "Missing Number",
    "Make A Word From Another Word",
    "Match the Codes",
    "Make a Word",
    "Word and Letter Patterns Practice",
    "Synonyms",
    "Antonyms",
    "Analogies",
    "Odd One Out",
    "Vocabulary Practice",
    "Shuffled Sentences",
    "Move a Letter",
    "Missing Three Letters",
    "Spot the Word",
    "Join Two Words to Make One",
    "Spelling Practice",
    "Letters for Numbers",
    "Number Connections",
    "Number Patterns Practice",
    "Days and Dates",
    "Time",
    "Position",
    "Sorting Information",
    "True Statements",
    "Problem Solving Practice",
  ];

  static List nvr_section = [
    "Odd One Out",
    "Practice Quiz",
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
    "Fractions",
    "Quick Maths",
    "Algebra",
    "Shapes"
  ];

  //called when tile is double tapped
  void showLike(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return CustomAlertDialog(title: "Added to Liked");
        });

    HeartedTopics ht = HeartedTopics();
    print(uid);

    _myBox.put("LIKEDTOPICS_${uid}", likedTopics);
    print("Saved change to DB");
  }

  Widget getVRScreen(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 800,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        itemCount: vr_section.length,
        itemBuilder: ((context, index, realIndex) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = vr_section[index];
                      print(topic);
                      print("User id $uid");
                      Widget screen; //allows for transitions
                      if (topic == "Matching Tiles") {
                        screen = InformationSheet();
                      } else {
                        screen = QuizScreen();
                      }
                      Get.to(() => screen,
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 750));
                    },
                    onDoubleTap: () {
                      topic = vr_section[index];
                      if (ExplorePage.index == 0) {
                        SelectionTiles.likedTopics.add(topic + " - VR");
                      } else if (ExplorePage.index == 1) {
                        SelectionTiles.likedTopics.add(topic + " - NVR");
                      } else if (ExplorePage.index == 2) {
                        SelectionTiles.likedTopics.add(topic + " - Numeracy");
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
                            image: AssetImage(
                                'lib/assets/central_screen/new_numeracy_screen.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: 600,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                vr_section[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
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

  Widget getNVRScreen(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 800,
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
                    topic = nvr_section[index];
                    print(topic);
                    Widget screen = QuizScreen();
                    Get.to(() => screen,
                        transition: Transition.upToDown,
                        duration: Duration(milliseconds: 750));
                  },
                  onDoubleTap: () {
                    topic = nvr_section[index];
                    if (ExplorePage.index == 0) {
                      SelectionTiles.likedTopics.add(topic + " - VR");
                    } else if (ExplorePage.index == 1) {
                      SelectionTiles.likedTopics.add(topic + " - NVR");
                    } else if (ExplorePage.index == 2) {
                      SelectionTiles.likedTopics.add(topic + " - Numeracy");
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
                          image: AssetImage('lib/assets/NVR.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              nvr_section[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
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

  Widget getNumeracyScreen(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 800,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      itemCount: numeracy_section.length,
      itemBuilder: ((context, index, realIndex) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 25, 2, 10),
                child: GestureDetector(
                  onTap: () {
                    topic = numeracy_section[index];
                    print(topic);
                    Widget screen = QuizScreen();
                    Get.to(() => screen,
                        transition: Transition.upToDown,
                        duration: Duration(milliseconds: 750));
                  },
                  onDoubleTap: () {
                    topic = numeracy_section[index];
                    if (ExplorePage.index == 0) {
                      SelectionTiles.likedTopics.add(topic + " - VR");
                    } else if (ExplorePage.index == 1) {
                      SelectionTiles.likedTopics.add(topic + " - NVR");
                    } else if (ExplorePage.index == 2) {
                      SelectionTiles.likedTopics.add(topic + " - Numeracy");
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
                          image: AssetImage('lib/assets/numeracy2.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              numeracy_section[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
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

  Widget getScreen(BuildContext context) {
    if (ExplorePage.index == 0) {
      return getVRScreen(context);
    } else if (ExplorePage.index == 1) {
      return getNVRScreen(context);
    } else {
      return getNumeracyScreen(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageColor(),
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
                        builder: (BuildContext context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Icon(Icons.logout)),
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.5,
              blurBackgroundColor: getPageColor(),
              openWithTap: true,
              duration: Duration(seconds: 0),
              animateMenuItems: false,
              onPressed: () {},
              menuItems: [
                FocusedMenuItem(
                    title: Text(
                      "VR",
                      style: TextStyle(fontSize: 18),
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
                    title: Text("NVR", style: TextStyle(fontSize: 18)),
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
                    title: Text("Numeracy", style: TextStyle(fontSize: 18)),
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllTopics(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 1));
                  },
                  child: Icon(Icons.list)),
            ),
          ],
        ),
        backgroundColor: getPageColor(),
        elevation: 0.0,
      ),
      body: getScreen(context),
    );
  }
}
