import 'package:birddie/controllers/otp_verification_controllers.dart';
import 'package:birddie/screens/user_info.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:birddie/providers/user_provider.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  void dispose() {
    otpController;
    super.dispose();
  }

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
                '+234${context.watch<User>().phoneNumber}',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              WInputField(
                controller: otpController,
                hintText: 'OTP Code',
              ),
              TextButton(
                onPressed: () {
                  //TODO: Resend OTP to user
                },
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
                  //TODO: Verify OTP
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
