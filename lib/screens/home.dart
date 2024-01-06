import '../events/liked_events.dart';
import '/events/event_manager.dart';

import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';

import '../globals/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final List<Event> events = GlobalData.allEvents.where((event) => !event.isLiked()).toList();
    final List<Event> events = GlobalData.allEvents;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
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
            onFavoritePressed: () {
              setState(() {
                events[index].isFavorited = !events[index].isFavorited;
              });
            },
          );
        },
      )
      // EventList(), // Display the list of event cards

    );
  }
}
