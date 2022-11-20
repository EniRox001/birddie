import 'package:birddie/widgets/w_appbar.dart';
import 'package:flutter/material.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WAppBar(
              title: 'Dashboard',
              icon: Icons.menu,
              subData: false,
              onBackPressed: () {},
            ),
            const Text(
              'Upcoming Events',
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('OLD SCHOOL DANCE | Ikeja'),
                            Text(
                              'Come and relive those good times, hang with old friends and make new one hang with old friends and having...',
                            )
                          ],
                        ),
                        const Text('N3k')
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
