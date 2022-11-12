import 'package:birddie/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:birddie/utils/widgets.dart';

PageController pageController = PageController();

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
