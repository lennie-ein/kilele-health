import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kilele_health/constants.dart';
import 'package:kilele_health/gen/assets.gen.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import 'components/activity_card.dart';

class MySpace extends HookWidget {
  const MySpace({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay = DateTime.now();
    print(_selectedDay);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: WeeklyDatePicker(
                  selectedDay: _selectedDay,
                  changeDay: (value) {},
                  enableWeeknumberText: false,
                  backgroundColor: KileleBrown,
                  weekdayTextColor: KileleJet,
                  digitsColor: KileleJet,
                  selectedDigitBackgroundColor: KileleBlack,
                  weekdays: const ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
                  daysInWeek: 7,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityCard(
                    image: Assets.calories.image(),
                    title: 'Calories',
                  ),
                  ActivityCard(
                    image: Assets.running.image(),
                    title: 'Running',
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityCard(
                    image: Assets.hiking.image(),
                    title: 'Hiking',
                  ),
                  ActivityCard(
                    image: Assets.diet.image(),
                    title: 'Diet',
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityCard(
                    image: Assets.drinking.image(scale: 1.2),
                    title: 'Hydration',
                  ),
                  ActivityCard(
                    image: Assets.mentalHealth.image(),
                    title: 'Mental Health',
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
