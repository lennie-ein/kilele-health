import 'package:flutter/material.dart';
import 'package:flutter_intro_screen/flutter_intro_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kilele_health/constants.dart';

import '../gen/assets.gen.dart';
import '../views/dashboard.dart';
import 'login_screen.dart';

class DescriptionScreens extends StatefulWidget {
  const DescriptionScreens({Key? key}) : super(key: key);

  @override
  State<DescriptionScreens> createState() => _DescriptionScreensState();
}

class _DescriptionScreensState extends State<DescriptionScreens> {
  List<IntroPageData> _buildPageData() {
    return <IntroPageData>[
      IntroPageData(
        title: Text(
          "Lorem Ipsum",
        ),
        description: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum, ipsum nec ultricies blandit, libero sapien ultricies mauris, sed ultrices ex sapien vitae lacus. ",
          textAlign: TextAlign.center,
        ),
        image: Assets.backpackersAnimateJpg.image(),
      ),
      IntroPageData(
        title: Text(
          "Lorem Ipsum",
          // style: splashTitle,
        ),
        description: Text(
          "Phasellus vel metus non justo eleifend malesuada. Ut nec nunc eget sem commodo pulvinar. Vivamus nec massa nec purus lacinia tempus. Integer at ex id justo eleifend convallis.",
          textAlign: TextAlign.center,
          // style: splashBody,
        ),
        image: Assets.mentalHealthAnimateJpg.image(),
      ),
      IntroPageData(
        title: Text(
          "Lorem Ipsum",
          // style: splashTitle,
          textAlign: TextAlign.center,
        ),
        description: Text(
          "Sed sed justo sed nisi mattis convallis. Sed tincidunt leo id odio scelerisque, a vehicula nunc pulvinar.",
          textAlign: TextAlign.center,
          // style: splashBody,
        ),
        image: Assets.orphanageAnimateJpg.image(),
      ),
    ];
  }

  Widget _buildAppLogo() {
    return const Text(
      "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterIntroScreen(
          colors: IntroColors(
              background: Colors.white,
              text: Colors.black,
              button: KileleBrown),
          appLogo: _buildAppLogo(),
          centerWidget: Text("Swipe left", style: textButtonStyle,),
          pageData: _buildPageData(),
          onCompletePressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }),
    );
  }
}
