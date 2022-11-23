class RussianRoullete {
  String id;
  int minAge;
  int maxAge;
  String location;
  String dateSetup;
  DateTime date;
  DateTime time;
  int spendingGauge;
  String whoPays;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'min_age': minAge,
      'max_age': maxAge,
      'location': location,
      'date_setup': dateSetup,
      'date': date,
      'time': time,
      'spending_gauge': spendingGauge,
      'who_pays': whoPays,
    };
  }

  RussianRoullete(
    this.id,
    this.minAge,
    this.maxAge,
    this.location,
    this.dateSetup,
    this.date,
    this.time,
    this.spendingGauge,
    this.whoPays,
  );
}
