import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  late final String text;

  MySquare({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 200,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300]),
        )),
      ),
    );
  }
}
