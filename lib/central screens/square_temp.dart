import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  late final String text;
  late String? imagePath;

  MySquare({required this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(30),
          // image: DecorationImage(
          //   image: AssetImage('lib/assets/VR3.jpg'),
          //   fit: BoxFit.fill,
          // ),
        ),
        height: 200,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        )),
      ),
    );
  }
}
