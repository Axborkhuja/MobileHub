import 'package:flutter/material.dart';
import 'package:test123/components/BottomBar.dart';

class BucketScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
      ),
      body: Center(

      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}