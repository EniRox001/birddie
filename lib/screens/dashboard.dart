import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/screens/event_details.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_declined_roulette.dart';
import 'package:birddie/widgets/w_event_card.dart';
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
  void initState() {
    super.initState();
  }

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
                      itemCount: event.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedEvent = event[index];
                            Provider.of<EventProviders>(context, listen: false)
                                .setSelected();

                            navigate(context, const EventDetails());
                          },
                          child: WEventCard(
                            backgroundColor: Colors.red,
                            onAttendeePressed: () {},
                            location: event[index]['location'],
                            price: event[index]['price'],
                            title: event[index]['title'],
                            description: event[index]['description'],
                            slotsLeft: event[index]['slot_left'],
                            date: event[index]['date'],
                            time: event[index]['time'],
                          ),
                        );
                      },
                      viewportFraction: 0.8,
                      scale: 0.9,
                      autoplay: false,
                    ),
                  )
                ],
              ),
            ),
            //TODO: Show match review based on provider preference
            context.watch<RussianRouletteProvider>().matchState == 'matched'
                ? const MatchedRoulette()
                : context.watch<RussianRouletteProvider>().matchState ==
                        'reviewing'
                    ? const ReviewRoulette()
                    : context.watch<RussianRouletteProvider>().matchState ==
                            'declined'
                        ? const DeclinedRoulette()
                        : const NotMatchedRoulette()
          ],
        ),
      ),
    );
  }
}
