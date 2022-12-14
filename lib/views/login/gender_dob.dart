import 'package:birddie/controllers/login/gender_dob_controllers.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/views/login/profile.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/common/w_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:birddie/widgets/login/w_gender_dob.dart';
import 'package:provider/provider.dart';

String dateOfBirth = '';

class GenderDOB extends StatefulWidget {
  const GenderDOB({super.key});

  @override
  State<GenderDOB> createState() => _GenderDOBState();
}

class _GenderDOBState extends State<GenderDOB> {
  void setSelectedOption(int i) {
    setState(() {
      selectedGender = i;
    });
  }

  @override
  void dispose() {
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
              OnboardingImages.imageSix,
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
            left: 50,
            child: Image.asset(
              OnboardingImages.birddieLogo,
              scale: 8,
            ),
          ),
          Positioned(
            bottom: 50,
            child: Column(
              children: [
                Text(
                  'I am',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 26.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      5000,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setSelectedOption(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedGender == 1
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                5000,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: selectedGender == 1 ? 50.0 : 20.0,
                              ),
                              child: Text(
                                'MALE',
                                style: GoogleFonts.lato(
                                  color: selectedGender == 1
                                      ? Colors.amber
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setSelectedOption(2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedGender == 2
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                5000,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: selectedGender == 2 ? 50.0 : 20.0,
                              ),
                              child: Text(
                                'FEMALE',
                                style: GoogleFonts.lato(
                                  color: selectedGender == 2
                                      ? Colors.amber
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () async {
                    await selectBirthDate(context);
                    // ignore: use_build_context_synchronously
                    context.read<UserProvider>().setDateOfBirth(dateOfBirth);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainWhiteColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 13.0,
                      ),
                      child: context.watch<UserProvider>().gender == ''
                          ? Text(
                              'DATE OF BIRTH',
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.start,
                            )
                          : Text(
                              context.watch<UserProvider>().dateOfBirth,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.start,
                            ),
                    ),
                  ),
                ),
                WRememberMe(
                  isChecked: termsAndConditions,
                  text: 'I Accept The Terms & Conditions',
                  onChanged: (bool? value) {
                    setState(() {
                      termsAndConditions = value!;
                    });
                  },
                ),
                WRememberMe(
                  isChecked: promotionPremission,
                  text:
                      'I give Birddie permision to use my images for any birddie related promotions or content.',
                  onChanged: (bool? value) {
                    setState(() {
                      promotionPremission = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 80.0,
                ),
                WElevatedButton(
                    onPressed: () {
                      context.read<UserProvider>().setGender(selectedGender);
                      navigate(context, const Profile());
                    },
                    text: 'SIGNUP')
              ],
            ),
          )
        ],
      ),
    );
  }
}
