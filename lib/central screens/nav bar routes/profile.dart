import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../main_page.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void buildUsers() {}
  List<String> ids = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              ids.add(element.reference.id);
            }));
  }

  Map<String, dynamic> data = {};
  // Stream<List<User>> readUsers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((e) => doc.data()).toList());

  //FutureBuilder<DocumentSnapshot>

  FutureBuilder<DocumentSnapshot> getUsers(String documentID) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['First Name']}" +
                " ${data['Last Name']}, ${data['Age']}");
          }
          return Text('Loading...');
        }));
  }

  // String getCurrentUserName() {
  //   for (int i = 0; i < ids.length; i++) {

  //     if() {

  //     }

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    buildUsers();
    final User user = auth.currentUser!;
    final email = user.email!;
    final uid = user.uid;

    Widget buildName(String user) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              user,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        // title: Text(
        //   "Profile",
        //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imagePath: "lib/assets/adastralogo.jpg", onClicked: () async {}),
          buildName(email),
          SizedBox(
            height: 20,
          ),
          Center(child: buildUpgradeButton()),
          SizedBox(
            height: 20,
          ),
          Center(child: StatisticsWidget()),
          SizedBox(
            height: 70,
          ),
          Center(child: LogoutButton(context)),
        ],
      ),
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height: 2.0,
      //     ),
      //     //getUsers(uid),
      //     Text(email),
      //     Center(
      //       child: Lottie.network(
      //           "https://assets1.lottiefiles.com/private_files/lf30_LOw4AL.json"),
      //     ),
      //     SizedBox(
      //       height: 20.0,
      //     ),
      //   ],
      // ),
    );
  }

  Widget LogoutButton(BuildContext context) {
    return ButtonWidget(
        text: "Sign Out",
        onClicked: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
            ),
            (route) => false,
          );
        });
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(text: "Upgrade Membership Now", onClicked: () {});
  }

  Widget StatisticsWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your statistics: ",
            style: TextStyle(
              fontSize: 35,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Since: 28/07/22", style: getTextStyle()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("XP: 10,000", style: getTextStyle()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Games Played: 42", style: getTextStyle()),
          )
        ],
      ),
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
        fontSize: 18.0, color: Colors.grey[700], fontWeight: FontWeight.bold);
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  ProfileWidget({required this.imagePath, required this.onClicked});

  Widget buildImage() {
    final image = AssetImage("lib/assets/adastralogo.jpg");
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final color = Colors.blue[900];
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(bottom: 0, right: 4, child: buildEditIcon(color!)),
      ]),
    );
  }

  Widget buildCircle(
      {required Color color, required double all, required Widget child}) {
    return ClipOval(
      child: Container(
        child: child,
        color: color,
        padding: EdgeInsets.all(all),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  ButtonWidget({
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
      child: Text(text),
      onPressed: onClicked,
    );
  }
}
