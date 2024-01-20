import 'package:flutter/material.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: GetProducts(
        collectionName: 'products',
        buildUI: (List<Map<String, dynamic>> data) {
          return Body(data: data);
        },
      ),
    );
  }
}
