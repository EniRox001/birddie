import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/onboarding_screen.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/images.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await connectDB();
  await getEvents();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventProviders()),
        ChangeNotifierProvider(create: (_) => RussianRouletteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birddie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EasySplashScreen(
        showLoader: false,
        logo: Image.asset(
          OnboardingImages.birddieLogo,
        ),
        title: const Text(
          "Birddie",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.mainWhiteColor,
          ),
        ),
        backgroundColor: CustomColors.mainRedColor,
        navigator: const OnboardingScreen(),
        durationInSeconds: 5,
      ),
    );
  }
}
