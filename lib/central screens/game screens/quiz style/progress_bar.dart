import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: logicalHeight * 0.04,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(ExplorePage.index),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                    builder: ((context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.animation.value,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.teal,
                                Color.fromARGB(255, 4, 250, 225),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ))),
                Positioned.fill(
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Iconsax.clock),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
