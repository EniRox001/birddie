import 'package:flutter/material.dart';
import 'package:birddie/widgets/w_event_card.dart';

class Events extends ChangeNotifier {
  final List _events = <WEventCard>[
    WEventCard(
      backgroundColor: Colors.red,
      onPressed: () {},
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
      onPressed: () {},
      onAttendeePressed: () {},
      location: 'Ikeja',
      price: '5',
      title: 'OLD SCHOOL DANCE',
      description:
          'Come and relive those good times, hang with old friends and make new one...',
      slotsLeft: 2,
      date: '2nd February 2022',
      time: '16:00:00',
    ),
  ];

  List get events => _events;
  int get eventsLength => _events.length;
}
