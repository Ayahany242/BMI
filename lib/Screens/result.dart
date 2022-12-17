// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:mbi/Styles/bottom_button.dart';
import 'package:mbi/Styles/card_style.dart';
import 'package:mbi/Styles/constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.bmlDetails,
    required this.idealWeight,
  }) : super(key: key);
  final String bmiResult;
  final String resultText;
  final String bmlDetails;
  final String idealWeight;

  TextStyle? textStyleResult(String textResltColor) {
    if (textResltColor == 'Normal') {
      return kResultTextStyleNormal;
    } else {
      return kResultTextStyleBad;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B.M.I Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: CardStyle(
              color: kActiveCardColor,
              cardChild: Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: textStyleResult(resultText),
                    ),
                    Text(
                      ' Ideal Weight is $idealWeight',
                      style: kBMITextStyle,
                    ),
                    Text(
                      'BMI is $bmiResult',
                      style: kBMITextStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      // padding: EdgeInsets.all(8),
                      child: Text(
                        bmlDetails,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          BottomButton(
            recalButton: true,
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Re-Calculate',
          )
        ],
      ),
    );
  }
}
