import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_page.dart';
import '../game screens/matching tiles/matching_tiles_g1.dart';

class SelectionTiles extends StatelessWidget {
  final List section = [
    "Matching Tiles",
    "Fill in the missing letter",
    "To-do3",
    "To-do4"
  ];
  //final List routes = [HiddenDrawer(), null, null, null];
  final List routes = [MatchingTilesGame1(), null, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "VR Activities",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
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
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => routes[index])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/VR3.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        //height: 100,
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                section[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            //Image.asset('lib/assets/adastralogo.jpg'),
                          ],
                        ),
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
