import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String categoryName;
  final Function(String) onTap;

  Category({required this.categoryName, required this.onTap});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    bool isDarkTheme = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        // Toggle the isSelected state and trigger the onTap callback
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap(widget.categoryName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? isDarkTheme
                  ? Colors.white
                  : Colors.black
              : isDarkTheme
                  ? Colors.black45
                  : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        child: Text(
          widget.categoryName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? isDarkTheme
                    ? Colors.black
                    : Colors.white
                : isDarkTheme
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}
