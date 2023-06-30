import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/database/firebase_functions.dart';
import 'package:firebase_attempt/payment/upgrade_membership_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  Map<String, dynamic> data = {};

  FutureBuilder<DocumentSnapshot> getUsers(String documentID) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['First Name']}"
                " ${data['Last Name']}, ${data['Age']}");
          }
          return const Text('Loading...');
        }));
  }

  Future<void> _refresh() {
    setState(() {});
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser!;
    final email = user.email!;

    Widget buildName(String user) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              user,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.deepPurple,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: "lib/assets/adastralogo.jpg",
                onClicked: () async {}),
            buildName(email),
            const SizedBox(
              height: 20,
            ),
            Center(child: buildUpgradeButton()),
            const SizedBox(
              height: 20,
            ),
            Center(child: StatisticsWidget()),
            const SizedBox(
              height: 70,
            ),
            Center(child: LogoutButton(context)),
          ],
        ),
      ),
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
              builder: (BuildContext context) => const MainPage(),
            ),
            (route) => false,
          );
        });
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(
        text: "Upgrade Membership Now",
        onClicked: () {
          Get.to(() => const MembershipUpgradePage());
        });
  }

  Widget StatisticsWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Your statistics: ",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: firebaseFunctions.getName(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Name: ${snapshot.data}",
                    style: getTextStyle(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: firebaseFunctions.getMembershipType(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Membership Type: ${snapshot.data}",
                    style: getTextStyle(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: firebaseFunctions.getUserXP(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "XP: ${snapshot.data}",
                    style: getTextStyle(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextStyle getTextStyle() {
    return const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  ProfileWidget({required this.imagePath, required this.onClicked});

  Widget buildImage() {
    const image = AssetImage("lib/assets/adastralogo.jpg");
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
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        color: color,
        padding: EdgeInsets.all(all),
        child: child,
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
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
      onPressed: onClicked,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
