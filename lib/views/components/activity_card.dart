import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants.dart';
import '../../gen/assets.gen.dart';

class ActivityCard extends HookWidget {
  const ActivityCard({super.key, required this.image, required this.title});

  final Widget image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: contentHeaders,
            ),
          )
        ],
      ),
    );
  }
}
