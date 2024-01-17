import 'package:flutter/material.dart';


class ProductBody extends StatefulWidget {
  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  final Map<String, dynamic> _product = {
    'name': 'Product 1',
    'price': 100.0,
    'image': 'https://your-image-url.com/product1.png',
    'description': 'This is a great product.',
    'specifications': 'Technical specifications go here.',
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.network(_product['image'], width: 100, height: 100),
        Text(_product['name']),
        Text('\$${_product['price']}'),
        Text(_product['description']),
        Text(_product['specifications']),
        ElevatedButton(
          onPressed: () {
            // Add to cart
          },
          child: Text('Add to Cart'),
        ),
        // Add more widgets for customer reviews, ratings, etc.
      ],
    );
  }
}