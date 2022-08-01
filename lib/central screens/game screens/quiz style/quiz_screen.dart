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
  String getText() {
    // if (ExplorePage.index == 0) {
    //   return "A VR Style Quiz";
    // } else if (ExplorePage.index == 1) {
    //   return "A NVR Style Quiz";
    // } else if (ExplorePage.index == 2) {
    //   return "A Numeracy Quiz";
    // } else {
    //   return "";
    // }
    return "A " + SelectionTiles.topic + " game";
  }

  String getAnim() {
    if (ExplorePage.index == 0) {
      return "https://assets3.lottiefiles.com/packages/lf20_2scSKA.json";
    } else if (ExplorePage.index == 1) {
      return "https://assets3.lottiefiles.com/packages/lf20_bshezgfo.json";
    } else if (ExplorePage.index == 2) {
      return "https://assets6.lottiefiles.com/packages/lf20_neoi7cp3.json";
    } else {
      return "";
    }
  }

  // @override
  // void initState() {
  //   addQuestions();
  // }

  // Future addUserDetails(
  //     String firstname, String surname, int age, String email) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'First Name': firstname,
  //     'Last Name': surname,
  //     'Age': age,
  //     'Email': email,
  //   });
  // }

  Future addQuestions() async {
    for (int i = 0; i < sample_data_numeracy.length; i++) {
      Map<String, dynamic> question = sample_data_numeracy[i];
      print(question);
      await FirebaseFirestore.instance.collection('maths').add(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Center(
                  child: FadeIn(
                    duration: Duration(milliseconds: 1400),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Center(
                        child: Lottie.network(getAnim()),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "Lets Play",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 96.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    getText(),
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/game2");
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 44,
                        ),
                      )),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(50.0),
                //   child: ElevatedButton(
                //       onPressed: () {
                //         // BuildQuizDB buildQuizDB = BuildQuizDB();
                //         // buildQuizDB.setData();
                //       },
                //       child: Text(
                //         "Set Data",
                //         style: TextStyle(
                //           fontSize: 30,
                //         ),
                //       )),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
