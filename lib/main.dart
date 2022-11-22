import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/login_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginSignUp()),
        ChangeNotifierProvider(create: (_) => Events()),
        ChangeNotifierProvider(create: (_) => RussianRoulletes()),
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
      home: const Dashboard(),
    );
  }
}
