import 'package:flutter/material.dart';
import 'package:birddie/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'w_elevated_button.dart';
import 'w_phone_inputfield.dart';

class WOnboardingSignUp extends StatelessWidget {
  const WOnboardingSignUp(
      {super.key, required this.controller, required this.onPressed});

  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            OnboardingImages.imageThree,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  OnboardingImages.birddieLogo,
                  scale: 8,
                ),
                Text(
                  'Enter your Phone Number',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0,
                  ),
                ),
                WPhoneInputField(controller: controller),
                WElevatedButton(
                  onPressed: onPressed,
                  text: 'NEXT',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
