import 'package:birddie/screens/event_details.dart';

import 'package:birddie/screens/russian_roulette.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_declined_roulette.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_matched_roulette.dart';
import 'package:birddie/widgets/w_not_matched_roulette.dart';
import 'package:birddie/widgets/w_review_roulette.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

const upcomingFeatureSnackBar = SnackBar(
  content: Text('This feature is coming soon... Stay Tuned!'),
);

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: WAppBar(
            title: 'Dashboard',
            icon: Icons.menu,
            subData: false,
            onBackPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Upcoming Events',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 220,
                    child: Swiper(
                      itemCount: context.watch<Events>().eventsLength,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<Events>().setSelectedEvent(index);
                            navigate(context, const EventDetails());
                          },
                          child: context.watch<Events>().events[index],
                        );
                      },

                      viewportFraction: 0.8,
                      scale: 0.9,
                      // autoplay: true,
                    ),
                  ),
                ],
              ),
            ),
            //TODO: Show match review based on provider preference
            context.watch<RussianRoulletes>().matchState == 'matched'
                ? const MatchedRoulette()
                : context.watch<RussianRoulletes>().matchState == 'reviewing'
                    ? const ReviewRoulette()
                    : context.watch<RussianRoulletes>().matchState == 'declined'
                        ? const DeclinedRoulette()
                        : const NotMatchedRoulette()
          ],
        ),
      ),
    );
  }
}
