import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  BagPage({Key? key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final List<Map<String, dynamic>> _bagItems = [
    {
      'name': 'Product 1',
      'price': 100.0,
      'quantity': 1,
      'image':
      'https://img.freepik.com/free-photo/high-angle-blue-keyboard-with-lights_23-2149680224.jpg?w=1060&t=st=1702073392~exp=1702073992~hmac=3bdfee1dfead737b805d054252b23e48028e347d17e0bcf0317a437d4e2cad74'
    },
    {
      'name': 'Product 2',
      'price': 200.0,
      'quantity': 5,
      'image':
      'https://img.freepik.com/free-photo/illustrators-tools-arrangement-still-life_23-2150163139.jpg?w=1060&t=st=1702073444~exp=1702074044~hmac=13d2418cd1e6a134c10eca0d2df037472bfb04271a43f05054a6d7fba789c33b'
    },
    {
      'name': 'Product 3',
      'price': 300.0,
      'quantity': 3,
      'image':
      'https://img.freepik.com/free-photo/black-headphones-digital-device_53876-96805.jpg?w=740&t=st=1702073479~exp=1702074079~hmac=76eb72306da4969dd03362902adf248d19a7c4adc1683ae0d328ec75bc777733'
    }
    // we can add as we want
  ];

  double get _totalPrice {
    return _bagItems.fold(
        0.0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _bagItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(_bagItems[index]['image'],
                        width: 50, height: 50),
                    title: Text(_bagItems[index]['name']),
                    subtitle: Text('\$${_bagItems[index]['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              _bagItems[index]['quantity']--;
                              if (_bagItems[index]['quantity'] <= 0) {
                                _bagItems.removeAt(index);
                              }
                            });
                          },
                        ),
                        Text('${_bagItems[index]['quantity']}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _bagItems[index]['quantity']++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text('Total: \$$_totalPrice'),
          ElevatedButton(
            onPressed: () {
              // Navigate to checkout page
            },
            child: Text('Checkout'),
          ),
          TextButton(
            onPressed: () {
              // Navigate to marketplace
            },
            child: Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }
}
