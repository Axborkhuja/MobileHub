import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/components/notResult.dart';
import '../components/HorizontalCard.dart';

class Body extends StatefulWidget {
  final List<Map<String, dynamic>>? cartShopping;

  const Body({super.key, this.cartShopping});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Future<void> userAddCartShopping(Map<String, dynamic> newCartItem) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      Map<String, dynamic> userDataMap = userData.data() ?? {};
      List<Map<String, dynamic>> currentCartShopping =
      List<Map<String, dynamic>>.from(userDataMap['bucket'] ?? []);

      currentCartShopping.add(newCartItem);

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'bucket': currentCartShopping,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.cartShopping != null
        ? ListView.builder(
            itemCount: widget.cartShopping?.length,
            itemBuilder: (context, index) {
              return FavouriteCard(data: widget.cartShopping![index]);
            },
          )
        : const notResults();
  }
}
