import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/components/notResult.dart';
import '../components/HorizontalCard.dart';

class Body extends StatefulWidget {

  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<Map<String, dynamic>> data=[];
  Future<Map<String, dynamic>?> getUserDocument() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          data=userDoc['favorites'];
        } else {
          print("User document not found");
          data=[];
        }
      } catch (error) {
        print("Error retrieving user document: $error");
      }
    } else {
      print("User not authenticated");
    }
  }


  Future<void> userAddCartShopping(Map<String, dynamic> newCartItem) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      Map<String, dynamic> userDataMap = userData.data() ?? {};
      List<Map<String, dynamic>> currentFavorite =
      List<Map<String, dynamic>>.from(userDataMap['favorites'] ?? []);
      currentFavorite.add(newCartItem);

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'bucket': currentFavorite,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return data!.isNotEmpty?
    Column(
      children: [
        ListView.builder(
          itemCount:data?.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                FavouriteCard(data: data![index]),
                Stack(
                  children: [
                    Positioned(
                      bottom: 30,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // userAddCartShopping(widget.cartShopping![index]);
                            },
                            child: Container(
                              height: 70,
                              color: brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              child: Center(
                                child: Text(
                                  "Add all to Cart",
                                  style: TextStyle(
                                      color: brightness == Brightness.dark
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),

      ],
    ):const notResults();
  }
}
