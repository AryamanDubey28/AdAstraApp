import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/heartedTopics.dart';
import 'package:firebase_attempt/central%20screens/square_temp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../PageColor.dart';

class ExplorePage extends StatelessWidget {
  //const ExplorePage({Key? key}) : super(key: key);

  static int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pageColor,
        appBar: AppBar(
          title: Text("Browse All Videos!"),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: pageColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => HeartedTopics(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 1));
                  },
                  icon: Icon(Iconsax.heart)),
            )
          ],
        ),
        body: Lottie.network(
            "https://assets10.lottiefiles.com/packages/lf20_ihspk1vg.json")
        // ListView(
        //   children: [
        //     // Center(
        //     //     child: Padding(
        //     //   padding: const EdgeInsets.all(8.0),
        //     //   child: GestureDetector(
        //     //     onTap: () {
        //     //       index = 0;
        //     //       Navigator.popAndPushNamed(context, '/playpage');
        //     //     },
        //     //     child: Text(
        //     //       "VR",
        //     //       style: TextStyle(fontSize: 24.0),
        //     //     ),
        //     //   ),
        //     // )),
        //     // Center(
        //     //     child: Padding(
        //     //   padding: const EdgeInsets.all(8.0),
        //     //   child: GestureDetector(
        //     //     onTap: () {
        //     //       //Navigator.popAndPushNamed(context, '/nvrtiles');
        //     //       index = 1;
        //     //       print("index now 1");
        //     //       //Navigator.pop(context, index);
        //     //       Navigator.popAndPushNamed(context, '/playpage');
        //     //     },
        //     //     child: Text(
        //     //       "NVR",
        //     //       style: TextStyle(fontSize: 24.0),
        //     //     ),
        //     //   ),
        //     // )),
        //     // Center(
        //     //     child: Padding(
        //     //   padding: const EdgeInsets.all(8.0),
        //     //   child: GestureDetector(
        //     //     onTap: () {
        //     //       index = 2;
        //     //       Navigator.popAndPushNamed(context, '/playpage');
        //     //     },
        //     //     child: Text(
        //     //       "Numeracy",
        //     //       style: TextStyle(fontSize: 24.0),
        //     //     ),
        //     //   ),
        //     // )
        //     //),
        //     GestureDetector(
        //         onTap: () {
        //           index = 0;
        //           Navigator.popAndPushNamed(context, '/playpage');
        //         },
        //         child: MySquare(text: "VR ")),

        //     GestureDetector(
        //         onTap: () {
        //           index = 1;
        //           print("index now 1");
        //           //       //Navigator.pop(context, index);
        //           Navigator.popAndPushNamed(context, '/playpage');
        //         },
        //         child: MySquare(text: "NVR ")),

        //     GestureDetector(
        //         onTap: () {
        //           index = 2;
        //           Navigator.popAndPushNamed(context, '/playpage');
        //         },
        //         child: MySquare(text: "Numeracy ")),
        //   ],
        // )
        );
  }
}
