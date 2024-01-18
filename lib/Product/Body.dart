import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  final Map<String, dynamic> data;
  Body(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.network(data['image'], width: 100, height: 100),
        Text(data['name']),
        Text('\$${data['price']}'),
        Text(data['description']),
        Text(data['specifications']),
        ElevatedButton(
          onPressed: () {

          },
          child: Text('Add to Cart'),
        ),
        // Add more widgets for customer reviews, ratings, etc.
      ],
    );
  }
}

