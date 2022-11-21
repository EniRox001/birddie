import 'package:birddie/widgets/w_appbar.dart';
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
            const Text(
              'Upcoming Events',
            ),
            SizedBox(
              height: 185,
              child: Swiper(
                itemCount: context.watch<Events>().eventsLength,
                itemBuilder: (BuildContext context, int index) =>
                    context.watch<Events>().events[index],
                viewportFraction: 0.8,
                scale: 0.9,
                // autoplay: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
