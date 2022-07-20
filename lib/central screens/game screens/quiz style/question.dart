import 'package:firebase_database/firebase_database.dart';

class Question {
  late final int? id, answer;
  late final String question;
  late final List<String>? options;

  Question({this.id, required this.question, this.answer, this.options});
}

class BuildQuizDB {
  BuildQuizDB() {
    final referenceDB = FirebaseDatabase.instance;
    final ref = referenceDB.ref();
  }
}

const List sample_data = [
  {
    'id': 1,
    "question": "9 x 3 = _____",
    "options": ["20", "23", "17", "27"],
    "answer_index": 3
  },
  {
    'id': 2,
    "question": "7 x 3 = _____",
    "options": ["20", "21", "17", "57"],
    "answer_index": 1
  },
  {
    'id': 3,
    "question": "7 x 7 = _____",
    "options": ["77", "49", "14", "94"],
    "answer_index": 1
  },
];
