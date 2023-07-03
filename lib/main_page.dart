import 'package:firebase_attempt/central%20screens/play_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //if logged in, return home page else return login page
            //return const HomePage(); onboarding screen
            return const PlayPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
