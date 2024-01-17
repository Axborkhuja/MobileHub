import 'package:flutter/material.dart';


class Body extends StatefulWidget{
  final List<Map<String, dynamic>> favourites;

  _Body createState() => _Body(favourites: favourites);

  Body({required this.favourites});
}

class _Body extends State<StatefulWidget> {
  final List<Map<String, dynamic>> favourites;

  _Body({required this.favourites});


  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(favourites[index]['image'],
                  width: 50, height: 50),
              title: Text(favourites[index]['name']),
              subtitle: Text('\$${favourites[index]['price']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    favourites.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      );
  }
}