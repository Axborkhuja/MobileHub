import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test123/components/BottomBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final String authenthicated;
  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user?.uid != null) {
        authenthicated=userCredential.user!.uid;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBar(Useruid: authenthicated),
          ),
        );      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(''),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed: ${e.message}'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _login(context),
                  icon: Icon(Icons.login),
                  label: const Text('Sign In'),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              "Sign Up",
              style: TextStyle(
                decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ),
            onHorizontalDragStart: (details) {
                Navigator.pushReplacementNamed(context, '/registr');
              },
          ),
        ],
      ),
    );
  }
}
