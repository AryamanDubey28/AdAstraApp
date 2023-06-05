import 'dart:math';
import 'package:firebase_attempt/central%20screens/PageColor.dart';
import 'package:firebase_attempt/central%20screens/congrats_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MathsGame extends StatefulWidget {
  @override
  _MathsGameState createState() => _MathsGameState();
}

class _MathsGameState extends State<MathsGame> {
  String question = '';
  String answer = '';
  String userAnswer = '';
  bool isCorrect = false;
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    generateQuestion();
    super.initState();
  }

  @override
  void dispose() {
    answerController.dispose();
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

  void checkAnswer() {
    setState(() {
      if (userAnswer == answer) {
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      userAnswer = '';
      answerController.clear();
      generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maths Game'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style: const TextStyle(
                    fontSize: 44.0, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 1.0),
              if (userAnswer.isNotEmpty)
                Text(
                  isCorrect ? 'Correct!' : 'Incorrect! Try again.',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text('Next Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
