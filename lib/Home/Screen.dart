import 'package:flutter/material.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';
import './Header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: GetProducts(
        collectionName: 'products',
        buildUI: (List<Map<String, dynamic>> data) {
          return Body(data: data);
        },
      ),
    );
  }
}
