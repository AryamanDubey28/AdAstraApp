import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        FadeIn(
          duration: const Duration(milliseconds: 1800),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Launched in 2008, we have spent over a decade working with students to achieve their individual goals",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Center(
          child: Lottie.network(
              "https://assets9.lottiefiles.com/packages/lf20_7htpyk2w.json"),
        ),
        const SizedBox(
          height: 14.0,
        ),
        FadeIn(
          duration: const Duration(milliseconds: 1800),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "And we're still going strong today!",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
