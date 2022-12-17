// ignore_for_file: unused_import

import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/dashboard/w_drawer.dart';
import 'package:birddie/widgets/dashboard/w_appbar.dart';
import 'package:birddie/widgets/dashboard/w_event_card.dart';
import 'package:birddie/widgets/dashboard/w_matched_roulette.dart';
import 'package:birddie/widgets/dashboard/w_not_matched_roulette.dart';
import 'package:birddie/widgets/dashboard/w_review_roulette.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
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

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    print(context.read<RussianRouletteProvider>().phoneNumber);
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: WAppBar(
            title: 'Dashboard',
            icon: Icons.menu,
            subData: false,
            onBackPressed: () {
              _key.currentState!.openDrawer();
            },
          ),
        ),
        drawer: const WDrawer(),
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
                            // selectedEvent = event[index];
                            // Provider.of<EventProviders>(context, listen: false)
                            //     .setSelected();

                            // navigate(context, const EventDetails());
                            context
                                .read<RussianRouletteProvider>()
                                .autoMatchRoulette(context);
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
            context.read<RussianRouletteProvider>().id == uninitializedId &&
                    (context.watch<RussianRouletteProvider>().inMatchedOne ==
                            "" &&
                        context.watch<RussianRouletteProvider>().inMatchedTwo ==
                            "")
                ? const NotMatchedRoulette()
                : context.read<RussianRouletteProvider>().id !=
                            uninitializedId &&
                        (context
                                    .watch<RussianRouletteProvider>()
                                    .inMatchedOne ==
                                "" &&
                            context
                                    .watch<RussianRouletteProvider>()
                                    .inMatchedTwo ==
                                "")
                    ? const ReviewRoulette()
                    : const MatchedRoulette(),
          ],
        ),
      ),
    );
  }
}
