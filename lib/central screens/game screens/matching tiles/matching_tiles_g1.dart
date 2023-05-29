import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_questions.dart';
import 'package:firebase_attempt/central%20screens/question_sheets.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:math';

class MatchingTilesGame1 extends StatefulWidget {
  const MatchingTilesGame1({Key? key}) : super(key: key);

  @override
  State<MatchingTilesGame1> createState() => _MatchingTilesGame1State();
}

class _MatchingTilesGame1State extends State<MatchingTilesGame1> {
  final Map<String, bool> score = {};
  int roundCounter = 0;

  Map<String, String> choices = {};

  Future<void> buildChoices() async {
    choices.clear();
    score.clear();

    while (choices.length < 5) {
      Word? word = await SheetQuestions.getById(getRandomNum());
      choices[word!.word] = word.definition;
    }

    if (roundCounter > 2) {
      Navigator.popAndPushNamed(context, '/congrats');
    }

    randomiser++;
    setState(() {});
  }

  int getRandomNum() {
    Random random = Random();
    int num = random.nextInt(12);
    return num;
  }

  @override
  void initState() {
    buildChoices();
    super.initState();
  }

  int randomiser = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Score: ${score.length} / ${choices.length}'),
        //backgroundColor: Colors.blue[200],
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                buildChoices();
              },
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: choices.keys.map((letter) {
                return ValueListenableBuilder<bool>(
                  valueListenable: scoreNotifier(letter),
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Draggable<String>(
                      data: letter,
                      child: DragOne(
                        dragOne: value ? "Correct" : letter,
                        textCol: Colors.black, // Default col
                      ),
                      feedback: DragOne(
                        dragOne: letter,
                        textCol: Colors.blue, // Col when dragged
                      ),
                      childWhenDragging: DragOne(
                        dragOne: letter,
                        textCol: Colors.grey, // Col left behind
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  choices.keys.map((arrow) => buildDragTarget(arrow)).toList()
                    ..shuffle(Random(randomiser)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDragTarget(String arrow) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming,
          List<dynamic> rejected) {
        if (score[arrow] == true) {
          return Container(
            color: Colors.transparent,
            child: Text(
              "✅",
              style: TextStyle(fontSize: 40),
            ),
          );
        } else {
          return SafeArea(
            child: Container(
              child: AutoSizeText(
                choices[arrow]!,
                style: TextStyle(fontSize: 16),
                maxLines: 2,
              ),
            ),
          );
        }
      },
      onWillAccept: (data) => data == arrow && score[arrow] != true,
      onAccept: (data) {
        setState(() {
          score[data] = true;

          if (score.length == choices.length) {
            buildChoices();
            roundCounter++;
          }
        });
      },
      onLeave: (data) {},
    );
  }

  ValueNotifier<bool> scoreNotifier(String letter) {
    if (score.containsKey(letter)) {
      return ValueNotifier<bool>(score[letter] == true);
    } else {
      return ValueNotifier<bool>(false);
    }
  }
}

class DragOne extends StatelessWidget {
  const DragOne({Key? key, required this.dragOne, required this.textCol})
      : super(key: key);

  final String dragOne;
  final Color textCol;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text(
          dragOne,
          style: TextStyle(
            color: textCol,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Word {
  final String word;
  final String definition;

  Word({required this.word, required this.definition});
}

class SheetQuestions {
  static Future<Word?> getById(int id) async {
    List<Map<String, String>> words = [
      {'word': 'Apple', 'definition': 'A fruit'},
      {'word': 'Banana', 'definition': 'A yellow fruit'},
      {'word': 'Cat', 'definition': 'A furry animal'},
      {'word': 'Dog', 'definition': 'A loyal pet'},
      {'word': 'Elephant', 'definition': 'A large mammal'},
      {'word': 'Flower', 'definition': 'A colorful plant'},
      {'word': 'Giraffe', 'definition': 'A tall animal'},
      {'word': 'Horse', 'definition': 'A graceful animal'},
      {'word': 'Ice Cream', 'definition': 'A frozen dessert'},
      {'word': 'Jellyfish', 'definition': 'A gelatinous sea creature'},
      {'word': 'Kangaroo', 'definition': 'A hopping marsupial'},
      {'word': 'Lion', 'definition': 'The king of the jungle'},
    ];

    if (id >= 0 && id < words.length) {
      Map<String, String> wordData = words[id];
      return Word(
        word: wordData['word']!,
        definition: wordData['definition']!,
      );
    }

    return null;
  }
}






// class MatchingTilesGame1 extends StatefulWidget {
//   const MatchingTilesGame1({Key? key}) : super(key: key);

//   @override
//   State<MatchingTilesGame1> createState() => _MatchingTilesGame1State();
// }

// class _MatchingTilesGame1State extends State<MatchingTilesGame1> {
//   final Map<String, bool> score = {};
//   int roundCounter = 0;

//   Map choices = {
//   };

//   Future buildChoices() async {
//     choices.clear();
//     score.clear();
//     print(choices);

//     while (choices.length < 5) {
//       Word? word = await QuestionSheets.getById(getRandomNum());
//       choices[word!.toJson()['word']] = word.toJson()['definition'];
//     }

//     if (roundCounter > 2) {
//       Navigator.popAndPushNamed(context, '/congrats');
//     }
//     print(choices);
//     randomiser++;
//     setState(() {});
//   }

//   int getRandomNum() {
//     Random random = new Random();
//     //646
//     int r1 = random.nextInt(50) + 1;
//     int r2 = random.nextInt(50);
//     if (r1 == r2) {
//       r1 = random.nextInt(50) + 1;
//     }

//     print(r2 + 1);
//     return r2 + 1;
//   }

//   @override
//   void initState() {
//     print(choices);
//     buildChoices();
//     super.initState();
//   }


//   int randomiser = 1;

//   Future<bool> _onWillPop() async {
//     return false;
//   }


//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         backgroundColor: Colors.blue[200],
//         appBar: AppBar(
//           title: Text('Score: ${score.length} / ${choices.length}'),
//           backgroundColor: Colors.blue[200],
//           automaticallyImplyLeading: false,
//           elevation: 1,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: GestureDetector(
//                   onTap: () {
//                     buildChoices();
//                   },
//                   child: Icon(Icons.refresh)),
//             ),
//           ],
//         ),
 
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: choices.keys.map((letter) {
//                     return Draggable<String>(
//                       data: letter,
//                       child: DragOne(
//                         dragone: score[letter] == true ? "Correct" : letter,
//                         textCol: Colors.black, //Default col
//                       ), //if correct show 'Correct' else show the original letter
//                       feedback: DragOne(
//                         dragone: letter,
//                         textCol: Colors.blue, //Col when dragged
//                       ),
//                       childWhenDragging: DragOne(
//                         dragone: letter,
//                         textCol: Colors.grey, //Col left behind
//                       ),
//                     );
//                   }).toList()),
//             ),
//             Flexible(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children:
//                     choices.keys.map((arrow) => buildDragTarget(arrow)).toList()
//                       ..shuffle(Random(randomiser)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDragTarget(arrow) {
//     return DragTarget<String>(
//       builder: (BuildContext context, List<String?> incoming, List rejected) {
//         if (score[arrow] == true) {
//           return Container(
//             color: Colors.transparent,
//             child: Text(
//               "✅",
//               style: TextStyle(fontSize: 40),
//             ),
//           );
//         } else {
//           return SafeArea(
//             child: Container(
//                 child:
//                     AutoSizeText(
//               choices[arrow] + "   ",
//               style: TextStyle(fontSize: 16),
//               maxLines: 2,
//             )),
//           );
//         }
//       },
//       onWillAccept: (data) => data == arrow,
//       onAccept: (data) {
//         setState(() {
//           score[arrow] = true;

//           if (score.length == choices.length) {
//             buildChoices();
//             roundCounter++;
//           }

//           //success
//         });
//       },
//       onLeave: (data) {},
//     );
//   }
// }

// class DragOne extends StatelessWidget {
//   DragOne({Key? key, required this.dragone, required this.textCol})
//       : super(key: key);

//   late final String dragone;
//   late final Color textCol;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           //color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(5),
//         child: Text(
//           dragone,
//           style: TextStyle(
//             color: textCol,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ItemModel {
//   late IconData icon;
//   late String name;
//   late String value;
//   late bool accepting;

//   ItemModel(icon, name, value, accepting) {
//     this.icon = icon;
//     this.name = name;
//     this.value = value;
//     this.accepting = accepting;
//   }
// }
