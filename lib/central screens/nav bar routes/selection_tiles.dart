import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_page.dart';
import '../game screens/matching tiles/matching_tiles_g1.dart';

class SelectionTiles extends StatelessWidget {
  static int index = 0;
  static String topic = "";
  SelectionTiles(int screenIndex) {
    index = screenIndex;
  }

  final List vr_section = [
    "Matching Tiles",
    "Practice Quiz",
    "Letter Codes",
    "Word Codes",
    "Number Sequences"
  ];
  //final List routes = [HiddenDrawer(), null, null, null];
  //final List routes = [MatchingTilesGame1(), null, null, null];
  final List vr_routes = [
    InformationSheet(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
  ];

  final List nvr_section = ["Odd One Out", "Practice Quiz", "Make a pair"];

  final List nvr_routes = [null, QuizScreen(), null, null];

  final List numeracy_section = [
    "Fractions",
    "Quick Maths",
    "Algebra",
    "Shapes"
  ];
  final List numeracy_routes = [null, QuizScreen(), null, null];

  Widget VRScreen(BuildContext context) {
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
        itemCount: vr_section.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = vr_section[index];
                      print(topic);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => vr_routes[index]));
                    },
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
                                vr_section[index],
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

  Widget NVRScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "NVR Activities",
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
        itemCount: nvr_section.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = nvr_section[index];
                      print(topic);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => nvr_routes[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/NVR.jpg'),
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
                                nvr_section[index],
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

  Widget NumeracyScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Numeracy Activities",
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
        itemCount: numeracy_section.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = numeracy_section[index];
                      print(topic);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => numeracy_routes[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/numeracy2.jpg'),
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
                                numeracy_section[index],
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

  // void showScreen(BuildContext context) async {
  //   index = await Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ExplorePage()));
  // }

  @override
  Widget build(BuildContext context) {
    final List activityScreen = [
      VRScreen(context),
      NVRScreen(context),
      NumeracyScreen(context)
    ];
    //print("activity screen index $index");
    return activityScreen[ExplorePage.index];

    // return Scaffold(
    //   backgroundColor: Colors.blue[200],
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Text(
    //       "VR Activities",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 28,
    //       ),
    //     ),
    //     backgroundColor: Colors.blue[200],
    //     elevation: 0.0,
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: GestureDetector(
    //             onTap: () {
    //               FirebaseAuth.instance.signOut();
    //               Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (BuildContext context) => MainPage(),
    //                 ),
    //                 (route) => false,
    //               );
    //             },
    //             child: Icon(Icons.logout)),
    //       ),
    //     ],
    //   ),
    //   body: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: section.length,
    //     itemBuilder: ((context, index) {
    //       return Column(
    //         children: [
    //           Expanded(
    //             child: Padding(
    //               padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
    //               child: GestureDetector(
    //                 onTap: () => Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => routes[index])),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: Colors.grey[300],
    //                       border: Border.all(color: Colors.white10),
    //                       borderRadius: BorderRadius.circular(30),
    //                       image: DecorationImage(
    //                         image: AssetImage('lib/assets/VR3.jpg'),
    //                         fit: BoxFit.fill,
    //                       ),
    //                     ),
    //                     //height: 100,
    //                     width: 300,
    //                     child: Column(
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.all(20.0),
    //                           child: Text(
    //                             section[index],
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //                               fontSize: 24.0,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 30,
    //                         ),

    //                         //Image.asset('lib/assets/adastralogo.jpg'),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           // ElevatedButton(
    //           //     onPressed: () => Navigator.push(
    //           //         context,
    //           //         MaterialPageRoute(
    //           //             builder: (context) => HiddenDrawer())),
    //           //     child: Text("")),
    //         ],
    //       );
    //     }),

    //     // body: Column(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   children: [
    //     //     Center(
    //     //         child: Text(
    //     //       "Currently being made...",
    //     //       style: TextStyle(
    //     //         fontSize: 26.0,
    //     //       ),
    //     //     )),
    //     //     Center(
    //     //       child: Lottie.network(
    //     //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
    //     //     ),
    //     //     SizedBox(
    //     //       height: 150,
    //     //     ),
    //     //     ElevatedButton(
    //     //         onPressed: () {
    //     //           Navigator.push(context,
    //     //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
    //     //         },
    //     //         child: Text("Go To Content!"))
    //     //   ],
    //     // ),
    //   ),
    // );
  }
}
