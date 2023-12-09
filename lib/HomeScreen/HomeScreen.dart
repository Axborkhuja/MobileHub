import 'package:flutter/material.dart';
import 'package:test123/HomeScreen/Body.dart';
import 'package:test123/HomeScreen/HeaderBar.dart';
import '../SearchPage/SearchScreen.dart';
import '../FavoritePage/FavoriteScreens.dart';
import '../Profile/ProfileScreens.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/51bK4SfEMLL._AC_UF1000,1000_QL80_.jpg',
    'https://www.pcspecialist.co.uk/images/landing/pcs/gaming-pc-bundles/bundles-visual.jpg',
    'https://m.media-amazon.com/images/I/61aULW8uYgL._AC_UF1000,1000_QL80_.jpg',
  ];
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'title': 'Graphic card',
      'imageUrl':
          'https://specials-images.forbesimg.com/imageserve/61815758c3bbaa89881e3a1c/Best-Graphics-Card-2021--AMD-RX-6600/960x0.jpg?cropX1=0&cropX2=960&cropY1=0&cropY2=720',
    },
    {
      'title': 'Cooling System',
      'imageUrl':
          'https://voltapc.sg/wp-content/uploads/2023/03/water-cooling-pc-system.webp',
    },
    {
      'title': 'Whole PC',
      'imageUrl': 'https://i.redd.it/2rjggvtzqn751.jpg',
    },
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Body(imageUrls: imageUrls, data: data),
      bottomNavigationBar: BottomNavigationBar(
        type:
            BottomNavigationBarType.fixed, // Ensures fixed layout for all icons
        onTap: (index) {
          navigateToScreen(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/HomeIcon.png",
              width: 35,
              height: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/SearchIcon.png",
              width: 35,
              height: 35,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Favourite.png",
              width: 35,
              height: 35,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Profile.png",
              width: 35,
              height: 35,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SearchScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FavoriteScreens()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreens()));
        break;
    }
  }
}
