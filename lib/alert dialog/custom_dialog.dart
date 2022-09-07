import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAlertDialog extends StatelessWidget {
  //const CustomAlertDialog({Key? key}) : super(key: key);
  final String title;

  CustomAlertDialog({required this.title});

  String correctAnimation() {
    if (title == "Added to Liked") {
      return "lib/assets/animations/heart_animation.json";
    } else if (title.contains("Bottom")) {
      return "lib/assets/animations/moving_anim.json"; //find better one
    } else if (title.contains("Top")) {
      return "lib/assets/animations/moving_anim.json"; //find better one
    }
    return "lib/assets/animations/error_anim.json";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: 250,
        child: Column(
          children: [
            SizedBox(height: 200, child: Lottie.asset(correctAnimation())),
            Expanded(
              child: Container(
                //text here
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
