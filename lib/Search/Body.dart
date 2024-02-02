import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/CardSection.dart';
import '../components/Category.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> filteredData = [];
  Set<String> uniqueCategories = {};
  String selectedCategory = "";
  late List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    data.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());

    setState(() {
      uniqueCategories = data.map((item) => item['category'] as String).toSet();
      filteredData = data;
    });
  }

  void updateData(String category) {
    if (selectedCategory == category) {
      selectedCategory = "";
      filteredData = data;
    } else {
      selectedCategory = category;
    }
  }

  void searchupdate(String searchText) {
    setState(() {
      filteredData = data
          .where((element) =>
              element['name'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return ListView(children: [
      Container(
        decoration: BoxDecoration(
          color: brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => searchupdate(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search_outlined),
                prefixIconColor: brightness == Brightness.dark
                    ? Colors.white38
                    : Colors.black38,
              ),
            ),
            Divider(
              color: brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.4)
                  : Colors.black.withOpacity(0.4),
              thickness: 2.0,
            ),
            // SingleChildScrollView(
            //   padding: const EdgeInsets.all(10.0),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: uniqueCategories
            //         .map((category) => Category(
            //               categoryName: category,
            //               onTap: updateData,
            //               selectedCategory: selectedCategory,
            //             ))
            //         .toList(),
            //   ),
            // ),
          ],
        ),
      ),

      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardSection(
                data: selectedCategory.isNotEmpty || filteredData.isNotEmpty
                    ? filteredData
                    : data,
                title: "",
                marginBetween: 1,
                type: 'search',
                axisNum: 2,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
