import 'package:birddie/features/onboarding_signin.dart/view_model.dart/onboarding_view_model.dart';
import 'package:birddie/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:birddie/utils/widgets.dart';

PageController pageController = PageController();

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          const WOnboardingScreen(
            image: OnboardingImages.imageOne,
            title: 'Welcome Fam',
            text:
                'Say "hello" to a world of possibilities,\nlove, laughter and community',
            rightLogoPosition: 0.0,
            topLogoPosition: 100.0,
          ),
          const WOnboardingScreen(
            image: OnboardingImages.imageTwo,
            title: 'Love & Friendship',
            text: 'Find love, companionship and\nfriendship in our community',
            rightLogoPosition: 60.0,
            topLogoPosition: 200.0,
          ),
          WOnboardingSignUp(
            controller: phoneNumberController,
            onPressed: () {
              // print(phoneNumberController.text);
              toNextPage(pageController);
            },
          ),
          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
