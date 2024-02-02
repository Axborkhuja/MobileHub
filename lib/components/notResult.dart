import 'package:flutter/material.dart';

class notResults extends StatelessWidget {
  const notResults({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Text(
            "Not have results",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
        )
      ],
    );
  }
}
