import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/Home/Header.dart';
import './notLogedBody.dart';
import './Body.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: const Header(),
      body: user != null ? const Body() : const notLogedBody(),
    );
  }
}
