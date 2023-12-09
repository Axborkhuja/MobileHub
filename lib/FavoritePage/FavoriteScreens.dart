import 'package:flutter/material.dart';
import 'package:test123/HomeScreen/HeaderBar.dart';
import 'package:test123/Product%20Page/ProductPage.dart';

class FavoriteScreens extends StatefulWidget {
  FavoriteScreens({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavoriteScreens> {
  final List<Map<String, dynamic>> _favourites = [
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
      appBar: HeaderBar(),
      body: ListView.builder(
        itemCount: _favourites.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(_favourites[index]['image'],
                  width: 50, height: 50),
              title: Text(_favourites[index]['name']),
              subtitle: Text('\$${_favourites[index]['price']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _favourites.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProductScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
