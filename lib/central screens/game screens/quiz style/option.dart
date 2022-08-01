import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option extends StatefulWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
    //required this.image,
  }) : super(key: key);

  final String text;
  final int index;
  //final String image;
  final VoidCallback press;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  Widget getOptionImage(String text) {
    if (text.startsWith("lib/assets")) {
      return Image.asset(text);
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(ExplorePage.index),
        builder: (qnController) {
          Color getRightColor() {
            if (qnController.isAnswered) {
              if (widget.index == qnController.correctAns) {
                return Colors.green;
              } else if (widget.index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getRightIcon() {
            return getRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          Widget getOptionImage(String text) {
            if (text.startsWith("lib/assets")) {
              return Container(
                  height: 200, width: 200, child: Image.asset(text));
            } else {
              return Text(
                "${widget.index + 1}) ${text}",
                style: TextStyle(color: getRightColor(), fontSize: 18),
              );
            }
          }

          return InkWell(
            onTap: widget.press,
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
                  // Text(
                  //   "${widget.index + 1}) ${widget.text}",
                  //   style: TextStyle(color: getRightColor(), fontSize: 18),
                  // ),
                  getOptionImage(widget.text),

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
