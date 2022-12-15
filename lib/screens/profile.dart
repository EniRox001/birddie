import 'package:birddie/cloud_functions/cloudinary_functions.dart';
import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/cloud_functions/shared_prefernces.dart';
import 'package:birddie/controllers/profile_controllers.dart';
import 'package:birddie/controllers/user_info_controllers.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/dashboard.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_profile_media_widget.dart';
import 'package:birddie/widgets/w_profile_media_widget_video.dart';
import 'package:birddie/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  var selectedAlcoholValue = 'no';
  var selectedSmokeValue = 'no';
  var items = ['yes', 'no'];

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
        body: ListView(
          padding: const EdgeInsets.all(15.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WProfileMediaWidgetVideo(
                    onPressed: () {
                      setProfilePicture(context);
                    },
                    text: 'ADD A PROFILE PICTURE',
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  WProfileMediaWidget(
                    onPressed: () {
                      setProfileVideo(context);
                    },
                    text: 'ADD VIDEO',
                  ),
                ],
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
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Column(
                children: [
                  WTextField(
                    controller: occupationController,
                    hintText: context.read<UserProvider>().occupation,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  WTextField(
                    controller: locationController,
                    hintText: 'My Location',
                  ),
                  const SizedBox(
                    height: 20.0,
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
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Column(
                children: [
                  WDropDownWidget(
                    labelText: 'Drink Alcohol?',
                    selectedValue: selectedSmokeValue,
                    items: items,
                    onChanged: (String? value) {
                      setState(() {
                        selectedSmokeValue = value!;
                      });
                      context.read<UserProvider>().setDrinkAlcohol(value!);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  WDropDownWidget(
                    labelText: 'Smoke?',
                    selectedValue: selectedAlcoholValue,
                    items: items,
                    onChanged: (String? value) {
                      setState(() {
                        selectedAlcoholValue = value!;
                      });
                      context.read<UserProvider>().setSmoke(value!);
                    },
                  ),
                ],
              ),
            ),
            WElevatedButton(
              onPressed: () async {
                context
                    .read<UserProvider>()
                    .setProfileVideo('profileVideoLink');
                context
                    .read<UserProvider>()
                    .setProfilePicture('profilePictureLink');
                context
                    .read<UserProvider>()
                    .setOccupation(occupationController.text.toLowerCase());
                context
                    .read<UserProvider>()
                    .setLocation(locationController.text.toLowerCase());
                context
                    .read<UserProvider>()
                    .setLookingFor(purposeController.text.toLowerCase());

                await createUser(context).then((value) {
                  setFirstTime(false, context.read<UserProvider>().phoneNumber);
                  navigate(context, const Dashboard());
                });
              },
              text: 'SAVE',
            ),
          ],
        ),
      ),
    );
  }
}

class WDropDownWidget extends StatelessWidget {
  const WDropDownWidget({
    Key? key,
    required this.labelText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final String selectedValue;
  final List<String> items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),

          // labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          labelText: labelText,
        ),
        value: selectedValue,
        isExpanded: true,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: onChanged);
  }
}
