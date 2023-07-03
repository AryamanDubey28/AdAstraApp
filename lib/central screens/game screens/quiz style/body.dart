import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/progress_bar.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question_card.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    QuestionController questionController = Get.put(QuestionController(
      ExplorePage.index,
    ));
    return Scaffold(
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
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headlineMedium,
                      children: [
                        TextSpan(
                            text: "/${questionController.questions.length}",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    )),
                  )),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateQuestion,
                  itemCount: questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: questionController.questions[index],
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
