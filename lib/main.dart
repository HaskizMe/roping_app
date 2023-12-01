import '/events/event_manager.dart';
import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';
import 'package:roping_event_app/screens/profile.dart';
import 'package:roping_event_app/screens/favorites.dart';
import 'package:roping_event_app/screens/search.dart';
import 'screens/home.dart';
import 'package:device_preview/device_preview.dart';
import 'globals/global_variables.dart';
void main() {
  runApp(DevicePreview(
    enabled: true,
     // enabled: false,
    builder: (context) => const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalData.allEvents = initializeEvents();
    return const MaterialApp(
      home: HomePage(),
    );
  }
  List<Event> initializeEvents() {
    // Your event initialization code here
    return [
      Event("Coleman #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 1, const AssetImage("lib/assets/images/roping_flyer_1.png",),),
      Event("Haskell #9 Team Roping", "Friday, December 1 at 12 PM", "Bailey Haskell", "Bullard, TX", false, 2, const AssetImage("lib/assets/images/roping_flyer_2.png",),),
      Event("Hiserman #11 Roping", "Monday, December 2 at 12 PM", "Will Hiserman", "Tyler, TX", false, 3, const AssetImage("lib/assets/images/roping_flyer_3.png",),),
      Event("Walker #11 Team Roping", "Tuesday, December 3 at 12 PM", "Briston Walker", "Whitehouse, TX", false, 4, const AssetImage("lib/assets/images/roping_flyer_4.png",),),
      Event("Jorgensen #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 5, const AssetImage("lib/assets/images/roping_flyer_1.png",),),
      Event("Toone #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 6, const AssetImage("lib/assets/images/roping_flyer_2.png",),),
      Event("Tom #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 7, const AssetImage("lib/assets/images/big_roping_flyer_4.png",),),
      Event("Williams #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 8, const AssetImage("lib/assets/images/roping_flyer_2.png",),),
      Event("Chad #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 9, const AssetImage("lib/assets/images/roping_flyer_3.png",),),
      Event("KC #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 10, const AssetImage("lib/assets/images/big_roping_flyer_4.png",),),
      Event("KC #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 11, const AssetImage("lib/assets/images/big_roping_flyer_4.png",),),
      Event("KC #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 12, const AssetImage("lib/assets/images/big_roping_flyer_4.png",),),
      Event("KC #11 Team Roping", "Tuesday, December 15 at 12 PM", "McKenna Coleman", "Bullard, TX", false, 13, const AssetImage("lib/assets/images/big_roping_flyer_4.png",),),

      // Add other events as needed
    ];
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
          ProfileScreen(),
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
            label: "Profile",
            backgroundColor: Colors.grey[800]
          )
        ],
      ),
    );
  }
}