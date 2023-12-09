import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final TextEditingController controller;

  Body({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            // This is where the chat messages will go
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Type your message here',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Handle sending message
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}