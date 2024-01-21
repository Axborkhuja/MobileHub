import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Map<String, dynamic> data;
  const Body(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Image.network(data['imageUrl'], fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                data['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${data['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['description'],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                data['category'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Change the color as needed
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_outlined,
                      size: 40,
                      color: brightness == Brightness.dark
                          ? Colors.white12
                          : Colors.black12),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
