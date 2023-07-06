// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  late final String text;
  late String? imagePath;

  MySquare({super.key, required this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 100,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        )),
      ),
    );
  }
}
