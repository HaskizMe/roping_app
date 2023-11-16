import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 50, 10.0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          "FEATURED EVENTS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      )
                  )
                ],
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                placeHolderText: "Place image here",
                id: 1,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/roping_flyer_1.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 2,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/roping_flyer_2.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 3,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/roping_flyer_3.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 4,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "EVENTS NEAR ME",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  )
                ],
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/roping_flyer_4.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 5,
              ),

              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/big_roping_flyer_4.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 6,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/big_roping_flyer_4.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 7,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                image: AssetImage(
                  "lib/assets/images/big_roping_flyer_4.png",
                  //width: 100,
                  //height: 140,
                ),
                placeHolderText: "Place image here",
                id: 8,
              ),
              CustomCard(
                color: Colors.yellow,
                date: "Tuesday, December 15 at 12 PM",
                event: "Haskell #11 Roping",
                location: "Tyler, TX",
                publisher: "Bailey Haskell",
                height: 150.0,
                placeHolderText: "Place image here",
                id: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
