import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    double height = 90.0;
    double circleRadius = 90.0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height, // Adjust the height as needed
            color: Colors.black,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: circleRadius,
              height: circleRadius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
                image: const DecorationImage(
                  image: AssetImage(
                    "lib/assets/images/Professional Pic of me(1).jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
