import 'package:birddie/controllers/profile_controllers.dart';
import 'package:birddie/screens/dashboard.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_profile_media_widget.dart';
import 'package:birddie/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void dispose() {
    occupationController;
    locationController;
    purposeController;
    alcoholController;
    smokeController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: WAppBar(
            title: 'Profile',
            subData: true,
            onBackPressed: () {
              navigateBack(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Text(
                  'QUESTION',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xFFFF5454),
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text('What is you ultimate goal in life?',
                    style: Theme.of(context).textTheme.bodyLarge),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(
                        0x80FF5454,
                      ),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'Answer the question above in a 60 seconds video and upload below',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.black54,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Video size: 100MB MAX & Picture size: 10MB MAX',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: const Color(0xFFFF5454),
                                    ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    WProfileMediaWidget(
                      onPressed: () {},
                      flex: 2,
                      text: 'ADD VIDEO',
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    WProfileMediaWidget(
                      onPressed: () {},
                      flex: 1,
                      text: 'ADD A PROFILE PICTURE',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ABOUT',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  WTextField(
                    controller: occupationController,
                    hintText: 'Occupation',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WTextField(
                    controller: locationController,
                    hintText: 'My Location',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WTextField(
                    controller: purposeController,
                    hintText: 'I am looking for',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'SOCIAL HABITS',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  WTextField(
                    controller: alcoholController,
                    hintText: 'Drink Alcohol?',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WTextField(
                    controller: smokeController,
                    hintText: 'Smoke?',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            WElevatedButton(
              onPressed: () {
                navigate(context, const Dashboard());
              },
              text: 'SAVE',
            ),
          ],
        ),
      ),
    );
  }
}
