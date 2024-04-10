import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kilele_health/onboardingScreens/description_screens.dart';

import '../gen/assets.gen.dart';
import '../views/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _beatController;
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    _beatController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _beatController.forward();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = ColorTween(begin: Color(0x7FCDA123), end: Color(0xFFCDA123))
        .animate(controller);
    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      {}
    });

    controller.addListener(() {
      setState(() {});
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DescriptionScreens()));
    });
  }

  @override
  void dispose() {
    _beatController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height / 5,
              child: FadeTransition(
                opacity: CurvedAnimation(
                    parent: _beatController, curve: Curves.easeInOut),
                child: Assets.kileleHealthLogo.image(scale: 2.5),
              )),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.width * 2,
              decoration: ShapeDecoration(
                color: animation.value,
                shape: const OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
