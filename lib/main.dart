import 'package:flutter/material.dart';
import 'package:test123/Bucket/Screen.dart';
import 'package:test123/Home/Screen.dart';
import 'package:test123/Profile/Screen.dart';

import 'Favorites/Screen.dart';
import 'Search/Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobileHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreens(),
        '/bucket': (context) => BucketScreen(),
        '/profile': (context) => ProfileScreens(),
      },
      initialRoute: '/',

    );
  }
}
