import 'package:birddie/screens/profile.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderDOB extends StatefulWidget {
  const GenderDOB({super.key});

  @override
  State<GenderDOB> createState() => _GenderDOBState();
}

class _GenderDOBState extends State<GenderDOB> {
  TextEditingController dateOfBirthController = TextEditingController();
  int selectedOption = 1;
  bool termsAndConditions = false;
  bool promotionPremission = false;

  void setSelectedOption(int i) {
    setState(() {
      selectedOption = i;
    });
  }

  @override
  void dispose() {
    dateOfBirthController;

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
                              color: selectedOption == 1
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                5000,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: selectedOption == 1 ? 50.0 : 20.0,
                              ),
                              child: Text(
                                'MALE',
                                style: GoogleFonts.lato(
                                  color: selectedOption == 1
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
                              color: selectedOption == 2
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                5000,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: selectedOption == 2 ? 50.0 : 20.0,
                              ),
                              child: Text(
                                'FEMALE',
                                style: GoogleFonts.lato(
                                  color: selectedOption == 2
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
                WInputField(
                    controller: dateOfBirthController,
                    hintText: 'DATE OF BIRTH'),
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

class WRememberMe extends StatelessWidget {
  const WRememberMe({
    Key? key,
    required this.isChecked,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final String text;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          checkColor: Colors.white,
          activeColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
