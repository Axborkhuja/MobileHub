import 'package:flutter/material.dart';
import 'package:test123/components/BottomBar.dart';
import './Body.dart';
import './Header.dart';

class FavoriteScreens extends StatelessWidget {
  final List<Map<String, dynamic>> favourites = [
    {
      'name': 'Product 1',
      'price': 100.0,
      'image':
      'https://www.hp.com/us-en/shop/app/assets/images/uploads/prod/How%20to%20Clean%20a%20Computer%20Keyboard1646149371308147.jpg'
    },
    {
      'name': 'Product 2',
      'price': 200.0,
      'image':
      'https://img.freepik.com/free-photo/blue-keyboard-with-bright-lights_23-2149680218.jpg?w=1060&t=st=1702071740~exp=1702072340~hmac=f27e3a4e411f8e66520d54cd5478f3e698b38418fa96fc33f4d84b5acd5d9f86'
    },
    {
      'name': 'Product 3',
      'price': 300.0,
      'image':
      'https://img.freepik.com/premium-photo/gaming-desk-with-keyboard-mouse-headphones_160097-375.jpg?w=900'
    },
    // we can add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Body(favourites: favourites),
      bottomNavigationBar: BottomBar(),
    );
  }
}

