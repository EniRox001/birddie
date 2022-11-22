import 'package:birddie/controllers/onboarding_screen_controller.dart';
import 'package:birddie/screens/login_main.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/utils/images.dart';
import 'package:birddie/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void dispose() {
    pageController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          WOnboardingScreen(
            image: OnboardingImages.imageOne,
            title: 'Welcome Fam',
            text:
                'Say "hello" to a world of possibilities,\nlove, laughter and community',
            rightLogoPosition: 0.0,
            topLogoPosition: 100.0,
            onPressed: () {
              toNextPage(pageController);
            },
          ),
          WOnboardingScreen(
            image: OnboardingImages.imageTwo,
            title: 'Love & Friendship',
            text: 'Find love, companionship and\nfriendship in our community',
            rightLogoPosition: 60.0,
            topLogoPosition: 200.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginMain()));
            },
          ),
        ],
      ),
    );
  }
}
