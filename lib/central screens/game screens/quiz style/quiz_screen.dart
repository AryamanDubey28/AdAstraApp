import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<String, String> descriptions = {
    "Letter Codes":
        "Find the letters that will complete the sentence in the best way and select the correct answer from the options",
    "Word Codes":
        "You need to work out a different code for each question and choose the correct option",
    "Number Sequences":
        "Find the number that continues the series in the most sensible way",
    "Word Connections":
        "In these questions, there are two pairs of words. Select which word goes equally as well with both pairs",
    "Missing Letter":
        "The same letter must fit into both sets of brackets to complete the word infront of the brackets and begin the word after the brackets",
    "Missing Number":
        "In these questions, the three numbers in each group are related in the same way. Find the number that completes the last group",
    "Make A Word From Another Word":
        "These questions contain three pairs of words. Find the word that completes the last pair in the same way as the other two pairs",
    "Nets of Cubes": "Pain",
    "Quick Maths": "Do some mental maths questions before the time runs out!",
    "Practice Quiz": "A sample NVR question",
  };

  String getText() {
    return SelectionTiles.topic;
  }

  String getAnim() {
    return "https://lottie.host/859db97a-026d-4199-86c5-4c6aa6735cea/MVXBsK0Cg8.json";
  }

  String getDescription() {
    if (descriptions.containsKey(SelectionTiles.topic)) {
      return descriptions[SelectionTiles.topic]!;
    }
    return "No description found...";
  }

  void _showUnavailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Unavailable'),
          content: const Text(
              'Sorry, as this is a beta release, this game has not been made yet'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget getStartButton() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/game2");
          },
          child: const Text(
            "Start",
            style: TextStyle(
              fontSize: 30,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Center(
                    child: FadeIn(
                      duration: const Duration(milliseconds: 1400),
                      child: SizedBox(
                        height: 275,
                        width: 275,
                        child: Center(
                          child: Lottie.network(getAnim(),
                              width: 400, height: 400),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Let's Play",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 96.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      getText(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  getStartButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
