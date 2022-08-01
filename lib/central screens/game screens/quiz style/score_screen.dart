import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Spacer(),
          Text(
            "Your score: ",
            style: TextStyle(fontSize: 30),
          ),
          Spacer(),
          Text("${_controller.getPercentage()}%"),
          Spacer()
        ],
      ),
    );
  }
}
