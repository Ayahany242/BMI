// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mbi/Styles/constants.dart';

class ButtonStyling extends StatelessWidget {
  const ButtonStyling({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          primary: const Color(0xFF64FEDA), // <-- Button color
          onPrimary: kInactiveCardColor),
      child: Icon(
        icon,
        size: 20.0,
      ),
    );
  }
}
