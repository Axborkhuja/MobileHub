import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child:
        Text(
          'PC Shop',
          style: TextStyle(
            fontSize: 30,  // Increased font size for emphasis
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,  // Adjust letter spacing for a clean look
            color: Colors.black,  // Use a subtle color like black or grey
            fontFamily: 'Roboto',  // Choose a clean and modern font
          ),
        )

      ),
      actions: [

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
