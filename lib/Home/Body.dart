import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/CardSection.dart';


class Body extends StatelessWidget {
  final List<String> imageUrls;
  final List<Map<String, dynamic>> data;

  Body({required this.imageUrls,required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "New",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
            ),
            Center(
              child: CarouselSlider(
                items: imageUrls.map((url) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Center(
              child: CardSection(data: data,title: "Popular"),
            )
          ],
        ),
      ),
    );
  }
}
