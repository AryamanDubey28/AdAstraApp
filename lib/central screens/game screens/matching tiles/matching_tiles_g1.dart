import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      if (getRandomNum() != 9) {
        choices[word!.toJson()['word']] = word.toJson()['definition'];
      }
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
    int r1 = random.nextInt(16) + 1;
    int r2 = random.nextInt(16);
    if (r1 == r2) {
      r1 = random.nextInt(16) + 1;
    }

    if (r1 + 1 == 9 || r2 + 1 == 9) {
      return 8;
    }
    print(r2 + 1);
    return r2 + 1;
  }

  @override
  void initState() {
    print(choices);
    buildChoices();
    super.initState();
  }

  int randomiser = 1;

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Score: ${score.length} / ${choices.length}'),
          backgroundColor: Colors.blue[900],
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    buildChoices();
                  },
                  child: Icon(Icons.refresh)),
            )
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
              choices[arrow],
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
