import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class GetProducts extends StatelessWidget {
  final String collectionName;
  final Function(List<Map<String, dynamic>>) buildUI;

  GetProducts({required this.collectionName, required this.buildUI});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return buildUI(snapshot.data ?? []);
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
      await FirebaseFirestore.instance.collection(collectionName).doc(user.uid).get();

      Map<String, dynamic> userMap = userData.data() ?? {};

      return [userMap];
    } else {
      return [];
    }
  }
}