import 'package:birddie/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';

class ReviewRoulette extends StatelessWidget {
  const ReviewRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            'Under review',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'You will be matched within 24hrs!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                          Text('--/--/----',
                              style: Theme.of(context).textTheme.bodyLarge!),
                          Text(
                            '--:--am/pm',
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
                              context.read<RussianRouletteProvider>().location,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              context.read<RussianRouletteProvider>().location,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              context.read<RussianRouletteProvider>().dateSetup,
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
                              '${context.read<RussianRouletteProvider>().minAge} - ${context.read<RussianRouletteProvider>().maxAge}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                        ),
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
                                //tODO: Show time remaining till verification
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
