class Events {
  String id;
  String title;
  String description;
  String price;
  List attending;
  int slotsLeft;
  DateTime date;
  DateTime time;
  bool reserved;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'attending': attending,
      'slot_left': slotsLeft,
      'date': date,
      'time': time,
      'reserved': reserved,
    };
  }

  Events(
    this.id,
    this.title,
    this.description,
    this.price,
    this.attending,
    this.slotsLeft,
    this.date,
    this.time,
    this.reserved,
  );
}
