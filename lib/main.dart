import 'package:flutter/material.dart';
import 'package:test123/Bucket/Screen.dart';
import 'package:test123/Home/Screen.dart';
import 'package:test123/Profile/Screen.dart';
import 'package:test123/components/BottomBar.dart';

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
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;

    return MaterialApp(
      title: 'MobileHub',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: brightnessValue == Brightness.dark
            ? ColorScheme.dark(
          primary: Colors.white, // Invert primary color
          onPrimary: Colors.black, // Invert text color on primary color
          // Add any additional dark mode customization here
        )
            : ColorScheme.light(
          primary: Colors.black, // Invert primary color
          onPrimary: Colors.white, // Invert text color on primary color
          // Add any additional light mode customization here
        ),
      ).copyWith(
        // Add any additional theme customization here
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreens(),
        '/bucket': (context) => BucketScreen(),
        '/profile': (context) => ProfileScreens(),
      },
      initialRoute: '/',
      home:BottomBar(),
    );
  }
}
