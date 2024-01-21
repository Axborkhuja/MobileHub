import 'package:flutter/material.dart';
import 'package:test123/Bucket/Screen.dart';
import 'package:test123/Favorites/Screen.dart';
import 'package:test123/Home/Screen.dart';
import 'package:test123/Profile/Screen.dart';
import 'package:test123/Search/Screen.dart';

class BottomBar extends StatefulWidget {
  final String Useruid;
  BottomBar({this.Useruid = ""});
  @override
  _BottomBarState createState() => _BottomBarState(this.Useruid);
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  _BottomBarState(String Useruid);
  @override
  Widget build(BuildContext context) {
    // String? currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(), // Home screen
          SearchScreen(), // Search screen
          FavoriteScreens(), // Favorites screen
          BucketScreen(), // Bucket screen
          ProfileScreens(), // Profile screen
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor:
            brightness == Brightness.dark ? Colors.black12 : Colors.white24,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Change the color as needed
        unselectedItemColor: Colors.grey, // Change the color as needed
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,
                  size: 40,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              label: 'Home',
            activeIcon: Icon(Icons.home,
                size: 40,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  size: 40,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              label: 'Search',
            activeIcon: Icon(Icons.saved_search,
                size: 40,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  size: 40,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              label: 'Favorites',
            activeIcon: Icon(Icons.favorite,
                size: 40,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined,
                  size: 40,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              label: 'Bucket',
            activeIcon: Icon(Icons.shopping_basket,
                size: 40,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,
                  size: 40,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              label: 'Profile',
            activeIcon: Icon(Icons.account_circle,
                size: 40,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
        ],
      ),
    );
  }
}
