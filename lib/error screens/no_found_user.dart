import 'package:flutter/material.dart';

class NoFoundUser extends StatelessWidget {
  const NoFoundUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: Text(
        "Error. No user found for that email",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
