import 'package:flutter/material.dart';

class SearchEventsScreen extends StatefulWidget {
  const SearchEventsScreen({Key? key}) : super(key: key);

  @override
  State<SearchEventsScreen> createState() => _SearchEventsScreenState();
}

class _SearchEventsScreenState extends State<SearchEventsScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    print("disposing");
    // Dispose of the TextEditingController when the widget is disposed
    _controller.dispose();
    FocusScope.of(context).unfocus();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0.0,
          backgroundColor: Colors.black,
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     iconSize: 40,
          //     onPressed: () {
          //       showSearch(context: context, delegate: DataSearch());
          //     },
          //   ),
          // ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search for events",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: #11 Roping",
                  prefixIcon: IconButton(
                      icon: Icon(Icons.search_rounded),
                    onPressed: () {

                    },
                  ),
                  prefixIconColor: Colors.amber,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                  suffixIconColor: Colors.amber
                ),
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<String> data = ["apple", "banana", "cherry", "date", "elderberry"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can customize the search results here
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text('Results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data.where((item) => item.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            // You can handle item selection here
            showResults(context);
          },
        );
      },
    );
  }
}


