import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants.dart';
import '../../gen/assets.gen.dart';

class DiscoverCard extends HookWidget {
  const DiscoverCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shadowColor: Colors.grey,
          elevation: 4,
          color: KileleBrown,
          child: SizedBox(
            height: 80,
            width: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Assets.rectangle7.image(fit: BoxFit.fill)),
          ),
        ),
        Text(title)
      ],
    );
  }
}
