import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_g1.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_g2.dart';
import 'package:firebase_attempt/central%20screens/square_temp.dart';
import 'package:flutter/material.dart';

class Activity1 extends StatelessWidget {
  final List games = [
    'Words to Definitions',
    'Words to Definitions: Harder',
    'Numeracy',
    'Game 4',
    'Game 5'
  ];
  final List gameRoutes = [
    MatchingTilesGame1(),
    MatchingTilesGame2(),
    null,
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
            itemCount: games.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => gameRoutes[index])),
                  child: MySquare(text: games[index]));
            }))

        //List view with the different activities??
        );
  }
}
