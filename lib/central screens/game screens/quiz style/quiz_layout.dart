import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/body.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizLayout extends StatelessWidget {
  const QuizLayout({Key? key}) : super(key: key);

//Wrap with willpopscope

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
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
        body: Body());
  }
}
