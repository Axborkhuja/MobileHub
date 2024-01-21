import 'package:flutter/material.dart';
import 'package:test123/components/CardSection.dart';
import '../components/Category.dart';

class Body extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  Body({super.key, required this.data});
  @override
  _BodyState createState() => _BodyState(data: data);
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> data;
  _BodyState({required this.data});
  List<Map<String, dynamic>> filteredData = [];

  void updateData(String category) {
    filteredData = data.where((element) {
      return element == 'category';
    }).toList();
    setState(() {}); // Trigger a rebuild with the updated data
    print(filteredData);
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 60),
                CardSection(
                  data: data,
                  title: "",
                  marginBetween: 1,
                  type: 'search',
                  axisNum: 3,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color:
                  brightness == Brightness.dark ? Colors.black : Colors.white,
              border: Border.all(color: Colors.white12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      color: brightness == Brightness.dark
                          ? Colors.white30
                          : Colors.black38,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.4)
                      : Colors.black.withOpacity(0.4),
                  thickness: 2.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: data
                        .map((item) => Category(
                              categoryName: item['category'],
                              onTap: updateData,
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 2,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
