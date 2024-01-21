import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;

  void setAuthenticated(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }
}
