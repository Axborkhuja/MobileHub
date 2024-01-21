import 'package:flutter/material.dart';
import './notLogedBody.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // bool isAuthenticated = authProvider.isAuthenticated;

    return const Scaffold(
      body: notLogedBody(),
    );
  }
}
