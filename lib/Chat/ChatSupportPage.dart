import 'package:flutter/material.dart';
import '../FavoritePage/FavoriteScreens.dart';
import '../SearchPage/SearchScreen.dart';
import './HeaderBar.dart';
import './Body.dart';


class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatSupportPageState createState() => _ChatSupportPageState();
}

class _ChatSupportPageState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Body(controller: _controller),
    );
  }


}