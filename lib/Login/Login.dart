import 'package:flutter/material.dart';

void main() {
  runApp(LogInApp());
}

class LogInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 150),
                Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 100),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.mail),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Email/Phone number',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.key),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity, // <-- Button width here
                  child: ElevatedButton(
                    onPressed: () {},
                    child:
                        Text('Log in', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Builder(
                  builder: (context) => TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpApp()),
                      );
                    },
                    child:
                        Text('Sign Up', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text('Use Guest mode',
                      style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
