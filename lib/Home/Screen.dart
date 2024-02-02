import 'package:flutter/material.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';
import './Header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: GetProducts(
        collectionName: 'products',
        buildUI: (List<Map<String, dynamic>> data) {
          return Body(data: data);
        },
      ),
    );
  }
}
