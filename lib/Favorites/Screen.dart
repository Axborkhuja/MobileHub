import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/Favorites/notLogined.dart';
import 'package:test123/Home/Header.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';

class FavoriteScreens extends StatelessWidget {
  final List<Map<String, dynamic>>? favorites;
  final List<Map<String, dynamic>>? cartShopping;

  FavoriteScreens({super.key, this.cartShopping, this.favorites});

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: user == null
          ? const notLogined()
          : Body()
    );
  }
}
