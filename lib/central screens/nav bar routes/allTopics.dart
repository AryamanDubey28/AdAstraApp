import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:like_button/like_button.dart';

import '../../alert dialog/custom_dialog.dart';
import '../../main.dart';
import '../PageColor.dart';
import '../play_page.dart';

class AllTopics extends StatefulWidget {
  //const AllTopics({Key? key}) : super(key: key);

  late final List allTopics;

  @override
  State<AllTopics> createState() => _AllTopicsState();
}

class _AllTopicsState extends State<AllTopics> {
  List allTopics = [];
  final _myBox = Hive.box('mybox');
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;
  final Color? backgroundColor = getPageColor();

  @override
  void initState() {
    super.initState();
    final User user = auth.currentUser!;
    final email = user.email!;
    uid = user.uid;
    print(uid);
  }

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

  Icon getLikeButton() {
    return const Icon(Icons.abc);
  }

  void showHeartedDialogue() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return CustomAlertDialog(
            title: "Added to Liked",
            //backgroundColor: backgroundColor!,
          );
        });
  }

  void showDownDialogue() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            Navigator.of(context).pop(true);
          });
          return CustomAlertDialog(
            title: "Moved to Bottom",
          );
        });
  }

  void showUpDialogue() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            Navigator.of(context).pop(true);
          });
          return CustomAlertDialog(
            title: "Moved to Top",
          );
        });
  }

  Widget buildTopicTile(int index, String topic) {
    return Slidable(
      key: ValueKey(topic),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              //do something
              if (ExplorePage.index == 0) {
                SelectionTiles.likedTopics.add("$topic - VR");
              } else if (ExplorePage.index == 1) {
                SelectionTiles.likedTopics.add("$topic - NVR");
              } else if (ExplorePage.index == 2) {
                SelectionTiles.likedTopics.add("$topic - Numeracy");
              }

              showHeartedDialogue();

              print("added $topic");
              _myBox.put("LIKEDTOPICS_$uid", SelectionTiles.likedTopics);
            }),
            backgroundColor: Colors.red,
            icon: Iconsax.heart,
          ),
          SlidableAction(
            onPressed: ((context) {
              //do something
              setState(() {
                allTopics.remove(topic);
                allTopics.add(topic);
              });

              showDownDialogue();
            }),
            backgroundColor: Colors.green,
            icon: Icons.move_down,
          ),
          SlidableAction(
              onPressed: ((context) {
                //do something
                setState(() {
                  allTopics.remove(topic);
                  allTopics.insert(0, topic);
                });
                showUpDialogue();
              }),
              backgroundColor: Color.fromARGB(255, 244, 165, 6),
              icon: Icons.move_up),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              //do something
              SelectionTiles.topic = topic;
              Get.to(() => const QuizScreen(),
                  transition: Transition.topLevel,
                  duration: const Duration(seconds: 1));
            }),
            backgroundColor: Colors.deepPurple,
            icon: Icons.rocket_launch,
          ),
        ],
      ),
      child: ListTile(
        trailing: const Icon(
          Icons.menu,
          //color: Colors.white,
        ),
        title: Text(
          topic,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20, //color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("disposed");
    if (ExplorePage.index == 0) {
      SelectionTiles.vr_section = allTopics;
    } else if (ExplorePage.index == 1) {
      SelectionTiles.nvr_section = allTopics;
    } else if (ExplorePage.index == 2) {
      SelectionTiles.numeracy_section = allTopics;
    }
  }

  String getTopic() {
    if (ExplorePage.index == 0) {
      return "VR";
    } else if (ExplorePage.index == 1) {
      return "NVR";
    } else {
      return "Numeracy";
    }
  }

  @override
  Widget build(BuildContext context) {
    String topicString = getTopic();
    allTopics = buildTopicsList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All $topicString Topics",
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    allTopics.shuffle();
                  });
                },
                child: const Icon(Icons.shuffle)),
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
    );
  }
}
