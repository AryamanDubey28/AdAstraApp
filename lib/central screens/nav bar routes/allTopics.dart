import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllTopics extends StatefulWidget {
  const AllTopics({Key? key}) : super(key: key);

  @override
  State<AllTopics> createState() => _AllTopicsState();
}

class _AllTopicsState extends State<AllTopics> {
  List allTopics = [];

  String getState() {
    if (ExplorePage.index == 0) {
      return "VR";
    } else if (ExplorePage.index == 1) {
      return "NVR";
    } else {
      return "Numeracy";
    }
  }

  List buildTopicsList() {
    if (ExplorePage.index == 0) {
      return SelectionTiles.vr_section;
    } else if (ExplorePage.index == 1) {
      return SelectionTiles.nvr_section;
    } else {
      return SelectionTiles.numeracy_section;
    }
  }

  Widget buildTopicTile(int index, String topic) {
    return ListTile(
      key: ValueKey(topic),
      leading: Icon(Icons.square),
      title: Text(
        topic,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    if (ExplorePage.index == 0) {
      SelectionTiles.vr_section = allTopics;
      print("Disposeddddd");
    } else if (ExplorePage.index == 1) {
      SelectionTiles.nvr_section = allTopics;
    } else if (ExplorePage.index == 2) {
      SelectionTiles.numeracy_section = allTopics;
    }

    //Navigator.popAndPushNamed(context, '/playpage');
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    allTopics = buildTopicsList();
    String state = getState();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Reorder Topics",
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/playpage');
                  },
                  child: Icon(Iconsax.back_square)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      allTopics.shuffle();
                    });
                  },
                  child: Icon(Icons.shuffle)),
            ),
          ],
        ),
        body: ReorderableListView.builder(
            itemCount: allTopics.length,
            onReorder: (oldIndex, newIndex) => setState(() {
                  final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                  final topic = allTopics.removeAt(oldIndex);
                  allTopics.insert(index, topic);
                }),
            itemBuilder: (context, index) {
              String topic = allTopics[index];
              return buildTopicTile(index, topic);
            }),
      ),
    );
  }
}
