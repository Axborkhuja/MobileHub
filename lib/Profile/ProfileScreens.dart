import 'package:flutter/material.dart';
import 'package:test123/HomeScreen/HomeScreen.dart';
import 'package:test123/Profile/HeaderBar.dart';
import 'package:test123/Profile/Body.dart';

import '../FavoritePage/FavoriteScreens.dart';
import '../SearchPage/SearchScreen.dart';

class ProfileScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Body(),
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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

        break;
    }
  }

}
