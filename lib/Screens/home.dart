import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mbi/Screens/result.dart';
import 'package:mbi/Styles/bottom_button.dart';
import 'package:mbi/Styles/button_style.dart';
import 'package:mbi/Styles/card_child.dart';
import 'package:mbi/Styles/constants.dart';
import 'package:mbi/calc.dart';
import '../Styles/card_style.dart';

enum Gender {
  male,
  female;
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.female;
  int height = 100;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B.M.I Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: [
              Expanded(
                child: CardStyle(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  cardChild: const IconContent(
                    icon: Icons.male,
                    text: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: CardStyle(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  cardChild: const IconContent(
                    icon: Icons.female,
                    text: 'Female',
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CardStyle(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumbTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 250.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    activeColor: const Color(0xFF26A59A),
                    inactiveColor: const Color(0xFF0C6666),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: CardStyle(
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '$age',
                      style: kNumbTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonStyling(
                          onPressed: () {
                            setState(() {
                              age > 0 ? age-- : age = 0;
                            });
                          },
                          icon: Icons.remove,
                        ),
                        ButtonStyling(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: Icons.add,
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: CardStyle(
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '$weight',
                      style: kNumbTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonStyling(
                          onPressed: () {
                            setState(() {
                              weight > 0 ? weight-- : weight = 0;
                            });
                          },
                          icon: Icons.remove,
                        ),
                        ButtonStyling(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          icon: Icons.add,
                        )
                      ],
                    )
                  ],
                ),
              )),
            ]),
          ),
          BottomButton(
              recalButton: false,
              onTap: () {
                if (age != 0 && weight != 0) {
                  Calc calc = Calc(
                      height: height, weight: weight, gender: selectedGender);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: calc.calcBMI().toString(),
                      resultText: calc.getResult(),
                      bmlDetails: calc.getInterpret(),
                      idealWeight: calc.calcIdealWeight().toString(),
                    ),
                  ));
                } else {
                  showToast(
                    'Please enter your age and weight',
                    context: context,
                    animation: StyledToastAnimation.scale,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: const StyledToastPosition(
                        align: Alignment.center, offset: 70),
                    animDuration: const Duration(seconds: 1),
                    duration: const Duration(seconds: 5),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.linear,
                    backgroundColor: Colors.red,
                  );
                }
              },
              text: 'CALCULATE'),
        ],
      ),
    );
  }
}
