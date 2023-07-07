import 'dart:async';
import 'dart:math';
import 'package:firebase_attempt/central%20screens/game%20screens/maths_game.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/feedback_form.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:firebase_attempt/central%20screens/question_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Future<Map> wordMap;
  late int randomNumber;

  @override
  void initState() {
    super.initState();
    randomNumber = getRandomNum();
    wordMap = getWordOfDayMap(randomNumber);
  }

  Future<Map> getWordOfDayMap(int x) async {
    Word? word = await QuestionSheets.getById(x);

    String randWord = word!.toJson()['word'];
    String def = word.toJson()['definition'];

    return {"word": randWord, "definition": def};
  }

  int getRandomNum() {
    Random random = Random();
    int r1 = random.nextInt(640) + 1;
    return r1;
  }

  @override
  Widget build(BuildContext context) {
    double heightGap = 0.325 * logicalHeight;
    double widthGap = 0.325 * logicalWidth;
    double relativeTextSizeLarge = 0.11 * logicalWidth;
    double relativeTextSizeSmall = 0.075 * logicalWidth;
    double relativeTextSizeVerySmall = 0.05 * logicalWidth;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Discover Page",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: relativeTextSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Check back here daily!",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: relativeTextSizeSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          SizedBox(
            height: heightGap,
            width: widthGap,
            child: Center(
              child: Lottie.network(
                  "https://assets5.lottiefiles.com/packages/lf20_ii6qdbgz.json"),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FadeIn(
            duration: const Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Expand your Vocabulary with:",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: relativeTextSizeSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<Map>(
              future: wordMap,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Unable to show word");
                } else if (snapshot.hasData) {
                  Map<dynamic, dynamic>? map = snapshot.data;
                  String word = map?["word"];
                  String def = map?["definition"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "$word - $def",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Cambria",
                        fontSize: relativeTextSizeVerySmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                  text: "Play A Maths Game",
                  onClicked: () {
                    Get.to(() => const MathsGame(),
                        transition: Transition.downToUp);
                  })
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                  text: "Leave Feedback",
                  onClicked: () {
                    Get.to(() => const FeedbackFormPage(),
                        transition: Transition.cupertinoDialog);
                  })
            ],
          ),
        ]),
      )),
    );
  }
}
