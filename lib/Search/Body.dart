import 'package:flutter/material.dart';
import 'package:test123/components/CardSection.dart';
import '../components/Category.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> data = [
    {
      "id": 1,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 399.99,
      "description":
          "High-performance graphics card for gaming and content creation.",
      "category": "Hardware"
    },
    {
      "id": 2,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 449.99,
      "description":
          "Advanced graphics card with cutting-edge features and performance.",
      "category": "Hardware"
    },
    {
      "id": 3,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 499.99,
      "description":
          "Top-of-the-line graphics card for enthusiasts and professionals.",
      "category": "Hardware"
    },
    {
      "id": 4,
      "title": "Cooling System",
      "imageUrl":
          "https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp",
      "price": 89.99,
      "description":
          "Efficient liquid cooling system to maintain optimal temperatures for your PC components.",
      "category": "Hardware"
    },
    {
      "id": 5,
      "title": "Whole PC",
      "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
      "price": 1499.99,
      "description":
          "Complete gaming PC package with high-end components for an immersive experience.",
      "category": "Hardware"
    },
    {
      "id": 6,
      "title": "PC is my world",
      "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
      "price": 999.99,
      "description":
          "Customizable PC with powerful hardware, perfect for gaming and professional use.",
      "category": "Hardware"
    },
    {
      "id": 7,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 399.99,
      "description":
          "High-performance graphics card for gaming and content creation.",
      "category": "Hardware"
    },
    {
      "id": 8,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 449.99,
      "description":
          "Advanced graphics card with cutting-edge features and performance.",
      "category": "Hardware"
    },
    {
      "id": 9,
      "title": "Graphic card",
      "imageUrl":
          "https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720",
      "price": 499.99,
      "description":
          "Top-of-the-line graphics card for enthusiasts and professionals.",
      "category": "Hardware"
    },
    {
      "id": 10,
      "title": "Cooling System",
      "imageUrl":
          "https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp",
      "price": 89.99,
      "description":
          "Efficient liquid cooling system to maintain optimal temperatures for your PC components.",
      "category": "Hardware"
    },
    {
      "id": 11,
      "title": "Whole PC",
      "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
      "price": 1499.99,
      "description":
          "Complete gaming PC package with high-end components for an immersive experience.",
      "category": "Hardware"
    },
    {
      "id": 12,
      "title": "PC is my world",
      "imageUrl": "https://i.redd.it/2rjggvtzqn751.jpg",
      "price": 999.99,
      "description":
          "Customizable PC with powerful hardware, perfect for gaming and professional use.",
      "category": "Hardware"
    }
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredData = [];

    void updateData(String category) {
      filteredData = data.where((element) {
        return element['category'] == category;
      }).toList();
      setState(() {}); // Trigger a rebuild with the updated data
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Positioned(
              top:0,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            SizedBox(height: 7),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                  Category(categoryName: 'Technology', onTap: updateData),
                ],
              ),
            ),
            SizedBox(height: 1),
            CardSection(
              data: data,
              title: "",
              marginBetween: 1,
              type: 'search',
            )
          ],
        ),
      ),
    );
  }
}
