import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/CardSection.dart';

class Body extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const Body({super.key,  required this.data});

  @override
  _BodyState createState() => _BodyState( );
}

class _BodyState extends State<Body> {
  int _currentIndex = 0;
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
                  itemCount: 6,
                  itemBuilder: (context, index, realIndex) {
                    final url = widget.data[index]['imageUrl'];
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
                          image: NetworkImage(url!),
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
                    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CardSection(data: widget.data, title: "Popular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
