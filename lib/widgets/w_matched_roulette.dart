import 'package:birddie/screens/chat_screen.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_mini_elevated_button.dart';
import 'package:flutter/material.dart';

class MatchedRoulette extends StatelessWidget {
  const MatchedRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            'Congratulations!',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'You have been matched!',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: CustomColors.mainRedColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Russian Roulette',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: CustomColors.mainWhiteColor),
                          ),
                          Text('17/08/2022',
                              style: Theme.of(context).textTheme.bodyLarge!),
                          Text(
                            '17:45pm',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAA0A0),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Ideal Location Date',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Fastnet Cinema',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Yola Adamawa State',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Cinema Date',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Age Range',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '24 - 30',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: CustomColors.mainRedColor,
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '09',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: CustomColors.mainWhiteColor),
                                  ),
                                  Text(
                                    'Hours left',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: CustomColors.mainWhiteColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            WMiniButton(onPressed: () {}, text: 'Cancel Date')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.fadedRedColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  WMiniButton(onPressed: () {}, text: 'Google Maps'),
                  WMiniButton(
                    onPressed: () {},
                    text: 'Bolt',
                    color: Colors.green,
                  ),
                  WMiniButton(
                    onPressed: () {},
                    text: 'Uber',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          WElevatedButton(
              onPressed: () {
                navigate(context, const ChatScreen());
              },
              text: 'Chat')
        ],
      ),
    );
  }
}
