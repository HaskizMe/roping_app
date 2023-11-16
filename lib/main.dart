import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';
import 'package:roping_event_app/screens/account.dart';
import 'package:roping_event_app/screens/favorites.dart';
import 'package:roping_event_app/screens/search.dart';
import 'screens/home.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(DevicePreview(
    enabled: true,
    //  enabled: false,
    builder: (context) => const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _onIconTapped(int index) {
    int difference = _selectedIndex - index;
    // If there is a jump to more than a difference of one then just jump to page
    if(difference.abs() > 1){
      _pageController.jumpToPage(index);
    }
    // If the button is adjacent to the current one selected then animate instead
    else{
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          SearchEventsScreen(),
          FavoritesScreen(),
          AccountScreen(),
          //PictureScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // Sets the bottom nav bar and contains Home, Search, Favorites, and Account
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onIconTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.grey[800]
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: "Search Events",
            backgroundColor: Colors.grey[800]
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: "Favorites",
            backgroundColor: Colors.grey[800]
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "Account",
            backgroundColor: Colors.grey[800]
          )
        ],
      ),
    );
  }
}