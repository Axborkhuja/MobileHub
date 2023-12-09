import 'package:flutter/material.dart';
import 'package:test123/Bag/CartBody.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logo',
          style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
              height: 16 / 20),
        ),
      ),
      body: CartBody(),
    );
  }
}
