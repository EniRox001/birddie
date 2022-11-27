import 'package:mongo_dart/mongo_dart.dart';

class RussianRoullete {
  ObjectId id;
  String phoneNumber;
  int minAge;
  int maxAge;
  String location;
  String dateSetup;
  String date;
  String time;
  int spendingGauge;
  String whoPays;
  bool matchState;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'min_age': minAge,
      'max_age': maxAge,
      'location': location,
      'date_setup': dateSetup,
      'date': date,
      'time': time,
      'spending_gauge': spendingGauge,
      'who_pays': whoPays,
      'matchState': matchState,
    };
  }

  RussianRoullete(
    this.id,
    this.phoneNumber,
    this.minAge,
    this.maxAge,
    this.location,
    this.dateSetup,
    this.date,
    this.time,
    this.spendingGauge,
    this.whoPays,
    this.matchState,
  );
}
