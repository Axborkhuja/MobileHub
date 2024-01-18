import "package:flutter/material.dart";

class Category extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Expanded(
        child: ListView.builder(
          itemCount: 20, // Replace with your actual search results count
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Search Result $index'),
            );
          },
        ),
      ),
    );
  }
}