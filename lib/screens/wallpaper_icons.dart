import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:newapss/main.dart';
import 'package:newapss/page/alert_pop.dart';
import 'package:newapss/page/lock_screen_filled_button.dart';
import 'package:newapss/page/movielist.dart';
import 'package:torch_flashlight/torch_flashlight.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> HomeIconPresed() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('iconPressed', true);
  debugPrint("icon pressed....");
}

class WallPaperIcons extends StatefulWidget {
  const WallPaperIcons({super.key});

  @override
  State<WallPaperIcons> createState() => _WallPaperIconsState();
}

class _WallPaperIconsState extends State<WallPaperIcons> {
  Future<void> Login() async {
    String? test = await sharedPrefFuncStr(PrefCase.get, 'iconPress');

    test == "true"
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AppHome2()),
          )
        : null;
  }

  bool torchOn = false;

  // String now2 = DateFormat('Hm').format(DateTime.now());
  // String now1 = DateFormat('MEd').format(DateTime.now());

  @override
  void initState() {

    setState(() {
      Login();
    });
    // Timer.periodic(Duration(seconds: 30), (timer) {
    //   setState(() {
    //     // now2 = DateFormat('Hm').format(DateTime.now());
    //     // now1 = DateFormat('MEd').format(DateTime.now());
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
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
            left: 158,
            child: Text(
              "12:21",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 150,
            left: 130,
            child: Text(
              "12",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),

          Positioned(
            top: 800,
            left: 30,
            child: AlertPop(onPressOk: () {}, onPressCancel: () {}),
            // LockScreenFilledButton(
            //   onPress: () {
            //     debugPrint("Button Tapped");
            //     showAlertPop(context);
            //   },
            //   cameraOn: true,
            //   torchOn: false,
            // ),
          ),
          Positioned(
            top: 800,
            right: 30,
            child: LockScreenFilledButton(
              onPress: () {
                setState(() {
                  torchOn = !torchOn;
                  torchOn
                      ? TorchFlashlight.enableTorchFlashlight()
                      : TorchFlashlight.disableTorchFlashlight();
                });
                debugPrint("Flashlight has been tapped");
              },
              cameraOn: false,
              torchOn: torchOn,
              // icon: torchOn
              //     ? Icons.flashlight_on_rounded
              //     : Icons.flashlight_off_rounded,
            ),
          ),
          Positioned(
            top: height / 2,
            // left: width/2,
            right: (width / 2) - 50,
            child: IconButton(
              onPressed: () async {
                await sharedPrefFuncStr(PrefCase.set, KeyList().iconPress);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AppHome2()),
                );
              },
              icon: Icon(
                Icons.home_rounded,
                size: 50,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool?> sharedPrefFuncBool(bool get, bool set, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (set == true) {
    debugPrint("set true");
    await prefs.setBool(key, true);
  } else if (get == true) {
    bool? keyValue = prefs.getBool(key);
    debugPrint("get true");
    return keyValue;
  } else {
    debugPrint("else");
  }
  return null;
}

enum PrefCase { get, set }

Future<String?> sharedPrefFuncStr(PrefCase prefCase, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefCase == PrefCase.get) {
    String? keyValue = prefs.getString(key);
    debugPrint("get true");
    return keyValue;
  } else {
    debugPrint("set true");
    await prefs.setString(key, "true");
  }
  return null;
}

class KeyList {
  String iconPress = "iconPress";
  String name='names';
}
