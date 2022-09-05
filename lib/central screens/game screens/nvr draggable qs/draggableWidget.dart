import 'package:firebase_attempt/central%20screens/game%20screens/nvr%20draggable%20qs/draggableQuestion.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  //const DraggableWidget({Key? key, required this.question}) : super(key: key);

  static double size = 150;
  final DraggableQuestion question;
  late String correctOption;

  DraggableWidget({required this.question});

  Widget buildImage() {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.white),
      child: Image.asset(question.imageUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<DraggableQuestion>(
      data: question,
      child: buildImage(),
      feedback: buildImage(),
      childWhenDragging: Container(
        height: size,
      ),
    );
  }
}
