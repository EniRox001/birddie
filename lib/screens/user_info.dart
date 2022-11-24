import 'package:birddie/controllers/user_info_controllers.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/gender_dob.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  void dispose() {
    firstNameController;
    lastNameController;
    occupationController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              OnboardingImages.imageFive,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x40EB1212),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: Image.asset(
              OnboardingImages.birddieLogo,
              scale: 8,
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WInputField(
                    controller: firstNameController, hintText: 'FIRST NAME'),
                const SizedBox(
                  height: 10.0,
                ),
                WInputField(
                    controller: lastNameController, hintText: 'LAST NAME'),
                const SizedBox(
                  height: 10.0,
                ),
                WInputField(
                    controller: occupationController, hintText: 'OCCUPATION'),
                const SizedBox(
                  height: 80.0,
                ),
                WElevatedButton(
                    onPressed: () {
                      context
                          .read<User>()
                          .setFirstName(firstNameController.text.toLowerCase());
                      context
                          .read<User>()
                          .setLastName(lastNameController.text.toLowerCase());
                      context.read<User>().setOccupation(
                          occupationController.text.toLowerCase());
                      navigate(context, const GenderDOB());
                    },
                    text: 'NEXT'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
