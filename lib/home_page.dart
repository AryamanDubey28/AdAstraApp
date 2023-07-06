// ignore_for_file: non_constant_identifier_names

import 'package:firebase_attempt/intro%20screens/screen_1.dart';
import 'package:firebase_attempt/intro%20screens/screen_2.dart';
import 'package:firebase_attempt/intro%20screens/screen_3.dart';
import 'package:firebase_attempt/intro%20screens/screen_4.dart';
import 'package:firebase_attempt/central%20screens/play_page.dart';
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
              const IntroPage1(),
              const IntroPage2(),
              const IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        my_controller.jumpToPage(3);
                      },
                      child: const Text("Skip")),
                  SmoothPageIndicator(controller: my_controller, count: 4),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Get.to(() => const PlayPage(),
                                transition: Transition.topLevel,
                                duration: const Duration(seconds: 1));
                          },
                          child: const Text("Done"))
                      : GestureDetector(
                          onTap: () {
                            my_controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text("Next")),
                ],
              )),
        ],
      ),
    );
  }
}
