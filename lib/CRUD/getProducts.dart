import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetProducts extends StatelessWidget {
  final String collectionName;
  final Function(List<Map<String, dynamic>>) buildUI;

  const GetProducts({super.key, required this.collectionName, required this.buildUI});

  Future<List<Map<String, dynamic>>> fetchDataFromFirebase() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          (await FirebaseFirestore.instance.collection(collectionName).get());
      print(querySnapshot);
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (error) {
      print('Error fetching data from Firebase: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return FutureBuilder(
      future: fetchDataFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  brightness == Brightness.dark
                      ? Colors.white38
                      : Colors.black45),
              strokeWidth: 5.0,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> data =
              snapshot.data as List<Map<String, dynamic>>;
          return buildUI(data);
        }
      },
    );
  }
}
