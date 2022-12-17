import 'package:birddie/views/dashboard/russian_roulette.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/common/w_elevated_button.dart';
import 'package:flutter/material.dart';

class DeclinedRoulette extends StatelessWidget {
  const DeclinedRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sorry!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'We were unable to match you, please, refine your  match preferences and try again.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            WElevatedButton(
              onPressed: () {
                navigate(context, const RussianRoullete());
              },
              text: 'Retry',
            )
          ],
        ),
      ),
    );
  }
}
