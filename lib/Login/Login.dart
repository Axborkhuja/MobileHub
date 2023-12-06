import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(children: [ Container(
                width: 300,
                height: 47.14814758300781,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x00f1f1f1))
            ),
              Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              Image.asset(
                "assets/Vector 28.png",
                width: 15,
                height: 18.755428314208984,
              )],),
            Stack(children: [ Container(
                width: 300,
                height: 47.72037887573242,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x00f1f1f1))
            ),
              Text(
                  "Email/Phone number",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              Image.asset(
                "assets/Vector 29.png",
                width: 15,
                height: 8.877551078796387,
              )],),
            Column(
              children: [
                Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )
                )
              ],
            ),
            Text(
                "Log in",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                )
            ),
            Text(
                "Use Guest mode",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
            )
          ],
        ),
      ),
    );
  }
}