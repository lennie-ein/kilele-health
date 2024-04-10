import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants.dart';
import 'firebase_options.dart';
import 'onboardingScreens/splash_screen.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kilele Health',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KileleBrown),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

