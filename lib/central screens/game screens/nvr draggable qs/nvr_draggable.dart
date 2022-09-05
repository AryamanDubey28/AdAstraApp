import 'package:firebase_attempt/central%20screens/game%20screens/nvr%20draggable%20qs/draggableQuestion.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/nvr%20draggable%20qs/draggableWidget.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question.dart';
import 'package:flutter/material.dart';

class NVR_Draggable extends StatefulWidget {
  const NVR_Draggable({Key? key}) : super(key: key);

  @override
  State<NVR_Draggable> createState() => _NVR_DraggableState();
}

class _NVR_DraggableState extends State<NVR_Draggable> {
  final List dr_questions = allNVRDraggableQuestions;

  int score = 0;

  Widget buildOrigin() {
    return Stack(
      alignment: Alignment.center,
      children: dr_questions
          .map((e) => DraggableWidget(
                question: e,
              ))
          .toList(),
    );
  }

  Widget buildTargets(BuildContext context) {
    // return buildTrarget(
    //   context,
    //   text: 'Questions',
    //   acceptType: ""
    // );
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        title: Text("NVR Draggable"),
      ),
      body: Column(
        children: [
          buildOrigin(),
          buildTargets(context),
        ],
      ),
    );
  }
}
