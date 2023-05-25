import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class InformationSheet extends StatelessWidget {
  const InformationSheet({Key? key}) : super(key: key);

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
                "Drag and drop the words to the definitions",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Center(
          child: Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_Lt8a0Z.json"),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/game1');
            },
            child: const Text(
              "Play Now!",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
