import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/score_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool onLastQuestion = false;

  List<Question> _questions = [];

  //SelectionTiles.topic

  QuestionController(int index) {
    _questions = buildQuestionList(index, SelectionTiles.topic)
        .map((question) => Question(
              id: question["id"],
              question: question["question"],
              image: question["image"],
              options: question["options"],
              answer: question["answer_index"],
            ))
        .toList();
  }

  // if (index == 0) {
  //   _questions = sample_data_vr
  //       .map((question) => Question(
  //             id: question["id"],
  //             question: question["question"],
  //             image: question["image"],
  //             options: question["options"],
  //             answer: question["answer_index"],
  //           ))
  //       .toList();
  // } else if (index == 1) {
  //   _questions = sample_data_nvr
  //       .map((question) => Question(
  //             id: question["id"],
  //             question: question["question"],
  //             image: question["image"],
  //             options: question["options"],
  //             answer: question["answer_index"],
  //           ))
  //       .toList();
  // } else if (index == 2) {
  //   _questions = sample_data_numeracy
  //       .map((question) => Question(
  //             id: question["id"],
  //             question: question["question"],
  //             image: question["image"],
  //             options: question["options"],
  //             answer: question["answer_index"],
  //           ))
  //       .toList();

  List buildQuestionList(int index, String topic) {
    List topic_list = [];
    if (index == 0) {
      for (int i = 0; i < sample_data_vr.length; i++) {
        if (sample_data_vr[i]["category"] == topic.toLowerCase()) {
          topic_list.add(sample_data_vr[i]);
        }
      }
    } else if (index == 1) {
      for (int i = 0; i < sample_data_nvr.length; i++) {
        if (sample_data_nvr[i]["category"] == topic.toLowerCase()) {
          topic_list.add(sample_data_nvr[i]);
        }
      }
    } else if (index == 2) {
      for (int i = 0; i < sample_data_numeracy.length; i++) {
        if (sample_data_numeracy[i]["category"] == topic.toLowerCase()) {
          topic_list.add(sample_data_numeracy[i]);
        }
      }
    }

    return topic_list;
  }

  // void buildQuestions() {
  //   if (ExplorePage.index == 0) {
  //     _questions = sample_data_vr
  //         .map((question) => Question(
  //               id: question["id"],
  //               question: question["question"],
  //               options: question["options"],
  //               answer: question["answer_index"],
  //             ))
  //         .toList();
  //   } else if (ExplorePage.index == 1) {
  //     print("To do still...");
  //   } else if (ExplorePage.index == 2) {}
  // }

  // List<Question> _questions = sample_data_vr
  //     .map((question) => Question(
  //           id: question["id"],
  //           question: question["question"],
  //           options: question["options"],
  //           answer: question["answer_index"],
  //         ))
  //     .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: getSeconds()),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  int getSeconds() {
    if (ExplorePage.index == 2) {
      return 15;
    } else {
      return 60;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question q, int selectedIndex) {
    _isAnswered = true;
    _correctAns = q.answer!;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Navigator.popAndPushNamed(
      //     context, '/scoreScreen'); //Navigate to score screen
      Get.to(() => ScoreScreen());
      //onLastQuestion = true;
    }
  }

  void updateQuestion(int index) {
    _questionNumber.value = index + 1;
  }

  int getPercentage() {
    double p = _numOfCorrectAns / questions.length;
    double x = p * 100;
    int y = x.round();
    return y;
  }
}