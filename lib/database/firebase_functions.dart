import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String getUid() {
    return firebaseAuth.currentUser!.uid;
  }

  Future<String> updateMembershipType(String newMembershipType) async {
    try {
      final docUser = firebaseFirestore.collection('users').doc(getUid());
      docUser.update({'Membership Type': newMembershipType});
      return "Your Membership type was successfully updated to $newMembershipType";
    } catch (e) {
      return "There was an error updating your Membership type.\n$e";
    }
  }

  Future<String> updateEmail(String newEmail) async {
    try {
      final docUser = firebaseFirestore.collection('users').doc(getUid());
      docUser.update({'Email': newEmail});
      return "Your email was successfully updated to: $newEmail";
    } catch (e) {
      return "There was an error updating your email address.\n$e";
    }
  }

  Future<String> updateUserXP(double score) async {
    try {
      final docUser = firebaseFirestore.collection('users').doc(getUid());
      String stringScore = await getUserXP();
      double prevScore = double.parse(stringScore);
      double newScore = prevScore += score;
      docUser.update({'XP': newScore});
      return "Results Saved";
    } catch (e) {
      return "There was an error updating your email address.\n$e";
    }
  }

  Future<String> getMembershipType() async {
    try {
      final query = firebaseFirestore.collection('users').doc(getUid());
      final snapshot = await query.get();
      if (snapshot.exists) {
        final map = snapshot.data();
        return map!['Membership Type'];
      } else {
        return "Membership Type does not exist";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getName() async {
    try {
      final query = firebaseFirestore.collection('users').doc(getUid());
      final snapshot = await query.get();
      if (snapshot.exists) {
        final map = snapshot.data();
        String firstName = map!['First Name'];
        String lastName = map['Last Name'];
        return "$firstName $lastName";
      } else {
        return "Name does not exist";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getAge() async {
    try {
      final query = firebaseFirestore.collection('users').doc(getUid());
      final snapshot = await query.get();
      if (snapshot.exists) {
        final map = snapshot.data();
        return map!['Age'];
      } else {
        return "Age does not exist";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getEmail() async {
    try {
      final query = firebaseFirestore.collection('users').doc(getUid());
      final snapshot = await query.get();
      if (snapshot.exists) {
        final map = snapshot.data();
        return map!['Email'];
      } else {
        return "Email does not exist";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getUserXP() async {
    try {
      final query = firebaseFirestore.collection('users').doc(getUid());
      final snapshot = await query.get();
      if (snapshot.exists) {
        final map = snapshot.data();
        return map!['XP'].toString();
      } else {
        return "XP not found";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
