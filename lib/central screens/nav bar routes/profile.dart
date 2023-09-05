// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/settings_page.dart';
import 'package:firebase_attempt/database/firebase_functions.dart';
import 'package:firebase_attempt/payment/upgrade_membership_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
    double screenWidth = MediaQuery.of(context).size.width;
    final User user = auth.currentUser!;
    final email = user.email!;

    double heightRatio = 0.075 * logicalHeight;

    Widget buildName(String user) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              user,
              style: TextStyle(
                  fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
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
                Get.to(() => const SettingsPage());
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
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Center(child: buildUpgradeButton()),
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Center(child: StatisticsWidget()),
            SizedBox(
              height: heightRatio,
            ),
            Center(child: LogoutButton(context)),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Logout Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget LogoutButton(BuildContext context) {
    return ButtonWidget(
        text: "Sign Out",
        onClicked: () => _showLogoutConfirmationDialog(context));
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(
        text: "Upgrade Membership Now",
        onClicked: () {
          Get.to(() => const MembershipUpgradePage());
        });
  }

  Widget StatisticsWidget() {
    double screenSize = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your statistics: ",
            style: TextStyle(
              fontSize: screenSize * 0.09,
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
                    "XP: ${double.parse(snapshot.data!).toStringAsFixed(2)}",
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
    double screenSize = MediaQuery.of(context).size.width;
    return TextStyle(fontSize: screenSize * 0.045, fontWeight: FontWeight.bold);
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget(
      {super.key, required this.imagePath, required this.onClicked});

  Widget buildImage(context) {
    double screenSize = MediaQuery.of(context).size.width;

    const image = AssetImage("lib/assets/adastralogo.jpg");
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: screenSize * 0.3,
          height: screenSize * 0.3,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color, context) {
    double screenSize = MediaQuery.of(context).size.width;

    return buildCircle(
      color: Colors.white,
      all: screenSize * 0.0075,
      child: buildCircle(
        color: color,
        all: screenSize * 0.02,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: screenSize * 0.046,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue[900];
    return Center(
      child: Stack(children: [
        buildImage(context),
        Positioned(bottom: 0, right: 4, child: buildEditIcon(color!, context)),
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

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(
              horizontal: screenSize * 0.07, vertical: screenSize * 0.03)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: screenSize * 0.04),
      ),
    );
  }
}
