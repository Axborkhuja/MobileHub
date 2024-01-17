import 'package:flutter/material.dart';

class Body extends StatelessWidget{

  Widget build(BuildContext context){
    return
      Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.mail),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Email/Phone number',
          ),
        ),
      ],
    );
  }
}