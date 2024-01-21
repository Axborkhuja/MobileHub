import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../CRUD/getProducts.dart';
import './Body.dart';
import './Header.dart';

class HomeScreen extends StatelessWidget {

  Future<void> addDataToFirebase() async {
    final CollectionReference<Map<String, dynamic>> products =
    FirebaseFirestore.instance.collection('products');

    final List<Map<String, dynamic>> dataToAdd = [
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 399.99,
        "description":
        "High-performance graphics card for gaming and content creation.",
        "category": "Hardware"
      },
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 449.99,
        "description":
        "Advanced graphics card with cutting-edge features and performance.",
        "category": "Hardware"
      },
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 499.99,
        "description":
        "Top-of-the-line graphics card for enthusiasts and professionals.",
        "category": "Hardware"
      },
      {
        "title": "Cooling System",
        "imageUrl":
        "https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp",
        "price": 89.99,
        "description":
        "Efficient liquid cooling system to maintain optimal temperatures for your PC components.",
        "category": "Hardware"
      },
      {
        "title": "Whole PC",
        "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
        "price": 1499.99,
        "description":
        "Complete gaming PC package with high-end components for an immersive experience.",
        "category": "Hardware"
      },
      {
        "title": "PC is my world",
        "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
        "price": 999.99,
        "description":
        "Customizable PC with powerful hardware, perfect for gaming and professional use.",
        "category": "Hardware"
      },
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 399.99,
        "description":
        "High-performance graphics card for gaming and content creation.",
        "category": "Hardware"
      },
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 449.99,
        "description":
        "Advanced graphics card with cutting-edge features and performance.",
        "category": "Hardware"
      },
      {
        "title": "Graphic card",
        "imageUrl":
        "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
        "price": 499.99,
        "description":
        "Top-of-the-line graphics card for enthusiasts and professionals.",
        "category": "Hardware"
      },
      {
        "title": "Cooling System",
        "imageUrl":
        "https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp",
        "price": 89.99,
        "description":
        "Efficient liquid cooling system to maintain optimal temperatures for your PC components.",
        "category": "Hardware"
      },
      {
        "title": "Whole PC",
        "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
        "price": 1499.99,
        "description":
        "Complete gaming PC package with high-end components for an immersive experience.",
        "category": "Hardware"
      },
      {
        "title": "PC is my world",
        "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
        "price": 999.99,
        "description":
        "Customizable PC with powerful hardware, perfect for gaming and professional use.",
        "category": "Hardware"
      }
    ];

    for (final Map<String, dynamic> entry in dataToAdd) {
      await products.add(entry);
    }

    print('Data added to Firestore successfully!');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: GetProducts(
        collectionName: 'products',
        buildUI: (List<Map<String, dynamic>> data) {
          return Body(data: data);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addDataToFirebase,
        tooltip: 'Add Data to Firestore',
        child: const Icon(Icons.add),
      ),

    );
  }
}
