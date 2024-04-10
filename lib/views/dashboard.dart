import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kilele_health/views/profile_page.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants.dart';
import 'home_page.dart';
import 'homepage.dart';
import 'my_space.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = useState(0);
    List<Widget> widgets = [
      const HomePage(),
      const MySpace(),
      Container(
        height: 70,
        width: 60,
        color: Colors.pink,
      ),
      ProfilePage()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.white.withOpacity(0.4),
        elevation: 0,
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizotnal,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: Icon(
              Icons.home,
              color: KileleBrown,
            ),
            title: const Text('Home'),
            selectedColor: KileleBrown,
            backgroundColor: KileleBrown,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.line_axis,
              color: KileleBrown,
            ),
            title: const Text('Goals'),
            selectedColor: KileleBrown,
            backgroundColor: KileleBrown,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.messenger,
              color: KileleBrown,
            ),
            title: const Text('Chats'),
            selectedColor: KileleBrown,
            backgroundColor: KileleBrown,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.person,
              color: KileleBrown,
            ),
            title: const Text('Profile'),
            selectedColor: KileleBrown,
            backgroundColor: KileleBrown,
          ),
        ],
        // fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: currentPage.value,
        onTap: (index) {
          currentPage.value = index;
        },
      ),
      body: SafeArea(child: widgets[currentPage.value]),
    );
  }
}
