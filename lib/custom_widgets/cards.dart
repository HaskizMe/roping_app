import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final Color color;
  final String date;
  final String event;
  final String location;
  final String publisher;
  final double height;
  final ImageProvider<Object> image;
  const CustomCard({Key? key,
    required this.color,
    required this.date,
    required this.event,
    required this.location,
    required this.publisher,
    required this.height,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      //color: Colors.red,
      child: Card(
        color: Colors.black87,
        elevation: 20.0,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Container(
                      width: 100,
                      //color: Colors.green,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PictureScreen(),
                          )
                        ),
                        child: Hero(
                          tag: 'imageHero',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //color: Colors.black87,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    date,
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
                                  event,
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
                                  location,
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
                                  publisher,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                //color: Colors.white,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PictureScreen extends StatelessWidget {
  const PictureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'imageHero',
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/professional_pic_of_me.jpeg",
                          //width: 100,
                          //height: 140,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
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
