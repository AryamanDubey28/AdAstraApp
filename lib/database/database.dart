import 'package:hive/hive.dart';

class SelectionTilesDB {
  List heartedTopics = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    heartedTopics = [];
  }

  void loadData() {
    heartedTopics = _myBox.get("LIKEDTOPICS");
  }

  List loadDataList() {
    return heartedTopics;
  }

  void updateDataBase() {
    _myBox.put("LIKEDTOPICS", heartedTopics);
  }

  List getHeartedTopics() {
    return heartedTopics;
  }
}
