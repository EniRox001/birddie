import 'package:flutter/material.dart';

class RussianRoulletes extends ChangeNotifier {
  //TODO: Set up model to automatically add data to matched events
  String _matchState = 'not matched';

  String get matchState => _matchState;

  void setMatchState(String match) {
    _matchState = match;
    notifyListeners();
  }
}
