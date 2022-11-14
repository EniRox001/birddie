import 'package:birddie/features/onboarding_signin.dart/screens/user_info.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            OnboardingImages.imageFour,
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
            children: [
              Image.asset(
                OnboardingImages.birddieLogo,
                scale: 8,
              ),
              Text(
                'Enter Code Sent To',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '08108080358',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.25,
                height: 50.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: false,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "OTP Code",
                    hintStyle: const TextStyle(
                      fontSize: 14.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1000.0),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend OTP',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
              WElevatedButton(
                onPressed: () {
                  navigate(context, const UserInfo());
                },
                text: 'VERIFY',
              ),
            ],
          )
        ],
      ),
    );
  }
}
