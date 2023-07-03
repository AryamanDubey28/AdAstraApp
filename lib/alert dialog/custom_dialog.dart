import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;

  const CustomAlertDialog({
    super.key,
    required this.title,
  });

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), // Border radius value
        ),
        child: Column(
          children: [
            SizedBox(height: 200, child: Lottie.asset(correctAnimation())),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
