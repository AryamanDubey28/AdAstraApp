import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_page.dart';
import '../game screens/matching tiles/matching_tiles_g1.dart';

class SelectionTiles extends StatelessWidget {
  final List section = [
    "Matching Tiles",
    "Fill in the missing letter",
    "To-do2",
    "To-do3"
  ];
  //final List routes = [HiddenDrawer(), null, null, null];
  final List routes = [MatchingTilesGame1(), null, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Choose your section!"),
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MainPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Icon(Icons.logout)),
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: section.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => routes[index])),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.white10),
                            borderRadius: BorderRadius.circular(30)),
                        height: 100,
                        width: 375,
                        child: Center(
                            child: Text(
                          section[index],
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HiddenDrawer())),
              //     child: Text("")),
            ],
          );
        }),

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //         child: Text(
        //       "Currently being made...",
        //       style: TextStyle(
        //         fontSize: 26.0,
        //       ),
        //     )),
        //     Center(
        //       child: Lottie.network(
        //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
        //     ),
        //     SizedBox(
        //       height: 150,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
        //         },
        //         child: Text("Go To Content!"))
        //   ],
        // ),
      ),
    );
  }
}
