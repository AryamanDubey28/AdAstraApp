import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
            title: Text("Choose below!"),
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Colors.blue[200]),
        body: ListView(
          children: [
            Center(
                child: Text(
              "Toggle between VR, NVR and Numeracy",
              style: TextStyle(fontSize: 24.0),
            )),
          ],
        ));
  }
}
