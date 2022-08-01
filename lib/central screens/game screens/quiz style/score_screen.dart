import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Future<bool> _onWillPop() async {
    return false;
  }

  String getAnimation(int score) {
    if (score >= 60) {
      return "https://assets3.lottiefiles.com/packages/lf20_5zYhWw.json"; //good
    } else {
      return "https://assets6.lottiefiles.com/packages/lf20_CTviZ9.json"; //bad
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _controller =
        Get.put(QuestionController(ExplorePage.index));
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                    "Your Score:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 58.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            FadeIn(
              duration: Duration(milliseconds: 1800),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${_controller.getPercentage()}%",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Lottie.network(getAnimation(_controller.getPercentage())),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Back to home screen"),
                IconButton(
                    onPressed: () =>
                        //Navigator.popAndPushNamed(context, '/playpage'),

                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //     '/playpage', (Route<dynamic> route) => false),
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/playpage", (r) => false),

                    // Navigator.popUntil(
                    //   context,
                    //   ModalRoute.withName('/playpage'),
                    // ),
                    icon: Icon(Icons.exit_to_app)),
              ],
            )
          ]),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.blue[200],
    //   body: Column(
    //     children: [
    //       Spacer(),
    //       Text(
    //         "Your score: ",
    //         style: TextStyle(fontSize: 30),
    //       ),
    //       Spacer(),
    //       Text("${_controller.getPercentage()}%"),
    //       Spacer()
    //     ],
    //   ),
    // );
  }
}
