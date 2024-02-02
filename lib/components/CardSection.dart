import 'package:flutter/material.dart';
import 'package:test123/Product/Screen.dart';
import 'package:test123/components/CustomCard.dart';

class CardSection extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String title;
  final int? marginBetween;
  final String? type;
  final int axisNum;
  const CardSection(
      {super.key, required this.data,this.axisNum=2, required this.title, this.marginBetween, this.type});

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
                color: brightness != Brightness.light
                    ? Colors.white
                    : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: axisNum,
          mainAxisSpacing: marginBetween?.ceilToDouble() ?? 10.0,
          crossAxisSpacing: marginBetween?.ceilToDouble() ?? 10.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
                child: CustomCard(
                  brightness: brightness,
                  data: data[index],
                  type: type,
                )),
          ),
        ),
      ],
    );
  }
}
