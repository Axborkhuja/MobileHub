import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(''),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'bucket': [],
        'favorites': [],
      });
      Navigator.pushReplacementNamed(context, '/login');
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
        title: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            )),
      ),
      body: GestureDetector(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 70),
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                const SizedBox(width: 10, height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.center,
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.mail),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.center,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.key),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.remove_red_eye),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Confirm Password',
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 300, // <-- Button width here
                  child: ElevatedButton(
                    onPressed: () async {
                      await _register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Registration',
                          style: TextStyle(
                              fontSize: 25,
                              color: brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta != null) {
            if (details.primaryDelta! > 0) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          }
        },
      ),
    );
  }
}
