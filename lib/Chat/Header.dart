import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://your-image-url.com'),
        radius: 20,
      ),
      title: Text('Support'),
    );
  }
}