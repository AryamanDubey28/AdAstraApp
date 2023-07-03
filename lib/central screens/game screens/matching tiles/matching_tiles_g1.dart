// import 'dart:math';

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';

// import 'dart:async';

// class MatchingTilesGame1 extends StatefulWidget {
//   const MatchingTilesGame1({Key? key}) : super(key: key);

//   @override
//   State<MatchingTilesGame1> createState() => _MatchingTilesGame1State();
// }

// class _MatchingTilesGame1State extends State<MatchingTilesGame1> {
//   final Map<String, bool> score = {};
//   int roundCounter = 0;

//   Map<String, String> choices = {};

//   Future<void> buildChoices() async {
//     choices.clear();
//     score.clear();

//     while (choices.length < 5) {
//       Word? word = await SheetQuestions.getById(getRandomNum());
//       choices[word!.word] = word.definition;
//     }

//     if (roundCounter > 2) {
//       Navigator.popAndPushNamed(context, '/congrats');
//     }

//     randomiser++;
//     setState(() {});
//   }

//   int getRandomNum() {
//     Random random = Random();
//     int num = random.nextInt(12);
//     return num;
//   }

//   @override
//   void initState() {
//     buildChoices();
//     super.initState();
//   }

//   int randomiser = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         title: Text('Score: ${score.length} / ${choices.length}'),
//         //backgroundColor: Colors.blue[200],
//         elevation: 1,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: () {
//                 buildChoices();
//               },
//               child: Icon(Icons.refresh),
//             ),
//           ),
//         ],
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Flexible(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: choices.keys.map((letter) {
//                 return ValueListenableBuilder<bool>(
//                   valueListenable: scoreNotifier(letter),
//                   builder: (BuildContext context, bool value, Widget? child) {
//                     return Draggable<String>(
//                       data: letter,
//                       child: DragOne(
//                         dragOne: value ? "Correct" : letter,
//                         textCol: Colors.black, // Default col
//                       ),
//                       feedback: DragOne(
//                         dragOne: letter,
//                         textCol: Colors.blue, // Col when dragged
//                       ),
//                       childWhenDragging: DragOne(
//                         dragOne: letter,
//                         textCol: Colors.grey, // Col left behind
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//           Flexible(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children:
//                   choices.keys.map((arrow) => buildDragTarget(arrow)).toList()
//                     ..shuffle(Random(randomiser)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildDragTarget(String arrow) {
//     return DragTarget<String>(
//       builder: (BuildContext context, List<String?> incoming,
//           List<dynamic> rejected) {
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
//               child: AutoSizeText(
//                 choices[arrow]!,
//                 style: TextStyle(fontSize: 16),
//                 maxLines: 2,
//               ),
//             ),
//           );
//         }
//       },
//       onWillAccept: (data) => data == arrow && score[arrow] != true,
//       onAccept: (data) {
//         setState(() {
//           score[data] = true;

//           if (score.length == choices.length) {
//             buildChoices();
//             roundCounter++;
//           }
//         });
//       },
//       onLeave: (data) {},
//     );
//   }

//   ValueNotifier<bool> scoreNotifier(String letter) {
//     if (score.containsKey(letter)) {
//       return ValueNotifier<bool>(score[letter] == true);
//     } else {
//       return ValueNotifier<bool>(false);
//     }
//   }
// }

// class DragOne extends StatelessWidget {
//   const DragOne({Key? key, required this.dragOne, required this.textCol})
//       : super(key: key);

//   final String dragOne;
//   final Color textCol;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(5),
//         child: Text(
//           dragOne,
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

// class Word {
//   final String word;
//   final String definition;

//   Word({required this.word, required this.definition});
// }

// class SheetQuestions {
//   static Future<Word?> getById(int id) async {
//     List<Map<String, String>> words = [
//       {'word': 'Apple', 'definition': 'A fruit'},
//       {'word': 'Banana', 'definition': 'A yellow fruit'},
//       {'word': 'Cat', 'definition': 'A furry animal'},
//       {'word': 'Dog', 'definition': 'A loyal pet'},
//       {'word': 'Elephant', 'definition': 'A large mammal'},
//       {'word': 'Flower', 'definition': 'A colorful plant'},
//       {'word': 'Giraffe', 'definition': 'A tall animal'},
//       {'word': 'Horse', 'definition': 'A graceful animal'},
//       {'word': 'Ice Cream', 'definition': 'A frozen dessert'},
//       {'word': 'Jellyfish', 'definition': 'A gelatinous sea creature'},
//       {'word': 'Kangaroo', 'definition': 'A hopping marsupial'},
//       {'word': 'Lion', 'definition': 'The king of the jungle'},
//     ];

//     if (id >= 0 && id < words.length) {
//       Map<String, String> wordData = words[id];
//       return Word(
//         word: wordData['word']!,
//         definition: wordData['definition']!,
//       );
//     }

//     return null;
//   }
// }

