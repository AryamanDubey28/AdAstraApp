import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/intro%20screens/screen_1.dart';
import 'package:firebase_attempt/intro%20screens/screen_2.dart';
import 'package:firebase_attempt/intro%20screens/screen_3.dart';
import 'package:firebase_attempt/intro%20screens/screen_4.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_attempt/read%20data/get_user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  String name = "";

  List<String> docIDs = [];

  Future getDocIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('Age', descending: false)
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            }));
  }

  PageController my_controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: my_controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        my_controller.jumpToPage(3);
                      },
                      child: Text("Skip")),
                  SmoothPageIndicator(controller: my_controller, count: 4),
                  onLastPage
                      ?
                      //wrap this with the sliding thingy
                      GestureDetector(
                          onTap: () {
                            Get.to(() => PlayPage(),
                                transition: Transition.topLevel,
                                duration: Duration(seconds: 2));
                          },
                          child: Text("Done"))
                      : GestureDetector(
                          onTap: () {
                            my_controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next")),
                ],
              )),
        ],
      ),
    );
  }
}
