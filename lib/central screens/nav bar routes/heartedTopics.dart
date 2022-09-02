import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/square_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HeartedTopics extends StatefulWidget {
  const HeartedTopics({Key? key}) : super(key: key);

  @override
  State<HeartedTopics> createState() => _HeartedTopicsState();
}

class _HeartedTopicsState extends State<HeartedTopics> {
  List heartedTopics = SelectionTiles.likedTopics;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(heartedTopics);
    heartedTopics = heartedTopics.toSet().toList();
    print(heartedTopics);
  }

  void goToQuizPage(int index) {
    String s = heartedTopics[index];
    s = s.substring(0, s.indexOf("-") - 1);
    SelectionTiles.topic = s;
    Get.to(() => QuizScreen(),
        transition: Transition.topLevel, duration: Duration(seconds: 1));
  }

  Widget emptyListScreen() {
    return Column(
      children: [
        Spacer(),
        Lottie.network(
            "https://assets10.lottiefiles.com/packages/lf20_AcjHPq.json"),
        FadeIn(
          duration: Duration(milliseconds: 1800),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Heart some Topics Now!",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget screenContent() {
    if (heartedTopics.isEmpty) {
      return emptyListScreen();
    } else {}
    return ListView.builder(
        itemCount: heartedTopics.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
              onTap: () {
                print("hi");
                goToQuizPage(index);
              },
              child: MySquare(text: heartedTopics[index]));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "Your Favourite Topics",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: screenContent(),
      // body: ListView.builder(
      //     itemCount: heartedTopics.length,
      //     itemBuilder: ((context, index) {
      //       return GestureDetector(
      //           onTap: () {
      //             print("hi");
      //             goToQuizPage(index);
      //           },
      //           child: MySquare(text: heartedTopics[index]));
      //     })),
    );
  }
}
