import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test123/Bucket/Screen.dart';
import 'package:test123/Home/Screen.dart';
import 'package:test123/Profile/Screen.dart';
import 'package:test123/components/BottomBar.dart';

import 'Favorites/Screen.dart';
import 'Search/Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: '[DEFAULT]',
    options: FirebaseOptions(
    appId: "1:150260257894:android:7935e5337befa506c089a7",
    messagingSenderId: "150260257894",
    projectId: "mobileprogramming-23a1c",
      apiKey: '150260257894',
  ),);
  runApp(MyApp());
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
