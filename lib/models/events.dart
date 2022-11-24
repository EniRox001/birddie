import 'package:mongo_dart/mongo_dart.dart';

class Events {
  ObjectId id;
  String title;
  String description;
  String location;
  String price;
  List attending;
  int slotsLeft;
  String date;
  String time;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'attending': attending,
      'slot_left': slotsLeft,
      'date': date,
      'time': time,
    };
  }

  Events(
    this.id,
    this.title,
    this.description,
    this.location,
    this.price,
    this.attending,
    this.slotsLeft,
    this.date,
    this.time,
  );
}
