import 'package:birddie/cloud_functions/phone_auth.dart';
import 'package:birddie/controllers/otp_verification_controllers.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_otp_input_field.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: Column(
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
                  context.watch<UserProvider>().phoneNumber.toString(),
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                WOtpField(
                  inputType: TextInputType.number,
                  validator: (val) {
                    if (val!.isNotEmpty && val.length < 6) {
                      return 'Enter valid OTP';
                    }
                    return null;
                  },
                  controller: otpController,
                  hintText: 'OTP Code',
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        });
                    if (_formKey.currentState!.validate()) {
                      verifyCode(
                        otpController.text.trim(),
                        context,
                      );
                    }
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              codeMessage,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      });
                    });
                  },
                  text: 'VERIFY',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
