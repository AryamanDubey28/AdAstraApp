import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FadeIn(
          duration: Duration(milliseconds: 1400),
          child: Text(
            "Ad Astra",
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontSize: 66.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FadeIn(
          duration: Duration(milliseconds: 1400),
          child: Center(
            child: Lottie.network(
                "https://assets5.lottiefiles.com/packages/lf20_qogkaqmb.json"),
          ),
        ),
        FadeIn(
          duration: Duration(milliseconds: 1800),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Reaching for Excellence in Education",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                fontSize: 32.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
        FadeIn(
          duration: Duration(milliseconds: 1800),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Join us today!",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  fontSize: 20.0,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
