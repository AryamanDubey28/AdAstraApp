import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_g1.dart';
import 'package:firebase_attempt/central%20screens/hidden_drawer.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/discover.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/profile.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/selection_tiles.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../login_page.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  static int tilesScreenIndex = 0;

  Future<bool> _onWillPop() async {
    return false;
  }

  Color? mygrey = Colors.grey[500];

  final screens = [
    SelectionTiles(ExplorePage.index),
    //SelectionTiles(),
    ExplorePage(),
    DiscoverPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;
  int oldIndex = 0;

  Widget showScreen() {
    if (currentIndex != 1) {
      return screens[currentIndex];
    } else {
      return screens[oldIndex];
    }
  }

  Widget currentScreen() {
    setState(() {});
    return screens[currentIndex];
  }

  // Future addUserDetails(
  //     String firstname, String surname, int age, String email) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'First Name': firstname,
  //     'Last Name': surname,
  //     'Age': age,
  //     'Email': email,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(ExplorePage.index);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: mygrey!,
            gap: 7,
            onTabChange: (value) {
              setState(() {
                oldIndex = currentIndex;
                currentIndex = value;
              });
              // if (value == 1) {
              //   showModalBottomSheet(
              //       context: context, builder: ((context) => ExplorePage()));
              // }

              // if (value == 0) {
              // } else if (value == 1) {
              // } else if (value == 2) {
              //   Navigator.pushNamed(context, '/settings');
              // } else if (value == 3) {}
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Iconsax.home1,
                text: "Home",
              ),
              GButton(
                icon: Icons.explore,
                text: "Explore",
              ),
              GButton(
                icon: Icons.rocket_launch,
                text: "Discover",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
          ),
        ),

        //title: Text("Choose your section!"),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: GestureDetector(
        //         onTap: () {
        //           FirebaseAuth.instance.signOut();
        //           Navigator.pushAndRemoveUntil(
        //             context,
        //             MaterialPageRoute(
        //               builder: (BuildContext context) => MainPage(),
        //             ),
        //             (route) => false,
        //           );
        //         },
        //         child: Icon(Icons.logout)),
        //   ),
        // ],

        body: screens[currentIndex],
        //showScreen()

        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: section.length,
        //   itemBuilder: ((context, index) {
        //     return Column(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.all(16.0),
        //             child: GestureDetector(
        //               onTap: () => Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => routes[index])),
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 15.0, vertical: 15.0),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                       color: Colors.grey[300],
        //                       border: Border.all(color: Colors.white10),
        //                       borderRadius: BorderRadius.circular(30)),
        //                   height: 100,
        //                   width: 375,
        //                   child: Center(
        //                       child: Text(
        //                     section[index],
        //                     style: TextStyle(
        //                         fontSize: 24.0,
        //                         fontWeight: FontWeight.bold,
        //                         color: Colors.black),
        //                   )),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //         // ElevatedButton(
        //         //     onPressed: () => Navigator.push(
        //         //         context,
        //         //         MaterialPageRoute(
        //         //             builder: (context) => HiddenDrawer())),
        //         //     child: Text("")),
        //       ],
        //     );
        //   }),

        //   // body: Column(
        //   //   mainAxisAlignment: MainAxisAlignment.center,
        //   //   children: [
        //   //     Center(
        //   //         child: Text(
        //   //       "Currently being made...",
        //   //       style: TextStyle(
        //   //         fontSize: 26.0,
        //   //       ),
        //   //     )),
        //   //     Center(
        //   //       child: Lottie.network(
        //   //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
        //   //     ),
        //   //     SizedBox(
        //   //       height: 150,
        //   //     ),
        //   //     ElevatedButton(
        //   //         onPressed: () {
        //   //           Navigator.push(context,
        //   //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
        //   //         },
        //   //         child: Text("Go To Content!"))
        //   //   ],
        //   // ),
        // )
      ),
    );
  }
}
