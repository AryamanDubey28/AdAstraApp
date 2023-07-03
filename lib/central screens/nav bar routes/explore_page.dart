import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/heartedTopics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class ExplorePage extends StatelessWidget {
  static int index = 0;

  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Browse All Videos!"),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => const HeartedTopics(),
                        transition: Transition.topLevel,
                        duration: const Duration(seconds: 1));
                  },
                  icon: const Icon(Iconsax.heart)),
            )
          ],
        ),
        body: Lottie.network(
            "https://assets10.lottiefiles.com/packages/lf20_ihspk1vg.json"));
  }
}
