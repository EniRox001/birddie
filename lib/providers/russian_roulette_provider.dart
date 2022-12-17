import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/cloud_functions/shared_prefernces.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mongo_dart/mongo_dart.dart';

ObjectId uninitializedId = ObjectId();

class RussianRouletteProvider extends ChangeNotifier {
  ObjectId _id = uninitializedId;
  String _phoneNumber = '';
  int _minAge = 0;
  int _maxAge = 100;
  String _location = 'Select Location';
  String _dateSetup = '';
  String _date = '';
  String _time = '';
  int _spendingGauge = 0;
  String _whoPays = '';
  bool _matchState = false;
  String _inMatchedOne = '';
  String _inMatchedTwo = '';
  List<types.Message> _chat = [];
  List _chatList = [];
  String _state = '';
  String _region = '';
  String _area = '';
  final List<String> _stateList = ['any', 'lagos', 'abuja'];
  List<String> _regionList = ['any'];
  List<String> _areaList = ['any'];

  ObjectId get id => _id;
  String get phoneNumber => _phoneNumber;
  int get minAge => _minAge;
  int get maxAge => _maxAge;
  String get location => _location;
  String get dateSetup => _dateSetup;
  String get date => _date;
  String get time => _time;
  int get spendingGauge => _spendingGauge;
  String get whoPays => _whoPays;
  bool get matchState => _matchState;
  String get inMatchedOne => _inMatchedOne;
  String get inMatchedTwo => _inMatchedTwo;
  List<types.Message> get chat => _chat;
  List get chatList => _chatList;
  String get state => _state;
  String get region => _region;
  String get area => _area;
  List<String> get stateList => _stateList;
  List<String> get regionList => _regionList;
  List<String> get areasList => _areaList;

  void setLoggedRussianRoulette() {
    _id = russianRoulette['id'];
    _phoneNumber = russianRoulette['phone_number'];
    _minAge = russianRoulette['min_age'];
    _maxAge = russianRoulette['max_age'];
    _location = russianRoulette['location'];
    _dateSetup = russianRoulette['date_setup'];
    _date = russianRoulette['date'];
    _time = russianRoulette['time'];
    _spendingGauge = russianRoulette['spending_gauge'];
    _whoPays = russianRoulette['who_pays'];
    _matchState = russianRoulette['matchState'];
    _chat = List.from(chatCollection);
    _chatList = List.from(chatCollection);

    notifyListeners();
  }

  void setNullRussianRoulette() {
    _id = uninitializedId;
    _phoneNumber = phoneNumber;
    _minAge = minAge;
    _maxAge = maxAge;
    _location = location;
    _dateSetup = dateSetup;
    _date = date;
    _time = time;
    _spendingGauge = spendingGauge;
    _whoPays = whoPays;
    _matchState = matchState;
    _chat = chat;
    _chatList = chatList;
    notifyListeners();
  }

  void getRussianRoulettes(BuildContext context) {
    getRussianRoulette(context);
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

  void setMatchState(bool match) {
    _matchState = match;
    notifyListeners();
  }

  void setRussianRoulette(BuildContext context) {
    addRussianRoulette(context);
    notifyListeners();
  }

  void autoMatchRoulette(BuildContext context) {
    russianRoulleteAutoMatch(context);
    notifyListeners();
  }

  void setInMatchedOne(BuildContext context, String number) {
    _inMatchedOne = number;
    notifyListeners();
  }

  void setInMatchedTwo(BuildContext context, String number) {
    _inMatchedTwo = number;
    notifyListeners();
  }

  void checkInMatchedCollection(BuildContext context) {
    checkMatchedOneCollection(context);
    checkMatchedTwoCollection(context);
    notifyListeners();
  }

  void setLocalChatState() {
    _chat = List.from(chatCollection);
    notifyListeners();
  }

  void addMessage(BuildContext context, message, chatMessage) {
    _chat.insert(0, message);
    _chatList.insert(0, chatMessage);
    chatAddMessage(context);
    // chatAddMessageAlt(context);
    setLocalChatState();
    notifyListeners();
  }

  void logOut() {
    setNullRussianRoulette();
    setNullPref();
    notifyListeners();
  }

  void setRegionList(List<String> list) {
    _regionList = list;
    notifyListeners();
  }

  void setAreaList(List<String> list) {
    _areaList = list;
    notifyListeners();
  }

  void setState(String state) {
    _state = state;
    notifyListeners();
  }

  void setRegion(String region) {
    _region = region;
    notifyListeners();
  }

  void setArea(String area) {
    _area = area;
    notifyListeners();
  }

  void setDateLocation(String state, String region, String area) {
    _state = state;
    _region = region;
    _area = area;
    notifyListeners();
  }
}
