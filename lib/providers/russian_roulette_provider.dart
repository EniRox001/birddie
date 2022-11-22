import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RussianRoulletes extends ChangeNotifier {
  String _matched = 'matched';

  String get matched => _matched;

  void setMatch(String match) {
    _matched = match;
    notifyListeners();
  }
}
