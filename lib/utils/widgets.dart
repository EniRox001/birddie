import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'images.dart';
import '../features/onboarding_signin.dart/view_model.dart/onboarding_view_model.dart';
import '../features/onboarding_signin.dart/screens/onboarding_screen.dart';

class WOnboardingScreen extends StatelessWidget {
  const WOnboardingScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    this.leftLogoPosition,
    this.topLogoPosition,
    this.rightLogoPosition,
    this.bottomLogoPosition,
  }) : super(key: key);

  final String image;
  final String title;
  final String text;
  final double? leftLogoPosition;
  final double? topLogoPosition;
  final double? rightLogoPosition;
  final double? bottomLogoPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
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
        Positioned(
          top: topLogoPosition,
          left: leftLogoPosition,
          right: rightLogoPosition,
          bottom: bottomLogoPosition,
          child: Image.asset(
            OnboardingImages.birddieLogo,
            scale: 8,
          ),
        ),
        Positioned(
          bottom: 110,
          left: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                text,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              IconButton(
                onPressed: () {
                  toNextPage(pageController);
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
