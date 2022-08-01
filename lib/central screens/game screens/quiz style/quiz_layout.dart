import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/body.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizLayout extends StatefulWidget {
  const QuizLayout({Key? key}) : super(key: key);

  @override
  State<QuizLayout> createState() => _QuizLayoutState();
}

class _QuizLayoutState extends State<QuizLayout> {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<QuestionController>();
    super.dispose();
  }

//Wrap with willpopscope
  @override
  Widget build(BuildContext context) {
    QuestionController _controller =
        Get.put(QuestionController(ExplorePage.index));
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.blue[500],
          appBar: AppBar(
            backgroundColor: Colors.blue[500],
            automaticallyImplyLeading: false,
            elevation: 0.0,
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text("Skip"),
                    onTap: () {
                      _controller.nextQuestion();
                    },
                  ),
                ),
              ),
            ],
          ),
          body: Body()),
    );
  }
}
