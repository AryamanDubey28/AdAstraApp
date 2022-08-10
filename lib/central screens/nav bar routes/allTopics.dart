import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';

class AllTopics extends StatefulWidget {
  //const AllTopics({Key? key}) : super(key: key);

  late final List allTopics;

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

  // static List allLikedTopics = [];

  // List getAllLikedTopics() {
  //   return allLikedTopics;
  // }

  Widget buildTopicTile(int index, String topic) {
    return Slidable(
      key: ValueKey(topic),
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              //do something
              if (ExplorePage.index == 0) {
                SelectionTiles.likedTopics.add(topic + " - VR");
              } else if (ExplorePage.index == 1) {
                SelectionTiles.likedTopics.add(topic + " - NVR");
              } else if (ExplorePage.index == 2) {
                SelectionTiles.likedTopics.add(topic + " - Numeracy");
              }

              print("added $topic");
            }),
            backgroundColor: Colors.red,
            icon: Iconsax.heart,
          ),
          SlidableAction(
            onPressed: ((context) {
              //do something
            }),
            backgroundColor: Colors.green,
            icon: Icons.move_down,
          ),
          SlidableAction(
              onPressed: ((context) {
                //do something
              }),
              backgroundColor: Color.fromARGB(255, 244, 165, 6),
              icon: Icons.move_up),
        ],
      ),
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              //do something
            }),
            backgroundColor: Colors.deepPurple,
            icon: Icons.rocket_launch,
          ),
        ],
      ),
      child: ListTile(
        //key: ValueKey(topic),
        leading: Icon(Icons.square),
        title: Text(
          topic,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

    // return ListTile(
    //   key: ValueKey(topic),
    //   leading: Icon(Icons.square),
    //   title: Text(
    //     topic,
    //     textAlign: TextAlign.center,
    //     style: TextStyle(fontSize: 20),
    //   ),
    // );
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
          backgroundColor: Colors.blue[200],
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
