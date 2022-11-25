import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class EventProviders extends ChangeNotifier {
  late ObjectId _id;
  late String _title;
  late String _description;
  late String _location;
  late String _price;
  late List _attending;
  late int _slotsLeft;
  late String _date;
  late String _time;

  ObjectId get id => _id;
  String get title => _title;
  String get price => _price;
  String get description => _description;
  String get location => _location;
  List get attending => _attending;
  int get slotsLeft => _slotsLeft;
  String get date => _date;
  String get time => _time;

  void setSelected() async {
    _id = selectedEvent['id'];
    _title = selectedEvent['title'];
    _description = selectedEvent['description'];
    _location = selectedEvent['location'];
    _price = selectedEvent['price'];
    _attending = selectedEvent['attending'];
    _slotsLeft = selectedEvent['slot_left'];
    _date = selectedEvent['date'];
    _time = selectedEvent['time'];
  }

  void setReservedSlot(BuildContext context) async {
    reserveSlot(context);
    _slotsLeft -= 1;
    getEvents();
    notifyListeners();
  }
}
