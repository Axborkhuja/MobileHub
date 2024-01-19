import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/CardSection.dart';

class Body extends StatefulWidget {
  final List<String> imageUrls;
  final List<Map<String, dynamic>> data;

  Body({required this.imageUrls, required this.data});

  @override
  _BodyState createState() => _BodyState(imageUrls: imageUrls, data: data);
}

class _BodyState extends State<Body> {
  int _currentIndex = 0;
  final List<String> imageUrls;
  final List<Map<String, dynamic>> data;
  _BodyState({required this.imageUrls, required this.data});
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: widget.imageUrls.length,
                  itemBuilder: (context, index, realIndex) {
                    final url = widget.imageUrls[index];
                    double scaleFactor = _currentIndex == index ? 2.0 : 0.9;
                    return Container(
                      width: MediaQuery.of(context).size.width * scaleFactor,
                      height: 100,
                      decoration: BoxDecoration(
                        color: brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white70,
                        backgroundBlendMode: BlendMode.colorBurn,
                        borderRadius: BorderRadius.circular(0.0),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: brightness==Brightness.dark?Colors.white.withOpacity(0.2):Colors.black.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 16,
                  child: Text(
                    "New",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: brightness==Brightness.dark?Colors.black:Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CardSection(data: data, title: "Popular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
