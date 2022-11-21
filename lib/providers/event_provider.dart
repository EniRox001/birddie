import 'package:flutter/material.dart';
import 'package:birddie/widgets/w_event_card.dart';

class Events extends ChangeNotifier {
  late WEventCard _event;
  final List _events = <WEventCard>[
    WEventCard(
      backgroundColor: Colors.red,
      onAttendeePressed: () {},
      location: 'Ikeja',
      price: '5',
      title: 'OLD SCHOOL DANCE',
      description:
          'Come and relive those good times, hang with old friends and make new one hang with old friends and having...',
      slotsLeft: 2,
      date: '2nd February 2022',
      time: '16:00:00',
    ),
    WEventCard(
      backgroundColor: Colors.blue,
      onAttendeePressed: () {},
      location: 'Yola',
      price: '8',
      title: 'BBQ DATE',
      description:
          'Bring that special person and have fun at the best BBQ session of the entire year...',
      slotsLeft: 2,
      date: '14th February 2022',
      time: '16:00:00',
    ),
    WEventCard(
      backgroundColor: Colors.blue,
      onAttendeePressed: () {},
      location: 'Jos',
      price: '2',
      title: 'BLACK PANTHER PREMIER',
      description:
          'Watch the premiere of the most anticipated marvel movie of the year at Fastnet cinema only...',
      slotsLeft: 2,
      date: '14th November 2022',
      time: '20:00:00',
    ),
  ];

  WEventCard get eventCard => _event;
  List get events => _events;
  int get eventsLength => _events.length;

  void setSelectedEvent(int index) {
    _event = events[index];
    notifyListeners();
  }

  void setReservedSlot(WEventCard eventCard) {
    eventCard.reservedSlot = true;
    notifyListeners();
  }
}
