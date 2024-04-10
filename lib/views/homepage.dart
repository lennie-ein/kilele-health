// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:kilele_health/main.dart';
// import 'package:pedometer/pedometer.dart';
//
// import '../constants.dart';
// import 'components/discover_card.dart';
// import 'components/radial_progress.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late String _status;
//   late String _steps;
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _status = '?';
//     _steps = '?';
//     initPlatformState();
//   }
//   void initPlatformState() {
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);
//
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);
//
//     if (!mounted) return;
//   }
//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }
//
//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }
//
//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }
//
//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }
//
//
//   Future getUsername() async{
//     FirebaseAuth auth = FirebaseAuth.instance;
//     String username = auth.currentUser!.displayName!;
//
//     return username;
//   }
//   String username = getUsername();
//   List cards = [
//     Card(
//       color: Colors.white,
//       elevation: 8,
//       shadowColor: KileleGrey,
//       shape: CircleBorder(side: BorderSide(color: KileleBrown)),
//       child: const Padding(
//         padding: EdgeInsets.all(20.0),
//         child: RadialProgress(
//           activity: 'RUNNING',
//           number: "12 kms",
//         ),
//       ),
//     ),
//     Card(
//       color: Colors.white,
//       elevation: 8,
//       shadowColor: KileleGrey,
//       shape: CircleBorder(side: BorderSide(color: KileleBrown)),
//       child: Padding(
//         padding:  EdgeInsets.all(20.0),
//         child: RadialProgress(
//           activity: 'steps',
//           number: "_steps",
//         ),
//       ),
//     ),
//     Card(
//       color: Colors.white,
//       elevation: 8,
//       shadowColor: KileleGrey,
//       shape: CircleBorder(side: BorderSide(color: KileleBrown)),
//       child: const Padding(
//         padding: EdgeInsets.all(20.0),
//         child: RadialProgress(
//           activity: 'water',
//           number: "1.2 L",
//         ),
//       ),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: KileleBrown,
//                     radius: 30,
//                     child: Icon(
//                       Icons.person,
//                       size: 45,
//                       color: KileleGrey,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     "Good Morning, $getUsername()",
//                     style: welcomeText,
//                   )
//                 ],
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.notifications,
//                     size: 30,
//                     color: KileleBlack,
//                   ))
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 300,
//                 child: Flex(direction: Axis.horizontal, children: [
//                   Flexible(
//                     child: CardSwiper(
//                       numberOfCardsDisplayed: 3,
//                       allowedSwipeDirection:
//                       AllowedSwipeDirection.only(right: true, left: true),
//                       cardsCount: cards.length,
//                       backCardOffset: Offset(40, 0),
//                       cardBuilder: (context, index, percentThresholdX,
//                           percentThresholdY) =>
//                       cards[index],
//                     ),
//                   ),
//                 ]),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 12.0, top: 16, bottom: 12),
//             child: Text(
//               "Discover",
//               style: headingText,
//             ),
//           ),
//           const SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 DiscoverCard(
//                   title: 'Hikes',
//                 ),
//                 DiscoverCard(
//                   title: 'Journals',
//                 ),
//                 DiscoverCard(
//                   title: 'Meet ups',
//                 ),
//                 DiscoverCard(
//                   title: 'Conferences',
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
