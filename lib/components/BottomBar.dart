import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        navigateToScreen(context, index);
      },
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            currentRoute !='/' ? "assets/HomeIcon.png": "assets/HomeActiveIcon.png",
            width: 35,
            height: 35,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentRoute !='/search' ? "assets/SearchIcon.png": "assets/SearchActiveIcon.png",
            width: 35,
            height: 35,
          ),
            label:"Search",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentRoute !='/favorites' ? "assets/FavouriteIcon.png": "assets/FavouriteActiveIcon.png",
            width: 35,
            height: 35,
          ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentRoute !='/bucket' ? "assets/BucketIcon.png": "assets/BucketActiveIcon.png",
            width: 35,
            height: 35,
          ),
          label: 'Bucket',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentRoute !='/profile' ? "assets/ProfileIcon.png": "assets/ProfileActiveIcon.png",
            width: 35,
            height: 35,
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:Navigator.pushReplacementNamed(context, '/'); break;
      case 1:Navigator.pushReplacementNamed(context, '/search');break;
      case 2:Navigator.pushReplacementNamed(context, '/favorites');break;
      case 3:Navigator.pushReplacementNamed(context, '/bucket');break;
      case 4:Navigator.pushReplacementNamed(context, '/profile');break;
    }
  }
}

