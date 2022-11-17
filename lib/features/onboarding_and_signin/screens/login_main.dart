import 'package:birddie/features/onboarding_and_signin/screens/otp_verification.dart';
import 'package:birddie/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/utils/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                OnboardingImages.birddieLogo,
                scale: 8,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter your Phone Number',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              WPhoneInputField(controller: phoneNumberController),
              WElevatedButton(
                onPressed: () {
                  navigate(context, const OtpVerification());
                },
                text: 'NEXT',
              )
            ],
          )
        ],
      ),
    ));
  }
}