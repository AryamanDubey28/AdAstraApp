import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class QuestionBank extends StatelessWidget {
  // Future updateDB(String word, String definition) async {
  //   await FirebaseFirestore.instance
  //       .collection('matching tiles questions')
  //       .add({'word': word, 'meaning': definition});
  // }

  // Future load() async {
  //   updateDB("abridge", "to shorten by leaving out some parts");
  //   updateDB("acrimony", "angry and bitter feelings");
  //   updateDB("coward", "a person who shows shameful fear");
  //   updateDB("ineffable", "too great to be described or expressed");
  //   updateDB("obviate", "to prevent or avoid something");
  //   updateDB("stratagem", "a clever trick or plan");
  //   updateDB("truncate", "to make something shorter");
  //   updateDB("wend", "to go from one place to another");
  // }

  // Future<bool> checkForDuplicates() async {
  //   //returns true if duplicate, false if present
  //   return true;
  // }
  List<String> docIDs = [];
  Map<String, String> map = {};

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('matching tiles questions')
        .get()
        .then((value) => value.docs.forEach((element) {
              docIDs.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
