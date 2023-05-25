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
      backgroundColor: getPageColor(),
      appBar: AppBar(
        title: Text('Maths Game'),
        backgroundColor: getPageColor(),
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
                    fontSize: 44.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: answerController,
                onChanged: (value) {
                  userAnswer = value;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter your answer',
                    hintStyle: TextStyle(color: Colors.white70)),
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



// class MathsGame extends StatefulWidget {
//   const MathsGame({Key? key}) : super(key: key);

//   @override
//   State<MathsGame> createState() => _MathsGameState();
// }

// class _MathsGameState extends State<MathsGame> {
//   final questionController = TextEditingController();

//   List operations = ['/', '+', '*', '-'];

//   static late int a;
//   static late int b;
//   static late int index;

//   Widget getMathsQuestion() {
//     Random random = Random();
//     a = random.nextInt(100) + 1;
//     b = random.nextInt(100) + 1;

//     index = random.nextInt(operations.length);
//     String operation = operations[index];

//     return Padding(
//       padding: const EdgeInsets.all(.0),
//       child: Center(
//           child: Text(
//         "$a $operation $b = ",
//         style: TextStyle(
//           fontSize: 40,
//           fontFamily: "Cambria",
//         ),
//       )),
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     questionController.dispose();
//   }

//   void checkAns() {
//     String op = operations[index];
//     num ans = getAns(a, b);
//     print(ans);
//     print(questionController.text);
//     String answer = ans.toString();
//     if (answer == questionController.text) {
//       print("correct");
//       Get.to(() => CongratsScreen());
//     } else {
//       print("try again");
//       showModalBottomSheet(
//           context: context,
//           backgroundColor: Colors.blue[200],
//           builder: ((context) => buildSheet()));
//     }
//   }

//   Widget buildSheet() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
//           child: Center(
//               child: Text(
//             "That doesn't seem correct, try again!",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           )),
//         ),
//         SizedBox(
//           height: 250,
//           child: Lottie.network(
//               "https://assets6.lottiefiles.com/packages/lf20_CTviZ9.json"),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(8, 30, 8, 4),
//           child: ButtonWidget(
//               text: "Close",
//               onClicked: () {
//                 Navigator.of(context).pop();
//               }),
//         )
//       ],
//     );
//   }

//   num getAns(int x, int y) {
//     String op = operations[index];
//     if (op == '/') {
//       return x / y;
//     } else if (op == '*') {
//       return x * y;
//     } else if (op == '+') {
//       return x + y;
//     } else {
//       return x - y;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[200],
//         title: Text("Todays Maths Game"),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
//       ),
//       body: Column(
//         children: [
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 getMathsQuestion(),
//                 Expanded(
//                   child: TextField(
//                     controller: questionController,
//                     decoration: InputDecoration(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Spacer(),
//           ButtonWidget(
//               text: "Check!",
//               onClicked: () {
//                 checkAns();
//               }),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
