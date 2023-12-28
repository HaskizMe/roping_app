import 'package:flutter/material.dart';
import 'package:roping_event_app/events/event_manager.dart';
import 'package:roping_event_app/globals/global_variables.dart';
import '../custom_widgets/cards.dart';
import '../events/liked_events.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    // Get the list of favorited event IDs
    void checkList(){
      List<Event> favorited = GlobalData.allEvents.where((event) => event.isFavorited).toList();
      print("all events ${GlobalData.allEvents.length}");
      //testing
      for (var event in favorited) {
        print("${event.title} - favorited: ${event.isFavorited}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: FavoritedEvents(),

      // ElevatedButton(onPressed: () { checkList(); }, child: Text("test me"),

      //),
      // body: ListView.builder(
      //   itemCount: favoritedEvents.length,
      //   itemBuilder: (context, index) {
      //     //Event event = favoritedEvents[index];
      //
      //     return ListTile(
      //       title: Text(event.event),
      //       // Add more details if needed
      //     );
      //   },
      // ),
    );
  }
}
class FavoritedEvents extends StatelessWidget {
  final List<Event> favoriteEvents = GlobalData.allEvents.where((event) => event.isLiked()).toList(); // Filter favorite events
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteEvents.length,
      itemBuilder: (context, index) {
        return EventCard(
          color: Colors.blue, // Customize the color as needed
          date: favoriteEvents[index].getDate(),
          event: favoriteEvents[index].getTitle(),
          location: favoriteEvents[index].getLocation(),
          publisher: favoriteEvents[index].getPublisher(),
          height: 150, // Customize the height as needed
          id: favoriteEvents[index].getId(),
          image: favoriteEvents[index].getImage(),
        );
      },
    );
  }
}
