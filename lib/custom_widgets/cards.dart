import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:roping_event_app/events/event_manager.dart';
import 'package:roping_event_app/main.dart';
import 'package:roping_event_app/screens/favorites.dart';
import 'package:roping_event_app/screens/home.dart';
import 'package:roping_event_app/screens/search.dart';
import 'package:roping_event_app/events/liked_events.dart';

class EventCard extends StatefulWidget {
  final Color color;
  final String date;
  final String event;
  final String location;
  final String publisher;
  final double height;
  final int id;
  final AssetImage image;
  const EventCard({Key? key,
    required this.color,
    required this.date,
    required this.event,
    required this.location,
    required this.publisher,
    required this.height,
    this.image = const AssetImage("lib/assets/images/Professional Pic of me(1).jpeg",),
    required this.id
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    // Set the initial favorite state based on the global manager
    isFavorite = FavoriteEventManager.isEventFavorite(widget.id);
  }
  Widget build(BuildContext context) {
   // EventManager.allEvents.add(Event(id: widget.id, color: widget.color, date: widget.date, event: widget.event, location: widget.location, publisher: widget.publisher, height: widget.height, image: widget.image, placeHolderText: widget.placeHolderText));
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.black87,
        elevation: 8.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 15.0, 5),
                    child: Container(
                      height: 120,
                      width: 120,
                      //color: Colors.black,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PictureScreen(
                                eventId: widget.id,
                                image: widget.image,
                              ),
                            )
                        ),
                        child: Hero(
                          tag: '${widget.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child:
                            DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: widget.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchEventsScreen()
                  )
                ),
                child: Container(
                  //color: Colors.blue,
                  child: Column(
                    children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              widget.date,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w500
                          ),
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.event,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.location,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                //fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.publisher,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: isFavorite
                                ? Icon(Icons.favorite_rounded, color: Colors.red)
                                : Icon(Icons.favorite_border_rounded),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              // Add your navigation logic here
                              FavoriteEventManager.toggleFavorite(widget.id);
                            },
                            iconSize: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class PictureScreen extends StatelessWidget {
  final int eventId;
  final ImageProvider<Object> image;
  const PictureScreen({Key? key,
    this.image = const AssetImage("lib/assets/images/Professional Pic of me(1).jpeg",),
    this.eventId = 32
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => const HomePage(),
          ),
          )
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: '$eventId',
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: PhotoView(
                  imageProvider: image,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: 2.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SettingsCard extends StatefulWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Widget? trailingWidget;
  const SettingsCard({
    super.key,
    required this.title,
    this.trailingWidget,
    this.fontSize,
    this.fontWeight,
    this.fontStyle

  });

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            fontStyle: widget.fontStyle

          ),
        ),
        trailing: widget.trailingWidget,
      ),
    );
  }
}

