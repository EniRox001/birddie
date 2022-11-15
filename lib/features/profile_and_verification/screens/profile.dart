import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final occupationController = TextEditingController();
  final locationController = TextEditingController();
  final purposeController = TextEditingController();
  final alcoholController = TextEditingController();
  final smokeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WAppBar(
              title: 'Profile',
              subData: true,
              onBackPressed: () {
                navigateBack(context);
              },
            ),
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
                      controller: locationController, hintText: 'My Location'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WTextField(
                      controller: purposeController,
                      hintText: 'I am looking for'),
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
              onPressed: () {},
              text: 'SAVE',
            ),
          ],
        ),
      ),
    );
  }
}

class WTextField extends StatelessWidget {
  const WTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        // labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
}

class WProfileMediaWidget extends StatelessWidget {
  const WProfileMediaWidget({
    Key? key,
    required this.onPressed,
    required this.flex,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final int flex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFF5454), width: 2.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 50.0,
                color: Colors.grey,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xFFFF5454),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WRowWidget extends StatelessWidget {
  const WRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          height: 150.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                0xFFFF5454,
              ),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              children: [
                const Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.grey,
                ),
                Text(
                  'ADD VIDEO',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: const Color(0xFFFF5454),
                      ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.0,
          height: 150.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                0xFFFF5454,
              ),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              children: [
                const Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.grey,
                ),
                Text(
                  'ADD A PROFILE PICTURE',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xFFFF5454),
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
