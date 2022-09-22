import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:like_button/like_button.dart';

import '../../alert dialog/custom_dialog.dart';
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

  Icon getLikeButton() {
    return Icon(Icons.abc);
  }

  void showHeartedDialogue() {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       Future.delayed(Duration(seconds: 1), () {
    //         Navigator.of(context).pop(true);
    //       });
    //       return AlertDialog(
    //         backgroundColor: Colors.grey[200],
    //         title: Center(child: Text("Added to Liked")),
    //       );
    //     });
    //_openCustomDialog("Added to Liked");
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          // return AlertDialog(
          //   backgroundColor: Colors.grey[200],
          //   title: Center(child: Text("Added to Liked")),
          // );
          return CustomAlertDialog(title: "Added to Liked");
        });
  }

  void showDownDialogue() {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       Future.delayed(Duration(seconds: 1), () {
    //         Navigator.of(context).pop(true);
    //       });
    //       return AlertDialog(
    //         backgroundColor: Colors.grey[200],
    //         title: Center(child: Text("Moved to Bottom")),
    //       );
    //     });
    //_openCustomDialog("Moved to Bottom");

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).pop(true);
          });
          // return AlertDialog(
          //   backgroundColor: Colors.grey[200],
          //   title: Center(child: Text("Added to Liked")),
          // );
          return CustomAlertDialog(title: "Moved to Bottom");
        });
  }

  void showUpDialogue() {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       Future.delayed(Duration(seconds: 1), () {
    //         Navigator.of(context).pop(true);
    //       });
    //       return AlertDialog(
    //         backgroundColor: Colors.grey[200],
    //         title: Center(child: Text("Moved to Top")),
    //       );
    //     });
    //_openCustomDialog("Moved to Top");
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).pop(true);
          });
          // return AlertDialog(
          //   backgroundColor: Colors.grey[200],
          //   title: Center(child: Text("Added to Liked")),
          // );
          return CustomAlertDialog(title: "Moved to Top");
        });
  }

  void _openCustomDialog(String text) {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context).pop(true);
    });
    showGeneralDialog(
        //barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Colors.white.withOpacity(0.75),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Center(child: Text(text)),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Text('PAGE BUILDER');
        });
  }

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

              showHeartedDialogue();

              print("added $topic");
              _myBox.put("LIKEDTOPICS", SelectionTiles.likedTopics);
            }),
            backgroundColor: Colors.red,
            icon: Iconsax.heart,
            //icon: LikeButton()
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
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              //do something
              SelectionTiles.topic = topic;
              Get.to(() => QuizScreen(),
                  transition: Transition.topLevel,
                  duration: Duration(seconds: 1));
            }),
            backgroundColor: Colors.deepPurple,
            icon: Icons.rocket_launch,
          ),
        ],
      ),
      child: ListTile(
        //key: ValueKey(topic),
        trailing: Icon(Icons.menu),
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
      print("Disposed");
    } else if (ExplorePage.index == 2) {
      SelectionTiles.numeracy_section = allTopics;
      print("Disposed");
    }

    //Navigator.popAndPushNamed(context, '/playpage');
  }

  Future<bool> _onWillPop() async {
    return false;
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
    String state = getState();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[200],
          centerTitle: true,
          title: Text(
            "All $topicString Topics",
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                  onTap: () {
                    //Navigator.popAndPushNamed(context, '/playpage');
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            PlayPage(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                    //Get.back();
                  },
                  child: Icon(Iconsax.back_square)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
