import 'dart:math';

import 'package:flutter/material.dart';

class MatchingTilesGame2 extends StatefulWidget {
  const MatchingTilesGame2({Key? key}) : super(key: key);

  @override
  State<MatchingTilesGame2> createState() => _MatchingTilesGame1State();
}

class _MatchingTilesGame1State extends State<MatchingTilesGame2> {
  final Map<String, bool> score = {};

  final Map choices = {
    'Liberation': 'The act of gaining equal rights',
    'Draconian': 'Unusually cruel',
    'Jubilant': 'Showing great joy', //Fill in with new ones
  };

  int randomiser = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:
            Text('Match the Tiles! Score: ${score.length} / ${choices.length}'),
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            randomiser++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.keys.map((letter) {
                return Draggable<String>(
                  data: letter,
                  child: DragOne(
                    dragone: score[letter] == true ? "Correct" : letter,
                    textCol: Colors.black, //Default col
                  ), //if correct show 'Correct' else show the original letter
                  feedback: DragOne(
                    dragone: letter,
                    textCol: Colors.grey, //Col when dragged
                  ),
                  childWhenDragging: DragOne(
                    dragone: letter,
                    textCol: Colors.grey, //Col left behind
                  ),
                );
              }).toList()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((arrow) => buildDragTarget(arrow)).toList()
                  ..shuffle(Random(randomiser)),
          ),
        ],
      ),
    );
  }

  Widget buildDragTarget(arrow) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[arrow] == true) {
          return Container(
            color: Colors.transparent,
            child: Text("Oui"),
            alignment: Alignment.center,
            height: 80,
            width: 80,
          );
        } else {
          return Container(child: Text(choices[arrow]));
        }
      },
      onWillAccept: (data) => data == arrow,
      onAccept: (data) {
        setState(() {
          score[arrow] = true;
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
