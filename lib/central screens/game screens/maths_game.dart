// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathsGame extends StatefulWidget {
  const MathsGame({Key? key}) : super(key: key);

  @override
  _MathsGameState createState() => _MathsGameState();
}

class _MathsGameState extends State<MathsGame> {
  String question = '';
  String answer = '';
  String userAnswer = '';
  bool isCorrect = false;
  int correctCount = 0;
  int questionCount = 0;
  TextEditingController answerController = TextEditingController();
  bool isGameCompleted = false;

  @override
  void initState() {
    generateQuestion();
    super.initState();
  }

  @override
  void dispose() {
    answerController.dispose();
    isGameCompleted = false;
    super.dispose();
  }

  void generateQuestion() {
    Random random = Random();
    int number1 = random.nextInt(90) + 10; // Generate a 2-digit number
    int number2 = random.nextInt(90) + 10; // Generate a 2-digit number
    int operatorIndex = random.nextInt(3); // Randomly select an operator

    String operator;
    int result;

    switch (operatorIndex) {
      case 0: // Addition
        operator = '+';
        result = number1 + number2;
        break;
      case 1: // Subtraction
        operator = '-';
        result = number1 - number2;
        break;
      case 2: // Multiplication
        operator = '×';
        result = number1 * number2;
        break;
      default:
        operator = '+';
        result = number1 + number2;
        break;
    }

    question = '$number1 $operator $number2 =';
    answer = result.toString();
  }

  void checkAnswer() async {
    setState(() {
      if (userAnswer == answer) {
        isCorrect = true;
        correctCount++;
      } else {
        isCorrect = false;
      }
      questionCount++;
    });

    if (!isCorrect) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          userAnswer = '';
          answerController.clear();
        });
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          userAnswer = '';
          answerController.clear();
        });
      });
    }

    if (questionCount >= 5) {
      isGameCompleted = true;
    }
    await Future.delayed(const Duration(seconds: 2));
    generateQuestion();
  }

  void nextQuestion() {
    setState(() {
      userAnswer = '';
      answerController.clear();
      generateQuestion();
    });
  }

  void saveScore() {
    double score = (correctCount / questionCount) * 100;
    double roundedAns = double.parse(score.toStringAsFixed(2));
    Get.to(() => ScoreScreen(percentage: roundedAns));
  }

  Future<bool> _showExitConfirmationDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Exit Confirmation',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text(
              'Are you sure you want to exit?\nExiting will result in losing progress'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false to prevent exiting
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to allow exiting
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
    return result ?? false; // Return false if the dialog is dismissed
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitConfirmationDialog,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Maths Game'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  style: const TextStyle(),
                  controller: answerController,
                  onChanged: (value) {
                    userAnswer = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter your answer',
                  ),
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer();
                  },
                  child: const Text('Check Answer'),
                ),
                const SizedBox(height: 5.0),
                if (userAnswer.isNotEmpty)
                  Text(
                    isCorrect
                        ? 'Correct!'
                        : 'Incorrect! The answer is $answer.',
                    style: TextStyle(
                      color: isCorrect ? Colors.green : Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    nextQuestion();
                  },
                  child: const Text('Next Question'),
                ),
                const SizedBox(height: 75.0),
                Text(
                  'Correct answers: $correctCount/$questionCount',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 75.0),
                !isGameCompleted
                    ? const SizedBox(
                        height: 15,
                      )
                    : ElevatedButton(
                        onPressed: saveScore,
                        child: const Text(
                          "Finish Game",
                          style: TextStyle(fontSize: 18),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
