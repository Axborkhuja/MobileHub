import 'package:flutter/material.dart';

import '../FavoritePage/FavoriteScreens.dart';
import '../Product Page/ProductPage.dart';
import '../SearchPage/SearchScreen.dart';

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      )
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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