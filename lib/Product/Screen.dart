import 'package:flutter/material.dart';
import './Body.dart';
class ProductScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  ProductScreen(Map<String, dynamic> this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text("Product"),
      ),
      body: Body(data),
    );
  }
}
