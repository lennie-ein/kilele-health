import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kilele_health/constants.dart';
import 'package:kilele_health/views/components/radial_progress.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:pedometer/pedometer.dart';

import '../gen/assets.gen.dart';
import 'components/discover_card.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
var username = useState('');
var status = useState('DORMANT');
var stepCount = useState(0);
final distanceInMeters = useState<double>(0.0);

    Future getUsername() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      username.value = auth.currentUser!.displayName!;
    }


useEffect(() {
  getUsername();
  Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
  StreamSubscription<StepCount> stepSubscription;
  Stream<PedestrianStatus> pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  StreamSubscription<PedestrianStatus> pedestrianStatusSubscription;

  stepSubscription = stepCountStream.listen((event) {
    stepCount.value = event.steps;
    distanceInMeters.value = stepCount.value * 0.7;
  });
  pedestrianStatusSubscription = pedestrianStatusStream.listen((event) {
    status.value = event.status;
  });

  return () {
    stepSubscription.cancel();
    pedestrianStatusSubscription.cancel();
  };
}, []);

var completedGoal = useState(stepCount.value/5000);
    List cards = [
      Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: KileleGrey,
        shape: CircleBorder(side: BorderSide(color: KileleBrown)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: RadialProgress(
            activity: status.value,
            number: "${distanceInMeters.value.toStringAsFixed(2)} m", goalCompleted: 0.5,
          ),
        ),
      ),
      Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: KileleGrey,
        shape: CircleBorder(side: BorderSide(color: KileleBrown)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: RadialProgress(
            activity: 'steps',
            number: "${stepCount.value}", goalCompleted: completedGoal.value,
          ),
        ),
      ),
      Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: KileleGrey,
        shape: CircleBorder(side: BorderSide(color: KileleBrown)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: RadialProgress(
            activity: 'water',
            number: "1.2 L", goalCompleted: 0.6,
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: KileleBrown,
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: KileleGrey,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Good Morning, ${username.value}",
                    style: welcomeText,
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                    color: KileleBlack,
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Flex(direction: Axis.horizontal, children: [
                  Flexible(
                    child: CardSwiper(
                      numberOfCardsDisplayed: 3,
                      allowedSwipeDirection:
                          AllowedSwipeDirection.only(right: true, left: true),
                      cardsCount: cards.length,
                      backCardOffset: Offset(40, 0),
                      cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) =>
                          cards[index],
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 16, bottom: 12),
            child: Text(
              "Discover",
              style: headingText,
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DiscoverCard(
                  title: 'Hikes',
                ),
                DiscoverCard(
                  title: 'Journals',
                ),
                DiscoverCard(
                  title: 'Meet ups',
                ),
                DiscoverCard(
                  title: 'Conferences',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
