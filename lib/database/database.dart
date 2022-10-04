import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../main.dart';

class SelectionTilesDB {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;
  List heartedTopics = [];

  SelectionTilesDB() {
    final User user = auth.currentUser!;
    final email = user.email!;
    uid = user.uid;
    print(uid);
  }

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    heartedTopics = [];
  }

  void loadData() {
    heartedTopics = _myBox.get("LIKEDTOPICS_${uid}");
  }

  List loadDataList() {
    return heartedTopics;
  }

  void updateDataBase() {
    _myBox.put("LIKEDTOPICS_${uid}", heartedTopics);
  }

  List getHeartedTopics() {
    return heartedTopics;
  }
}
