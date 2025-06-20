import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:newapss/page/movielist.dart';

import 'lock_screen_filled_button.dart';

class AlertPop extends StatefulWidget {
  final Function() onPressOk;
  final Function() onPressCancel;

  const AlertPop({
    super.key,
    required this.onPressOk,
    required this.onPressCancel,
  });

  @override
  State<AlertPop> createState() => _AlertPopState();
}

class _AlertPopState extends State<AlertPop> {
  @override
  Widget build(BuildContext context) {
    showAlertPop() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Warning!"),
            content: Text("Select the options"),
            actions: [
              TextButton(
                onPressed: () {
                  debugPrint("Pressed cancel");
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await LaunchApp.openApp(
                    androidPackageName: 'com.google.android.GoogleCamera',
                    iosUrlScheme: 'pulsesecure://',
                    appStoreLink:
                        'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                    openStore: false,
                  );

                  debugPrint("Pressed okay");
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    }

    return LockScreenFilledButton(
      onPress: () {
        debugPrint("Button Tapped");
        showAlertPop();
      },
      cameraOn: true,
      torchOn: false,
    );

    //   AlertDialog(
    //   title: Text("Warning!"),
    //   content: Text("Required user permission"),
    //   actions: [
    //     TextButton(onPressed: widget.onPressCancel, child: Text("Cancel")),
    //     TextButton(onPressed: widget.onPressOk, child: Text("Ok")),
    //   ],
    // );
  }
}
