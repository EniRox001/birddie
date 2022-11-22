import 'package:flutter/material.dart';
import 'w_elevated_button.dart';
import 'package:birddie/screens/russian_roulette.dart';
import 'package:birddie/utils/functions.dart';

const upcomingFeatureSnackBar = SnackBar(
  content: Text('This feature is coming soon... Stay Tuned!'),
);

class NotMatchedRoulette extends StatelessWidget {
  const NotMatchedRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Please choose below',
          ),
          WElevatedButton(
            onPressed: () {
              navigate(
                context,
                const RussianRoullete(),
              );
            },
            text: 'Russian Roulette',
            outlined: true,
          ),
          WElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(upcomingFeatureSnackBar);
            },
            text: 'Sponsored Roulette',
            outlined: true,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              color: Color(
                0xFFFF5454,
              ),
              thickness: 1.0,
            ),
          ),
          Text(
            'NEXT LEVEL STUFF',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'This section is only for users that have passed all verification processed',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          WElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(upcomingFeatureSnackBar);
            },
            text: 'Match Metrix',
            outlined: true,
          ),
        ],
      ),
    );
  }
}
