import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/body.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class QuizLayout extends StatefulWidget {
  const QuizLayout({Key? key}) : super(key: key);

  @override
  State<QuizLayout> createState() => _QuizLayoutState();
}

class _QuizLayoutState extends State<QuizLayout> {
  @override
  void dispose() {
    Get.delete<QuestionController>();
    super.dispose();
  }

  Future<bool> _showExitConfirmationDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Exit Confirmation',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text(
              'Are you sure you want to exit?\nExiting will result in losing progress'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false to prevent exiting
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to allow exiting
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
    return result ?? false; // Return false if the dialog is dismissed
  }

  getSkipColour(bool isDarkMode) {
    return isDarkMode ? Colors.grey[200] : Colors.black;
  }

//Wrap with willpopscope
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    QuestionController _controller =
        Get.put(QuestionController(ExplorePage.index));
    return WillPopScope(
      onWillPop: _showExitConfirmationDialog,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getSkipColour(themeProvider.isDarkMode)),
                    ),
                    onTap: () {
                      _controller.nextQuestion();
                    },
                  ),
                ),
              ),
            ],
          ),
          body: const Body()),
    );
  }
}
