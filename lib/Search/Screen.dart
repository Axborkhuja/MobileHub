import 'package:flutter/material.dart';
import './Body.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Body(),
    );
  }
}
