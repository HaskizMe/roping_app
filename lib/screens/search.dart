import 'package:flutter/material.dart';

class SearchEventsScreen extends StatelessWidget {
  const SearchEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Search Page"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "THIS IS MY SEARCH EVENTS PAGE"
            ),
          )
        ],
      ),
    );
  }
}
