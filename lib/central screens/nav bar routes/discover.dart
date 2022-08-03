import 'dart:async';
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
  late Future<Map> wordMap;

  @override
  void initState() {
    super.initState();
    wordMap = getWordOfDayMap(getRandomNum());
  }

  Future<Map> getWordOfDayMap(int x) async {
    Word? word = await QuestionSheets.getById(x);

    String randWord = word!.toJson()['word'];
    String def = word.toJson()['definition'];

    return {"word": randWord, "definition": def};
    //choices[word!.toJson()['word']] = word.toJson()['definition'];
  }

  int getRandomNum() {
    Random random = new Random();
    //646
    int r1 = random.nextInt(640) + 1;
    int r2 = random.nextInt(640);
    if (r1 == r2) {
      r1 = random.nextInt(640) + 1;
    }

    //print(r2 + 1);
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
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            FadeIn(
              duration: Duration(milliseconds: 1800),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Discover Page",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
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
                    "Check back here daily!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            SizedBox(
              height: 400,
              width: 400,
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
                    "Word of the day:",
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
            SizedBox(
              height: 10,
            ),
            FutureBuilder<Map>(
                //future: getWordOfDayMap(),
                future: wordMap,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Unable to show word of the day");
                  } else if (snapshot.hasData) {
                    Map<dynamic, dynamic>? map = snapshot.data;
                    String word = map?["word"];
                    String def = map?["definition"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        word + " - " + def,
                        style: TextStyle(
                            fontFamily: "Cambria",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}
