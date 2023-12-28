import 'package:flutter/material.dart';
import '../custom_widgets/cards.dart';

class Event {
  // Private variables
  String title;
  String date;
  String publisher;
  String location;
  bool isFavorited;
  int id;
  AssetImage image;

  // Constructor
  Event(this.title, this.date, this.publisher, this.location, this.isFavorited, this.id, this.image);

  // Getter for name
  String getDate(){
    return date;
  }
  void setDate(String newDate){
    date = newDate;
  }
  String getTitle(){
    return title;
  }
  void setTitle(String newTitle){
    title = newTitle;
  }
  String getPublisher(){
    return publisher;
  }
  void setPublisher(String newPublisher){
    publisher = newPublisher;
  }
  String getLocation(){
    return location;
  }
  void setLocation(String newLocation){
    location = newLocation;
  }
  bool isLiked(){
    return isFavorited;
  }
  void setLiked(bool newFavorite){
    isFavorited = newFavorite;
  }
  int getId(){
    return id;
  }
  void setId(int newId){
    id = newId;
  }
  AssetImage getImage(){
    return image;
  }
  void setImage(AssetImage newImage){
    image = newImage;
  }
}

