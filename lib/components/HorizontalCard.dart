import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/components/notResult.dart';

class FavouriteCard extends StatefulWidget {
  final Map<String, dynamic>? data;

  const FavouriteCard({super.key,required this.data});

  @override
  _FavouriteCardState createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        // Show remove confirmation modal when trying to go below 1
        showRemoveConfirmation();
      }
    });
  }

  void showRemoveConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove from Favourites?"),
          content: const Text(
              "Are you sure you want to remove this product from favourites?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Perform removal logic here
              },
              child: const Text("Remove"),
            ),
          ],
        );
      },
    );
  }


  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return user==null?
    Container(
      margin: const EdgeInsets.all(7.0),
      width: 342,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: brightness == Brightness.dark ? Colors.white : Colors.black,
        boxShadow: [
          BoxShadow(
            color: brightness == Brightness.dark
                ? Colors.black.withOpacity(0.2)
                : Colors.white.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  widget.data?['imageUrl'] ??
                      'https://st2.depositphotos.com/47577860/46262/v/450/depositphotos_462626530-stock-illustration-camera-electronics-film-icon-outline.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data?['name'] ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.data?['description'] ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        "${(int.parse(widget.data!['price']) | 0)  * quantity}\$",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_circle_outline,
                                color: brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                size: 20),
                            onPressed: _incrementQuantity,
                          ),
                          Text(
                            "$quantity",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline,
                                color: brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                size: 20),
                            onPressed: _decrementQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ):const notResults();
  }
}
