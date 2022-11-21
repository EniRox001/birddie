import 'package:flutter/material.dart';

class WEventCard extends StatelessWidget {
  const WEventCard({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.onAttendeePressed,
    required this.location,
    required this.price,
    required this.title,
    required this.description,
    required this.slotsLeft,
    required this.date,
    required this.time,
  }) : super(key: key);

  final Color backgroundColor;
  final VoidCallback onPressed;
  final VoidCallback onAttendeePressed;
  final String location;
  final String price;
  final String title;
  final String description;
  final int slotsLeft;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '$title | $location',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.6,
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
                      GestureDetector(
                        //TODO: Show list of all people attending
                        onTap: onAttendeePressed,
                        child: SizedBox(
                          width: 80,
                          child: Stack(
                            //TODO: Add Individual Images here
                            children: const [
                              CircleAvatar(),
                              Positioned(
                                left: 20.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                left: 40.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
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
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
