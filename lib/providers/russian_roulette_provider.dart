import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class RussianRouletteProvider extends ChangeNotifier {
  late ObjectId _id;
  late ObjectId _matchedPerson;
  late int _minAge;
  late int _maxAge;
  late String _location;
  late String _dateSetup;
  String _date = '';
  late String _time;
  late int _spendingGauge;
  late String _whoPays;
  String _matchState = 'not matched';

  ObjectId get id => _id;
  ObjectId get matchedPerson => _matchedPerson;
  int get minAge => _minAge;
  int get maxAge => _maxAge;
  String get location => _location;
  String get dateSetup => _dateSetup;
  String get date => _date;
  String get time => _time;
  int get spendingGauge => _spendingGauge;
  String get whoPays => _whoPays;
  String get matchState => _matchState;

  void setLoggedRussianRoulette() {
    _id = russianRoulette['id'];
    _matchedPerson = russianRoulette['matchedPerson'];
    _minAge = russianRoulette['min_age'];
    _maxAge = russianRoulette['max_age'];
    _location = russianRoulette['location'];
    _dateSetup = russianRoulette['date_setup'];
    _date = russianRoulette['date'];
    _time = russianRoulette['time'];
    _spendingGauge = russianRoulette['spending_gauge'];
    _whoPays = russianRoulette['who_pays'];
    _matchState = russianRoulette['matchState'];

    notifyListeners();
  }

  void getRussianRoulettes(BuildContext context) {
    getRussianRoulette(context);

    notifyListeners();
  }

  void setMatchedUser(ObjectId id) {
    _matchedPerson = id;
    notifyListeners();
  }

  void setMinAge(int minAge) {
    _minAge = minAge;
    notifyListeners();
  }

  void setMaxAge(int maxAge) {
    _maxAge = maxAge;
    notifyListeners();
  }

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void setDateSetup(String dateSetup) {
    _dateSetup = dateSetup;
    notifyListeners();
  }

  void setDate(String date) {
    _date = date;
    notifyListeners();
  }

  void setTime(String time) {
    _time = time;
    notifyListeners();
  }

  void setSpendingGauge(int spendingGauge) {
    _spendingGauge = spendingGauge;
    notifyListeners();
  }

  void setWhoPays(String whoPays) {
    _whoPays = whoPays;
    notifyListeners();
  }

  void setMatchState(String match) {
    _matchState = match;
    notifyListeners();
  }

  void setRussianRoulette(BuildContext context) {
    addRussianRoulette(context);
    notifyListeners();
  }
}
