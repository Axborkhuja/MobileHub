import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test123/Bucket/Screen.dart';
import 'package:test123/Home/Screen.dart';
import 'package:test123/Login/Screen.dart';
import 'package:test123/Profile/Screen.dart';
import 'package:test123/Registration/Screen.dart';
import 'package:test123/components/BottomBar.dart';
import 'Favorites/Screen.dart';
import 'Search/Screen.dart';
import './utils/auth_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: '[DEFAULT]',
    options: const FirebaseOptions(
    appId: "1:150260257894:android:7935e5337befa506c089a7",
    messagingSenderId: "150260257894",
    projectId: "mobileprogramming-23a1c",
    apiKey: 'AIzaSyAdfFVYb3sSnX3l9TCzHsl_hbyGNGc96ug',
  ),);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
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
            ? const ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.black,
        )
            : const ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
      ).copyWith(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreens(),
        '/bucket': (context) => BucketScreen(),
        '/profile': (context) => const ProfileScreens(),
        '/login':(context) => const LoginScreen(),
        '/register':(context) => Registration(),
      },
      initialRoute: '/',
      home:BottomBar(),
    );
  }
}
