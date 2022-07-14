import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

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
          duration: Duration(milliseconds: 1800),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Ad Astra is Latin for ‘to the stars’, which reflects our ethos as we aim to inspire students to believe in themselves",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Lottie.network(
              "https://assets5.lottiefiles.com/packages/lf20_083h7wcs.json"),
        ),
      ]),
    );
  }
}
