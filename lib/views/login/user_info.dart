import 'package:birddie/controllers/login/user_info_controllers.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/views/gender_dob.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/common/w_elevated_button.dart';
import 'package:birddie/widgets/common/w_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserInfo extends StatefulWidget {
  const AddUserInfo({super.key});

  @override
  State<AddUserInfo> createState() => _AddUserInfoState();
}

class _AddUserInfoState extends State<AddUserInfo> {
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WInputField(
                      validator: (val) {
                        if (val!.isEmpty && val.length < 2) {
                          return 'Enter valid first name';
                        }
                        return null;
                      },
                      controller: firstNameController,
                      hintText: 'FIRST NAME'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WInputField(
                      validator: (val) {
                        if (val!.isEmpty && val.length < 2) {
                          return 'Enter valid last name';
                        }
                        return null;
                      },
                      controller: lastNameController,
                      hintText: 'LAST NAME'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  WInputField(
                      validator: (val) {
                        if (val!.isEmpty && val.length < 2) {
                          return 'Enter valid occupation';
                        }
                        return null;
                      },
                      controller: occupationController,
                      hintText: 'OCCUPATION'),
                  const SizedBox(
                    height: 80.0,
                  ),
                  WElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserProvider>().setFirstName(
                              firstNameController.text.toLowerCase());
                          context.read<UserProvider>().setLastName(
                              lastNameController.text.toLowerCase());
                          context.read<UserProvider>().setOccupation(
                              occupationController.text.toLowerCase());
                          navigate(context, const GenderDOB());
                        }
                      },
                      text: 'NEXT'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
