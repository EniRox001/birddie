import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'images.dart';
import '../features/onboarding_signin.dart/view_model.dart/onboarding_view_model.dart';
import '../features/onboarding_signin.dart/screens/onboarding_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class WOnboardingScreen extends StatelessWidget {
  const WOnboardingScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    this.leftLogoPosition,
    this.topLogoPosition,
    this.rightLogoPosition,
    this.bottomLogoPosition,
  }) : super(key: key);

  final String image;
  final String title;
  final String text;
  final double? leftLogoPosition;
  final double? topLogoPosition;
  final double? rightLogoPosition;
  final double? bottomLogoPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
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
        Positioned(
          top: topLogoPosition,
          left: leftLogoPosition,
          right: rightLogoPosition,
          bottom: bottomLogoPosition,
          child: Image.asset(
            OnboardingImages.birddieLogo,
            scale: 8,
          ),
        ),
        Positioned(
          bottom: 110,
          left: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                text,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              IconButton(
                onPressed: () {
                  toNextPage(pageController);
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

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

class WPhoneInputField extends StatelessWidget {
  const WPhoneInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      height: 70.0,
      child: IntlPhoneField(
        controller: controller,
        dropdownIconPosition: IconPosition.trailing,
        showDropdownIcon: false,
        showCountryFlag: false,
        decoration: InputDecoration(
          isDense: false,
          filled: true,
          fillColor: Colors.white,
          hintText: "PHONE NUMBER",
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
          ),
        ),
        initialCountryCode: 'NG',
        onChanged: (phone) {},
      ),
    );
  }
}

class WElevatedButton extends StatelessWidget {
  const WElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xFFFF5454,
          ),
          shape: const StadiumBorder()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
        child: Text(text),
      ),
    );
  }
}
