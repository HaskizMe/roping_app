import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:roping_event_app/main.dart';
import 'package:roping_event_app/screens/favorites.dart';
import 'package:roping_event_app/screens/home.dart';
import 'package:roping_event_app/screens/search.dart';
class CustomCard extends StatefulWidget {
  final Color color;
  final String date;
  final String event;
  final String location;
  final String publisher;
  final double height;
  final String placeHolderText;
  final int id;
  final ImageProvider<Object> image;
  const CustomCard({Key? key,
    required this.color,
    required this.date,
    required this.event,
    required this.location,
    required this.publisher,
    required this.height,
    this.image = const AssetImage("lib/assets/images/Professional Pic of me(1).jpeg",),
    required this.placeHolderText,
    required this.id
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 100,
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
                                testText: widget.placeHolderText,
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
                              if (isFavorite) {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => const FavoritesScreen(),
                                //   ),
                                // );
                              }
                            },
                            iconSize: 30.0,
                            color: Colors.white,
                          )
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
  final String testText;
  final int eventId;
  final ImageProvider<Object> image;
  const PictureScreen({Key? key,
    this.testText = 'Test',
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
