import 'package:flutter/material.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: const Body(),
    );
  }
}
