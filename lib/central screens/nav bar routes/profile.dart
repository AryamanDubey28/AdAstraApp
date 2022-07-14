import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.0,
          ),
          Center(
            child: Lottie.network(
                "https://assets1.lottiefiles.com/private_files/lf30_LOw4AL.json"),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
