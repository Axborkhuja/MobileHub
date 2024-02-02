import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Brightness brightness;
  final Map<String, dynamic> data;
  final String? type;

  CustomCard({required this.brightness, required this.data, this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        width: type == null ? 200 : 10,
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: type == null ? Radius.circular(5) : Radius.circular(10),
                topRight:
                    type == null ? Radius.circular(5) : Radius.circular(10),
              ),

              image: DecorationImage(
                fit: type!=null?BoxFit.fitHeight: BoxFit.cover,
                image: NetworkImage(data['imageUrl']),
              ),
            ),
            child: type=='search' ? Container(
              height: 40,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: brightness != Brightness.dark
                    ? Colors.white.withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'],
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: brightness != Brightness.light
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ):Center(),
          ),
        ),
        type==null ? Container(
          // height: type == null ? 85 : 40,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: type == null
                ? (brightness != Brightness.dark ? Colors.white : Colors.black)
                : (brightness == Brightness.dark
                    ? Colors.transparent
                    : Colors.black12),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(type == null ? 10.0 : 10),
              bottomRight: Radius.circular(type == null ? 10.0 : 10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: brightness != Brightness.light
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              if (type == null) ...[
                const SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    data['price']+"\$",
                    style: TextStyle(
                        color: brightness != Brightness.light
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),

                  ),
                ),
              ],
            ],
          ),
        ):Center(),
      ],
    );
  }
}
