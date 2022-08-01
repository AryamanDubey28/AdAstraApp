import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_questions.dart';
import 'package:firebase_attempt/central%20screens/question_sheets.dart';
import 'package:flutter/material.dart';

class MatchingTilesGame1 extends StatefulWidget {
  const MatchingTilesGame1({Key? key}) : super(key: key);

  @override
  State<MatchingTilesGame1> createState() => _MatchingTilesGame1State();
}

class _MatchingTilesGame1State extends State<MatchingTilesGame1> {
  final Map<String, bool> score = {};
  int roundCounter = 0;

  Map choices = {
    // 'Disperse': 'To scatter',
    // 'Refute': 'To prove wrong',
    // 'Procure': 'To obtain',
    // 'Placid': 'Calm, peaceful',
    // 'Superfluous': 'Unnecessary'
  };

  Future buildChoices() async {
    // showDialog(
    //     context: context,
    //     builder: (context) => Center(child: CircularProgressIndicator()));

    //QuestionBank questionBank = QuestionBank();
    //updates db
    //await questionBank.getDocID();

    //read data from db then choose random ones to fill map choices with

    //Word? word = await QuestionSheets.getById(2);
    choices.clear();
    score.clear();
    print(choices);

    while (choices.length < 5) {
      Word? word = await QuestionSheets.getById(getRandomNum());
      choices[word!.toJson()['word']] = word.toJson()['definition'];
    }

    if (roundCounter > 2) {
      // Navigator.pop(context);
      Navigator.popAndPushNamed(context, '/congrats');
    }

    // print(word!.toJson()['word']);
    // print(word.toJson()['definition']);
    // print(word.toJson());
    // print("");
    print(choices);
    randomiser++;
    setState(() {});
    //Navigator.pop(context);

    //print(word!.toJson());
  }

  int getRandomNum() {
    Random random = new Random();
    //646
    int r1 = random.nextInt(50) + 1;
    int r2 = random.nextInt(50);
    if (r1 == r2) {
      r1 = random.nextInt(50) + 1;
    }

    print(r2 + 1);
    return r2 + 1;
  }

  @override
  void initState() {
    //Navigator.pushNamed(context, 'info');
    // Navigator.push(
    //     context, MaterialPageRoute(builder: ((context) => InformationSheet())));

    print(choices);
    buildChoices();
    //initGame();
    super.initState();
  }

  // initGame() {
  //   myScore = 0;
  //   gameOver = false;
  //   items = [
  //     ItemModel(Icons.ac_unit, "AC", "AC", true),
  //     ItemModel(Icons.air, "Air", "Air", true),
  //     ItemModel(Icons.table_restaurant, "Table", "Table", true),
  //   ];
  //   items2 = List<ItemModel>.from(items);
  //   items.shuffle();
  //   items2.shuffle();
  // }

  int randomiser = 1;

  Future<bool> _onWillPop() async {
    return false;
  }

  // Widget showScreenOne() {
  //   return Row(
  //     children: [
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: items
  //             .map((e) => Container(
  //                   margin: EdgeInsets.all(8),
  //                   child: Draggable<ItemModel>(
  //                     data: e,
  //                     childWhenDragging: Icon(e.icon),
  //                     feedback: Icon(
  //                       Icons.question_mark,
  //                       color: Colors.blue,
  //                     ),
  //                     child: Icon(
  //                       e.icon,
  //                       color: Colors.pink,
  //                     ),
  //                   ),
  //                 ))
  //             .toList(),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Column(
  //         children: items2
  //             .map((e) => DragTarget<ItemModel>(
  //                 onAccept: (recievedItem) {
  //                   if (e.value == recievedItem.value) {
  //                     setState(() {
  //                       items.remove(recievedItem);
  //                       items2.remove(e);
  //                       myScore += 10;
  //                       e.accepting = false;
  //                     });
  //                   } else {
  //                     setState(() {
  //                       myScore -= 5;
  //                       e.accepting = false;
  //                     });
  //                   }
  //                 },
  //                 onLeave: (recievedItem) {
  //                   setState(() {
  //                     e.accepting = false;
  //                   });
  //                 },
  //                 onWillAccept: (recievedItem) {
  //                   setState(() {
  //                     e.accepting = true;
  //                     if (items.isEmpty) {
  //                       gameOver = true;
  //                     }
  //                   });
  //                   return true;
  //                 },
  //                 builder: ((context, candidateData, rejectedData) => Container(
  //                       color: e.accepting ? Colors.red : Colors.teal,
  //                       height: 50,
  //                       width: 100,
  //                       child: Text(e.name),
  //                     ))))
  //             .toList(),
  //       ),
  //     ],
  //   );
  // }

  // Widget showScreenTwo() {
  //   return Column(
  //     children: [
  //       Text("Game Over"),
  //       ElevatedButton(
  //         child: Text("Done"),
  //         onPressed: () {
  //           Navigator.popAndPushNamed(context, '/congrats');
  //         },
  //       ),
  //     ],
  //   );
  // }

  // late bool gameOver;
  // late int myScore;
  // late List<ItemModel> items;
  // late List<ItemModel> items2;

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Test"),
  //     ),
  //     body: SingleChildScrollView(
  //       padding: EdgeInsets.all(16),
  //       child: Column(
  //         children: [
  //           Text("Score: $myScore"),
  //           !gameOver ? showScreenOne() : showScreenTwo(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('Score: ${score.length} / ${choices.length}'),
          backgroundColor: Colors.blue[200],
          automaticallyImplyLeading: false,
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    buildChoices();
                  },
                  child: Icon(Icons.refresh)),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.play_arrow),
        //   onPressed: () {
        //     setState(() {
        //       score.clear();

        //       randomiser++;

        //       //buildChoices();
        //     });
        //   },
        // ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: choices.keys.map((letter) {
                    return Draggable<String>(
                      data: letter,
                      child: DragOne(
                        dragone: score[letter] == true ? "Correct" : letter,
                        textCol: Colors.black, //Default col
                      ), //if correct show 'Correct' else show the original letter
                      feedback: DragOne(
                        dragone: letter,
                        textCol: Colors.blue, //Col when dragged
                      ),
                      childWhenDragging: DragOne(
                        dragone: letter,
                        textCol: Colors.grey, //Col left behind
                      ),
                    );
                  }).toList()),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    choices.keys.map((arrow) => buildDragTarget(arrow)).toList()
                      ..shuffle(Random(randomiser)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //implement an 'if score = 5/5, do something'

  Widget buildDragTarget(arrow) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[arrow] == true) {
          return Container(
            color: Colors.transparent,
            child: Text(
              "✅",
              style: TextStyle(fontSize: 40),
            ),
            // child: Text("Oui"),
            //alignment: Alignment.center,
          );
        } else {
          return SafeArea(
            child: Container(
                child:
                    //Text(choices[arrow]),
                    AutoSizeText(
              choices[arrow] + "   ",
              style: TextStyle(fontSize: 16),
              maxLines: 2,
            )),
          );
        }
      },
      onWillAccept: (data) => data == arrow,
      onAccept: (data) {
        setState(() {
          score[arrow] = true;

          if (score.length == choices.length) {
            buildChoices();
            roundCounter++;
          }

          //success
        });
      },
      onLeave: (data) {},
    );
  }
}

class DragOne extends StatelessWidget {
  DragOne({Key? key, required this.dragone, required this.textCol})
      : super(key: key);

  late final String dragone;
  late final Color textCol;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        // height: 100,
        // width: 100,
        padding: EdgeInsets.all(5),
        child: Text(
          dragone,
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

class ItemModel {
  late IconData icon;
  late String name;
  late String value;
  late bool accepting;

  ItemModel(icon, name, value, accepting) {
    this.icon = icon;
    this.name = name;
    this.value = value;
    this.accepting = accepting;
  }
}
