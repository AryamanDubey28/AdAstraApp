import 'package:firebase_attempt/central%20screens/PageColor.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/progress_bar.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question_card.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController(
      ExplorePage.index,
    ));
    return Scaffold(
        backgroundColor: getPageColor(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProgressBar(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text.rich(TextSpan(
                          text:
                              "Question ${_questionController.questionNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.grey[200]),
                          children: [
                            TextSpan(
                                text:
                                    "/${_questionController.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(color: Colors.grey[200])),
                          ],
                        )),
                      )),
                  const Divider(
                    thickness: 2,
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateQuestion,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
