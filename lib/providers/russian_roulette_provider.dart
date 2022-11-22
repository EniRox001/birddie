import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RussianRoulletes extends ChangeNotifier {
  String _matchState = 'not matched';

  String get matchState => _matchState;

  void setMatchState(String match) {
    _matchState = match;
    notifyListeners();
  }
}
