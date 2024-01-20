import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Map<String, dynamic> data;

  Body(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Image.network(data['imageUrl'], fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(
                data['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$${data['price']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red, // Change the color as needed
                ),
              ),
              SizedBox(height: 8),
              Text(
                data['description'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                data['category'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Change the color as needed
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),

                ),
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_outlined,
                      size: 40, color: Colors.black),
                  onPressed: () {

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
