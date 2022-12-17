// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mbi/Styles/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.recalButton,
  }) : super(key: key);
  final Function() onTap;
  final String text;
  final bool? recalButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: kBotContainerHeight,
        margin: const EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          color: recalButton == false? kBotContainerColor: kInactiveCardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          text,
          style: kLargeButTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
