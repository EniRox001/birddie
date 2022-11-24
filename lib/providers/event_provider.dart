import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:birddie/widgets/w_event_card.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

class EventProviders extends ChangeNotifier {
  ObjectId _id = selectedEvent['_id'];
  late String _title = selectedEvent['title'];
  late String _description = selectedEvent['description'];
  late String _location = selectedEvent['location'];
  late String _price = selectedEvent['price'];
  late List _attending = selectedEvent['attending'];
  late int _slotsLeft = selectedEvent['slot_left'];
  late String _date = selectedEvent['date'];
  late String _time = selectedEvent['time'];

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
