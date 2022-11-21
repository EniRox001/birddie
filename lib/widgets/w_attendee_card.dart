import 'package:flutter/material.dart';

class WAttendeeCard extends StatelessWidget {
  const WAttendeeCard({
    Key? key,
    required this.onAttendeePressed,
  }) : super(key: key);

  final VoidCallback onAttendeePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
