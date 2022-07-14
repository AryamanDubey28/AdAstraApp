import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage4 extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Signed in as: " + user.email!,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            )),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Icon(Icons.logout)),
          )
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "We have over a decade of experience across the core subject areas and we are constantly growing to support more needs and subjects. ",
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Lottie.network(
              "https://assets3.lottiefiles.com/packages/lf20_dT1E1P.json"),
        ),
        SizedBox(
          height: 15,
        ),
        FadeIn(
          duration: Duration(milliseconds: 2000),
          child: Text(
            "For a tailored service, Click 'Done' below",
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
