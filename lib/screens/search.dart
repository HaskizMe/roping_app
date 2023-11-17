import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  int _selectedIndex = 0; // 0 for List View, 1 for Map View
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
              ),

              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set your desired background color
                      borderRadius: BorderRadius.circular(15.0), // Adjust the value for roundness
                    ),
                    child: ToggleButtons(
                      fillColor: Colors.grey,
                      color: Colors.black,
                      disabledBorderColor: Colors.green,
                      splashColor: Colors.green,
                      highlightColor: Colors.purple,
                      selectedColor: Colors.amber,
                      hoverColor: Colors.red,
                      borderColor: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0),
                      constraints: BoxConstraints.expand(width: 150.0),
                      isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                      onPressed: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'List View',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Map View',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Visibility(
                  //   visible: _selectedIndex == 0,
                  //   child: buildListView(),
                  // ),
                  // Visibility(
                  //   visible: _selectedIndex == 1,
                  //   child: buildMapView(),
                  // ),
                ],
              ),
              Visibility(
                visible: _selectedIndex == 0,
                child: Expanded(
                  child: Center(
                    child: listView(),
                  ),
                ),
              ),
              Visibility(
                visible: _selectedIndex == 1,
                child: Expanded(
                  child: Center(
                    child: mapView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget listView() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
    child: ListView.builder(
      itemCount: 8, // Number of items in your list
      itemBuilder: (context, index) {
        return const CustomCard(
          color: Colors.yellow,
          date: "Tuesday, December 15 at 12 PM",
          event: "Haskell #11 Roping",
          location: "Tyler, TX",
          publisher: "Bailey Haskell",
          height: 150.0,
          image: AssetImage(
            "lib/assets/images/roping_flyer_1.png",
          ),
          placeHolderText: "Place image here",
          id: 2+1,
        );
      },
    ),
  );
}

Widget mapView() {
  // Your Map View implementation here
  return Container(child: Text('Map View Content'), color: Colors.white,);
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


