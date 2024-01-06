import 'package:flutter/material.dart';
import 'package:roping_event_app/events/event_manager.dart';
import 'package:roping_event_app/globals/global_variables.dart';
import '../custom_widgets/cards.dart';
import '../events/liked_events.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
    final List<Event> favoriteEvents = GlobalData.allEvents.where((event) => event.isLiked()).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
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
            onFavoritePressed: () {
              setState(() {
                favoriteEvents[index].isFavorited = !favoriteEvents[index].isFavorited;
              });
            },
          );
        },
      )
    );
  }
}
