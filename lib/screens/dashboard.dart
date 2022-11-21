import 'package:birddie/screens/event_details.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

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
          mainAxisSize: MainAxisSize.max,
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
            const Text(
              'Please choose below',
            ),
            WElevatedButton(
              onPressed: () {},
              text: 'Russian Roulette',
              outlined: true,
            ),
            WElevatedButton(
              onPressed: () {},
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
              onPressed: () {},
              text: 'Match Metrix',
              outlined: true,
            )
          ],
        ),
      ),
    );
  }
}
