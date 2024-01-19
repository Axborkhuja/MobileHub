
import 'package:flutter/material.dart';
import 'package:test123/Product/Screen.dart';

class CardSection extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String title;
  final int? marginBetween;
  final String? type;
  CardSection(
      {required this.data, required this.title, this.marginBetween, this.type});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: brightness!=Brightness.light? Colors.white :Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: marginBetween?.ceilToDouble() ?? 10.0,
          crossAxisSpacing: marginBetween?.ceilToDouble() ?? 10.0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            data.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(data[index]),
                  ),
                );
              },
              child: type == null
                  ? Card(
                      margin: EdgeInsets.all(5),
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        data[index]['imageUrl'],
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: brightness!=Brightness.dark? Colors.white :Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['title'],
                                    style: TextStyle(
                                      color: brightness!=Brightness.light? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'There is subtitle',
                                    style: TextStyle(
                                      color: brightness!=Brightness.light? Colors.white :Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Card(
                      margin: EdgeInsets.all(5),
                      child: Container(
                        height: 10,
                        width: 10,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(data[index]['imageUrl']),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: brightness!=Brightness.dark? Colors.white.withOpacity(0.4) :Colors.black.withOpacity(0.4),
                                  // Transparent black background
                                ),
                                child: Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                    color: brightness!=Brightness.light? Colors.white :Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
