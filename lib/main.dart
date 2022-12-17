import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/cloud_functions/shared_prefernces.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/login_main.dart';
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
  await initSharedPref();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Widget> checkPrefs() async {
    if (firstTime == null && loggedInNum == null) {
      return Future.value(const OnboardingScreen());
    } else {
      return await autoLogin(context, loggedInNum);
    }
  }

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
        futureNavigator: checkPrefs(),
        durationInSeconds: 5,
      ),
    );
  }
}
