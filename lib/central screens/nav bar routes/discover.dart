import 'dart:math';

import 'package:firebase_attempt/central%20screens/question_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Map choices = {};

  Future<Map> getWordOfDayMap() async {
    Word? word = await QuestionSheets.getById(getRandomNum());

    String randWord = word!.toJson()['word'];
    String def = word.toJson()['definition'];

    return {"word": randWord, "definition": def};
    //choices[word!.toJson()['word']] = word.toJson()['definition'];
  }

  Future<String> getWord() async {
    Map map = await getWordOfDayMap();
    String randword = map["word"];
    return randword;
  }

  Future<String> getDef() async {
    Map map = await getWordOfDayMap();
    String randdef = map["definition"];
    return randdef;
  }

  int getRandomNum() {
    Random random = new Random();
    //646
    int r1 = random.nextInt(50) + 1;
    int r2 = random.nextInt(50);
    if (r1 == r2) {
      r1 = random.nextInt(50) + 1;
    }

    print(r2 + 1);
    return r2 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[200],
          elevation: 0.0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          FadeIn(
            duration: Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Discover Page",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          SizedBox(
            height: 450,
            width: 450,
            child: Center(
              child: Lottie.network(
                  "https://assets5.lottiefiles.com/packages/lf20_ii6qdbgz.json"),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FadeIn(
            duration: Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Check back here daily!",
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
          FadeIn(
            duration: Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //getWord(),
                  "Word of day...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
