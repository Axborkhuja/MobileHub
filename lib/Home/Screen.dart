import 'package:flutter/material.dart';
import './Body.dart';
import 'package:test123/components/BottomBar.dart';
import './Header.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/51bK4SfEMLL._AC_UF1000,1000_QL80_.jpg',
    'https://www.pcspecialist.co.uk/images/landing/pcs/gaming-pc-bundles/bundles-visual.jpg',
    'https://m.media-amazon.com/images/I/61aULW8uYgL._AC_UF1000,1000_QL80_.jpg',
    'https://image.made-in-china.com/2f0j00heylaNpFbtYW/2023-Hot-Selling-Wholesale-Computers-24-Inch-All-in-One-PC-Computer-I9-I7-Gaming-Desktop-PC.jpg'
    'https://ae01.alicdn.com/kf/Se965ab4e2e93430c93ea415d48524df2s/Hot-selling-Gaming-desktop-computer-24-27-32-inch-in-All-in-one-PC-curved-screen.jpg'
  ];
  final List<Map<String, dynamic>> data = [
    {
      'id':1,
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'id':2,
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'id':3,
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'id':4,
      'title': 'Cooling System',
      'imageUrl':
          'https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp',
    },
    {
      'id':5,
      'title': 'Whole PC',
      'imageUrl': 'https://i.redd.it/2rjggvtzqn751.jpg',
    },
    {
    'id':6,
    'title': "PC is my world",
    'imageUrl': 'https://i.redd.it/2rjggvtzqn751.jpg',
    },
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Body(imageUrls: imageUrls, data: data),
      bottomNavigationBar: BottomBar(),
    );
  }
}
