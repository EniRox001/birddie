import 'package:flutter/material.dart';

class LoginSignUp extends ChangeNotifier {
  late String _phoneNumber;

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }
}
