import 'package:flutter/material.dart';




class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  bool sowMe = false;
  List<String> namelist = [
    "fantasy",
    "horror",
    "thriller",
    "drama",
    "science",
    "romance",
    "ehhehe",
    "eehehehe",
    "eheewhe",
  ];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage("image/wall.jpg"),
            ),
          ),
          Positioned(
            top: 120,
            left: 135,
            child: Text(
              "Friday, June 13",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 150,
            left: 145,
            child: Text(
              "6:48",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(top: 800,
            left: 30,
            child: IconButton.filled(iconSize: 35,
              onPressed: () {
                debugPrint("Camera has been tapped");
              },
              icon: Icon(Icons.camera_alt_rounded),
            ),
          ),
          Positioned(top: 800,
            right: 30,
            child: IconButton.filled(iconSize: 35,
              onPressed: () {
                debugPrint("Flashlight has been tapped");
              },
              icon: Icon(Icons.flashlight_on_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
