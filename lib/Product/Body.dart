import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Map<String, dynamic> data;
  Body(this.data, {super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  void showRemoveConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notification"),
          content: const Text(
              "You are not Logined please first login then you can add this product to your favourite"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  Future<void> userAddFavorite(Map<String, dynamic> newFavorite) async {
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user?.uid)
          .get();
      Map<String, dynamic> userDataMap = userData.data() ?? {};
      List<Map<String, dynamic>> currentFavorites =
          List<Map<String, dynamic>>.from(userDataMap['favorites'] ?? []);
      currentFavorites.add(newFavorite);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set({
        'favorites': currentFavorites,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Image.network(data['imageUrl'], fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                data['name'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Price:  \$${data['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Description:  ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                data['description'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    "Categories:  ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    data['category'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  shape: const CircleBorder(),
                ),
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.favorite,
                      size: 40,
                      color: brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white),
                  onPressed: () {
                    if (user != null) {
                      userAddFavorite(data);
                    } else {
                      showRemoveConfirmation(context);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
