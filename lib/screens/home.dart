import 'package:flutter/material.dart';
import 'package:roping_event_app/custom_widgets/cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //SizedBox(height: 50,),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 50, 10.0, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                       // color: Colors.blue,
                        child: const Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomCard(
                              color: Colors.yellow,
                              date: "Tuesday, December 15 at 12 PM",
                              event: "Haskell #11 Roping",
                              location: "Tyler, TX",
                              publisher: "Bailey Haskell",
                              height: 150.0,
                              image: AssetImage(
                                  "assets/professional_pic_of_me.jpeg",
                                //width: 100,
                                //height: 140,
                              ),
                            ),
                            CustomCard(
                              color: Colors.yellow,
                              date: "Tuesday, December 15 at 12 PM",
                              event: "Haskell #11 Roping",
                              location: "Tyler, TX",
                              publisher: "Bailey Haskell",
                              height: 150.0,
                              image: AssetImage(
                                "assets/professional_pic_of_me.jpeg",
                                //width: 100,
                                //height: 140,
                              ),
                            ),
                            CustomCard(
                              color: Colors.yellow,
                              date: "Tuesday, December 15 at 12 PM",
                              event: "Haskell #11 Roping",
                              location: "Tyler, TX",
                              publisher: "Bailey Haskell",
                              height: 150.0,
                              image: AssetImage(
                                "assets/professional_pic_of_me.jpeg",
                                //width: 100,
                                //height: 140,
                              ),
                            ),
                            CustomCard(
                              color: Colors.yellow,
                              date: "Tuesday, December 15 at 12 PM",
                              event: "Haskell #11 Roping",
                              location: "Tyler, TX",
                              publisher: "Bailey Haskell",
                              height: 150.0,
                              image: AssetImage(
                                "assets/professional_pic_of_me.jpeg",
                                //width: 100,
                                //height: 140,
                              ),
                            ),

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
