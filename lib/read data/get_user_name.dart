import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  late String documentID;
  late String desiredText;

  GetUserName({required this.documentID, required String this.desiredText});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          if (desiredText == "Full Details") {
            return Text("${data['First Name']}" +
                " ${data['Last Name']}, ${data['Age']}");
          } else if (desiredText == "Fullname") {
            return Text("${data['First Name']}" + " ${data['Last Name']}");
          } else if (desiredText == 'Age') {
            return Text("${data[desiredText]}");
          } else {
            return Text(data[desiredText]);
          }

          //error when returns an integer
        }
        return Text('Loading...');
      }),
    );
  }
}
