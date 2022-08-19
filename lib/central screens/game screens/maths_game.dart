import 'dart:math';
import 'package:firebase_attempt/central%20screens/congrats_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// class MathsGame extends StatefulWidget {
//   const MathsGame({Key? key}) : super(key: key);

//   @override
//   State<MathsGame> createState() => _MathsGameState();
// }

// class _MathsGameState extends State<MathsGame> {
//   Random random = Random();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[200],

//       ),

//     );
//   }
// }
// class MathsGame extends StatelessWidget {
//   //const MathsGame({Key? key}) : super(key: key);

//   final questionController = TextEditingController();

//   List operations = ['/', '+', '*', '-'];

//   static late int a;
//   static late int b;
//   static late int index;

//   Widget getMathsQuestion() {
//     Random random = Random();
//     a = random.nextInt(100);
//     b = random.nextInt(100);

//     index = random.nextInt(operations.length);
//     String operation = operations[index];

//     return Center(
//         child: Text(
//       "$a $operation $b = ",
//       style: TextStyle(fontSize: 40),
//     ));
//   }

//   void checkAns() {
//     String op = operations[index];
//     num ans = getAns(a, b);
//     print(ans);
//     print(questionController.text);
//     if (ans == questionController.text) {
//       print("correct");
//     } else {
//       print("try again");
//     }
//   }

//   num getAns(int x, int y) {
//     String op = operations[index];
//     if (op == '/') {
//       return x / y;
//     } else if (op == '*') {
//       return x * y;
//     } else if (op == '+') {
//       return x * y;
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
//         title: Text("Maths Activity!"),
//       ),
//       body: Column(
//         children: [
//           Spacer(),
//           //getMathsQuestion(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 getMathsQuestion(),
//                 Expanded(
//                   child: TextField(
//                     controller: questionController,
//                     decoration: InputDecoration(
//                         //border: InputBorder.,
//                         //hintText: '          ?',
//                         ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Spacer(),
//           ButtonWidget(
//               text: "Check!",
//               onClicked: () {
//                 checkAns();
//               }),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
class MathsGame extends StatefulWidget {
  const MathsGame({Key? key}) : super(key: key);

  @override
  State<MathsGame> createState() => _MathsGameState();
}

class _MathsGameState extends State<MathsGame> {
  final questionController = TextEditingController();

  List operations = ['/', '+', '*', '-'];

  static late int a;
  static late int b;
  static late int index;

  Widget getMathsQuestion() {
    Random random = Random();
    a = random.nextInt(100) + 1;
    b = random.nextInt(100) + 1;

    index = random.nextInt(operations.length);
    String operation = operations[index];

    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Center(
          child: Text(
        "$a $operation $b = ",
        style: TextStyle(
          fontSize: 40,
          fontFamily: "Cambria",
        ),
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    questionController.dispose();
  }

  void checkAns() {
    String op = operations[index];
    num ans = getAns(a, b);
    print(ans);
    print(questionController.text);
    String answer = ans.toString();
    if (answer == questionController.text) {
      print("correct");
      Get.to(() => CongratsScreen());
    } else {
      print("try again");
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.blue[200],
          builder: ((context) => buildSheet()));
    }
  }

  Widget buildSheet() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
          child: Center(
              child: Text(
            "That doesn't seem correct, try again!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(
          height: 250,
          child: Lottie.network(
              "https://assets6.lottiefiles.com/packages/lf20_CTviZ9.json"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 30, 8, 4),
          child: ButtonWidget(
              text: "Close",
              onClicked: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  }

  num getAns(int x, int y) {
    String op = operations[index];
    if (op == '/') {
      return x / y;
    } else if (op == '*') {
      return x * y;
    } else if (op == '+') {
      return x + y;
    } else {
      return x - y;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Todays Maths Game"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Column(
        children: [
          Spacer(),
          //getMathsQuestion(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                getMathsQuestion(),
                Expanded(
                  child: TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                        //border: InputBorder.,
                        //hintText: '          ?',
                        ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          ButtonWidget(
              text: "Check!",
              onClicked: () {
                checkAns();
              }),
          Spacer(),
        ],
      ),
    );
  }
}
