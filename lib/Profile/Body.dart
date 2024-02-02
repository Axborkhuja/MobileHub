import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final pickedImage = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );

              if (pickedImage != null) {
                setState(() {
                  _pickedImage = File(pickedImage.path);
                });
              }
            },
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : const NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg')
                      as ImageProvider<Object>?,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user?.displayName ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user?.email ?? '',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              try {
                if (user != null) {
                  if (_pickedImage != null) {}

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user?.uid)
                      .set({
                    'name': nameController,
                    'email': emailController,
                    'password': passwordController
                  });
                }
              } catch (e) {
                print('Error updating profile: $e');
              }
            },
            child: const Text('Save Changes'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context,'/');
              } catch (e) {
                print('Error updating profile: $e');
              }
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
