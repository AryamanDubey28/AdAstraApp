import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Spacer(),
                Center(
                  child: Text(
                    "Lets Play",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 96.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "VR Style Practice Test",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/game2");
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
