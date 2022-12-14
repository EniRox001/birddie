import 'package:birddie/controllers/login_main_controllers.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/otp_verification.dart';

import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_phone_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:birddie/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final _formKey = GlobalKey<FormState>();
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
          Form(
            key: _formKey,
            child: Column(
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
                    // ignore: todo
                    //TODO: Send otp to phone number
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<UserProvider>()
                          .setPhoneNumber(phoneNumberController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpVerification(),
                          ));
                      // verifyNumber(
                      //   context.read<UserProvider>().phoneNumber.trim(),
                      //   context,
                      // );
                    }
                  },
                  text: 'NEXT',
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
