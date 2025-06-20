import 'package:flutter/material.dart';
import 'package:torch_flashlight/torch_flashlight.dart';

class LockScreenFilledButton extends StatefulWidget {
  final Function() onPress;
  final bool cameraOn;
  final bool torchOn;

  const LockScreenFilledButton({
    super.key,
    required this.onPress,
    required this.cameraOn,
    required this.torchOn,
  });

  @override
  State<LockScreenFilledButton> createState() => _LockScreenFilledButtonState();
}

class _LockScreenFilledButtonState extends State<LockScreenFilledButton> {

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: 35,
      onPressed: widget.onPress,
      icon: widget.cameraOn
          ? Icon(Icons.camera_alt_rounded)
          : widget.torchOn
          ? Icon(Icons.flashlight_on_rounded)
          : Icon(Icons.flashlight_off_rounded),

      // widget.torchOn==true
      //     ? Icon(Icons.camera_alt_rounded)
      //     : Icon(Icons.camera_alt_rounded) : Icon(
      //     Icons.flashlight_on_rounded) ,
    );
  }
}
