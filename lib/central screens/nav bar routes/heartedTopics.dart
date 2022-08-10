import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/square_temp.dart';
import 'package:flutter/material.dart';

class HeartedTopics extends StatefulWidget {
  const HeartedTopics({Key? key}) : super(key: key);

  @override
  State<HeartedTopics> createState() => _HeartedTopicsState();
}

class _HeartedTopicsState extends State<HeartedTopics> {
  List heartedTopics = SelectionTiles.likedTopics;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(heartedTopics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "Your Favourite Topics",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: heartedTopics.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [MySquare(text: heartedTopics[index])],
            );
          })),
    );
  }
}
