import 'package:flutter/material.dart';

import '../custom_widgets/cards.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    double size = 110.0;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size * 1.5,
            child: Stack(
              children: [
                Container(
                  height: size, // Adjust the height as needed
                  color: Colors.black,
                ),
                Positioned(
                  top: size / 2,
                  left: (MediaQuery.of(context).size.width / 2) - (size / 2),
                  child: Container(
                    width: size,
                    height: size,
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
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Bailey Haskell",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              IconButton(
                splashRadius: 20.0,
                  onPressed: () {},
                  icon: Icon(Icons.edit),
              ),
            ],
          ),
          SizedBox(height: 15,),
          const Text("Haskellb2017@gmail.com"),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     Text(
                //       "Settings",
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold
                //       ),
                //     ),
                //   ],
                // ),
                const SettingsCard(
                    title: "Settings",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 30,),
                const SettingsCard(
                  title: "Location",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  trailingWidget: Text("Orem, UT"),
                ),
                SettingsCard(
                  title: "Copy to Calender",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  trailingWidget: Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        print("Value $switchValue");
                        switchValue = true;
                        //switchFunction(value);
                        switchValue = value;
                      });
                    },
                  ),
                ),

                const SettingsCard(
                  title: "Location",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  trailingWidget: Text("Orem, UT"),
                ),
                const SettingsCard(
                  title: "Location",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  trailingWidget: Text("Orem, UT"),
                ),
                const SizedBox(height: 60,),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text("LOGOUT"),
                  ),
                ),
              ],
            ),
          )
          // Padding(
          //   padding: EdgeInsets.all(20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //           "Settings",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold
          //         ),
          //       ),
          //       Spacer(), // This will add a big space in between
          //       Text("Orem, UT"),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
