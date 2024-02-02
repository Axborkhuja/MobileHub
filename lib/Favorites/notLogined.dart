import 'package:flutter/material.dart';

class notLogined extends StatelessWidget {
  const notLogined({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Column(
      children: [
        Center(
          child: Text(
            "Favorites",
            style: TextStyle(
              fontSize: 25,
                fontWeight: FontWeight.w400,
                color: brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                "Please Login in Profile Screen and then you can access to Favorite products",
                style: TextStyle(
                    fontSize: 20,
                    color: brightness == Brightness.dark
                        ? Colors.white60
                        : Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
