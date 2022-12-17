import 'package:birddie/widgets/dashboard/w_attendee_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WEventCard extends StatelessWidget {
  WEventCard({
    Key? key,
    required this.backgroundColor,
    required this.onAttendeePressed,
    required this.location,
    required this.price,
    required this.title,
    required this.description,
    required this.slotsLeft,
    required this.date,
    required this.time,
    this.reservedSlot = false,
  }) : super(key: key);

  final Color backgroundColor;
  final VoidCallback onAttendeePressed;
  final String location;
  final String price;
  final String title;
  final String description;
  final int slotsLeft;
  final String date;
  final String time;
  bool reservedSlot;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        '$title | $location',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.65,
                      child: Text(
                        description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'N${price}k',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Attending',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    WAttendeeCard(onAttendeePressed: onAttendeePressed),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Slots Left',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      slotsLeft.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.white, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
