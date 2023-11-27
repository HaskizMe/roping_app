import 'package:flutter/material.dart';
import 'package:roping_event_app/events/all_events.dart';
import '../custom_widgets/cards.dart';
import '../events/liked_events.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the list of favorited event IDs
    List<int> favoritedEventIds = FavoriteEventManager.favoriteEventIds;

    print("all events ${EventManager.allEvents.length}");
    // Filter the list of all events based on favorited event IDs
    List<Event> favoritedEvents = EventManager.allEvents.where((event) => favoritedEventIds.contains(event.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritedEvents.length,
        itemBuilder: (context, index) {
          Event event = favoritedEvents[index];

          return ListTile(
            title: Text(event.event),
            // Add more details if needed
          );
        },
      ),
    );
  }
}
