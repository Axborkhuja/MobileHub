import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardSection extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CardSection({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Popular",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Container(
                height: 130.0,
                child: ListTile(
                  title: Text(data[index]['title']),
                  subtitle: CachedNetworkImage(
                    imageUrl: data[index]['imageUrl'],
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
