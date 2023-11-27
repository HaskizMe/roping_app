import 'package:flutter/material.dart';
import '../custom_widgets/cards.dart';

class EventManager {
  static List<Event> allEvents = [];
}

class Event {
  final int id;
  final Color color;
  final String date;
  final String event;
  final String location;
  final String publisher;
  final double height;
  final AssetImage image;
  final String placeHolderText;

  Event({
    required this.id,
    required this.color,
    required this.date,
    required this.event,
    required this.location,
    required this.publisher,
    required this.height,
    required this.image,
    required this.placeHolderText,
  });
}
