import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          FadeIn(
            duration: const Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Well Done !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 58.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Center(
            child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_pJo4Hp.json"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          FadeIn(
            duration: const Duration(milliseconds: 1800),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Thats super!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Back to home screen"),
              IconButton(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/playpage'),
                  icon: const Icon(Icons.exit_to_app)),
            ],
          )
        ]),
      ),
    );
  }
}
