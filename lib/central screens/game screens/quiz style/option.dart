import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getRightIcon() {
            return getRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(color: getRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}) $text",
                    style: TextStyle(color: getRightColor(), fontSize: 16),
                  ),
                  Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          color: getRightColor() == Colors.grey
                              ? Colors.transparent
                              : getRightColor(),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: getRightColor())),
                      child: getRightColor() == Colors.grey
                          ? null
                          : Icon(getRightIcon(), size: 16))
                ],
              ),
            ),
          );
        });
  }
}
