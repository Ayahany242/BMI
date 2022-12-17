import 'package:flutter/material.dart';

//To create GestureDetector
class CardStyle extends StatelessWidget {
  const CardStyle({
    Key? key,
    this.onPress,
    required this.color,
    this.cardChild, // To create Icon
  }) : super(key: key);
  final Function()? onPress;
  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: cardChild,
      ),
    );
  }
}
