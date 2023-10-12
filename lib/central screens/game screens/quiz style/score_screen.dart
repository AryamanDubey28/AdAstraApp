import 'package:firebase_attempt/database/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_attempt/main.dart';

class ScoreScreen extends StatelessWidget {
  final double percentage;
  ScoreScreen({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  Future<bool> _onWillPop() async {
    return false;
  }

  String getAnimation(double score) {
    if (score >= 60) {
      return "https://assets3.lottiefiles.com/packages/lf20_5zYhWw.json"; //good
    } else {
      return "https://assets6.lottiefiles.com/packages/lf20_CTviZ9.json"; //bad
    }
  }

  @override
  Widget build(BuildContext context) {
    firebaseFunctions.updateUserXP(percentage);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            FadeIn(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Your Score:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: logicalHeight * 0.076,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: logicalHeight * 0.018
               
            ),
            FadeIn(
              duration: const Duration(milliseconds: 1800),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$percentage%",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: logicalHeight * 0.0495,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Lottie.network(getAnimation(percentage)),
            ),
             SizedBox(
              height: logicalHeight * 0.042,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Back to home screen",
                  style: TextStyle(fontSize: logicalHeight * 0.03, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, "/playpage", (r) => false),
                    icon: const Icon(Icons.exit_to_app)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
