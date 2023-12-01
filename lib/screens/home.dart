import 'dart:html';
import '/events/event_manager.dart';

import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';

import '../globals/global_variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: EventList(), // Display the list of event cards

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.fromLTRB(10.0, 50, 10.0, 0),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Padding(
      //                 padding: EdgeInsets.all(15.0),
      //                 child: Text(
      //                     "FEATURED EVENTS",
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                   ),
      //                 )
      //             )
      //           ],
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 16 at 12 PM",
      //           event: "Coleman #11 Roping",
      //           location: "Bullard, TX",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           id: 1,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 17 at 12 PM",
      //           event: "#15 roping",
      //           location: "Kanab, UT",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/roping_flyer_1.png",
      //           ),
      //           id: 2,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 18 at 12 PM",
      //           event: "Walker #11 Roping",
      //           location: "Orem, TX",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/roping_flyer_2.png",
      //             //width: 100,
      //             //height: 140,
      //           ),
      //           id: 3,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 19 at 12 PM",
      //           event: "Hiserman #11 Roping",
      //           location: "Provo, UT",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/roping_flyer_3.png",
      //             //width: 100,
      //             //height: 140,
      //           ),
      //           id: 4,
      //         ),
      //         Row(
      //           children: [
      //             Padding(
      //                 padding: EdgeInsets.all(15.0),
      //                 child: Text(
      //                   "EVENTS NEAR ME",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold
      //                   ),
      //                 )
      //             )
      //           ],
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 20 at 12 PM",
      //           event: "Huff #11 Roping",
      //           location: "St. George, UT",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/roping_flyer_4.png",
      //             //width: 100,
      //             //height: 140,
      //           ),
      //           id: 5,
      //         ),
      //
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 21 at 12 PM",
      //           event: "Hendricks #11 Roping",
      //           location: "Logan, UT",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/big_roping_flyer_4.png",
      //             //width: 100,
      //             //height: 140,
      //           ),
      //           id: 6,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 22 at 12 PM",
      //           event: "Toone #11 Roping",
      //           location: "Grace, ID",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/big_roping_flyer_4.png",
      //             //width: 100,
      //             //height: 140,
      //           ),
      //           id: 7,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 23 at 12 PM",
      //           event: "Dutton #11 Roping",
      //           location: "Bozeman, MT",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           image: AssetImage(
      //             "lib/assets/images/big_roping_flyer_4.png",
      //           ),
      //           id: 8,
      //         ),
      //         EventCard(
      //           color: Colors.yellow,
      //           date: "Tuesday, December 25 at 12 PM",
      //           event: "HOHOHO #11 Roping",
      //           location: "North Pole, TX",
      //           publisher: "Bailey Haskell",
      //           height: 150.0,
      //           id: 9,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}


class EventList extends StatelessWidget {
  final List<Event> events = GlobalData.allEvents;

  EventList({super.key}); // Your list of events

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventCard(
          color: Colors.blue, // Customize the color as needed
          date: events[index].getDate(),
          event: events[index].getTitle(),
          location: events[index].getLocation(),
          publisher: events[index].getPublisher(),
          height: 150, // Customize the height as needed
          id: events[index].getId(),
          image: events[index].getImage(),
        );
      },
    );
  }
}
