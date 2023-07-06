// ignore_for_file: file_names

import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/square_temp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class HeartedTopics extends StatefulWidget {
  const HeartedTopics({Key? key}) : super(key: key);

  @override
  State<HeartedTopics> createState() => _HeartedTopicsState();
}

class _HeartedTopicsState extends State<HeartedTopics> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;

  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    super.initState();
    final User user = auth.currentUser!;

    uid = user.uid;

    SelectionTiles.likedTopics = SelectionTiles.likedTopics.toSet().toList();

    if (_myBox.get("LIKEDTOPICS_$uid") == null) {
    } else {
      SelectionTiles.likedTopics = _myBox.get("LIKEDTOPICS_$uid");
    }
    SelectionTiles.likedTopics = SelectionTiles.likedTopics.toSet().toList();
  }

  void goToQuizPage(int index) {
    //String s = heartedTopics[index];
    String s = SelectionTiles.likedTopics[index];
    s = s.substring(0, s.indexOf("-") - 1);
    SelectionTiles.topic = s;
    Get.to(
      () => const QuizScreen(),
      transition: Transition.topLevel,
      //  duration: const Duration(seconds: 1)
    );
  }

  Widget emptyListScreen() {
    return Column(
      children: [
        const Spacer(),
        Lottie.network(
            "https://assets10.lottiefiles.com/packages/lf20_AcjHPq.json"),
        FadeIn(
          duration: const Duration(milliseconds: 1800),
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
        const Spacer(),
      ],
    );
  }

  Widget screenContent() {
    //List heartedTopics = SelectionTiles.likedTopics;
    if (SelectionTiles.likedTopics.isEmpty) {
      return emptyListScreen();
    } else {
      return ListView.builder(
          itemCount: SelectionTiles.likedTopics.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
                onTap: () {
                  goToQuizPage(index);
                },
                child: Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            goToQuizPage(index);
                          }),
                          icon: Icons.rocket_launch_sharp,
                          backgroundColor: Colors.purple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            deleteTopic(index);
                          }),
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ],
                    ),
                    child: MySquare(text: SelectionTiles.likedTopics[index])));
          }));
    }
  }

  void deleteTopic(int index) {
    setState(() {
      SelectionTiles.likedTopics.removeAt(index);
    });

    _myBox.put("LIKEDTOPICS_$uid", SelectionTiles.likedTopics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Favourite Topics",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: screenContent(),
    );
  }
}
