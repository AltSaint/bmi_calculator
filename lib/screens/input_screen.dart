import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/models/glass_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

import '../calculator_brain.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

enum Sex { Male, Female }

class _InputScreenState extends State<InputScreen> {
  Sex? selectedSex;
  int height = 180;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: bg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            sexCards(),
            heightCard(context),
            attributesCards(),
            bottomButton(context),
          ],
        ),
      ),
    );
  }

  BottomButton bottomButton(BuildContext context) {
    return BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              final CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.of(context).pushNamed('/result', arguments: calc);
            },
          );
  }

  Expanded attributesCards() {
    return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: new GlassCard(
                    padding: EdgeInsets.all(kDefaultPadding),
                    borderRadius: BorderRadius.circular(20),
                    borderWidth: 1,
                    borderColor: kDefaultBorderColor,
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 30) weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new GlassCard(
                    padding: EdgeInsets.all(kDefaultPadding),
                    borderRadius: BorderRadius.circular(20),
                    borderWidth: 1,
                    borderColor: kDefaultBorderColor,
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Expanded heightCard(BuildContext context) {
    return Expanded(
            child: new GlassCard(
              padding: EdgeInsets.all(kDefaultPadding),
              borderRadius: BorderRadius.circular(20),
              borderWidth: 1,
              borderColor: kDefaultBorderColor,
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Expanded sexCards() {
    return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GlassCard(
                    padding: EdgeInsets.all(kDefaultPadding),
                    borderRadius: BorderRadius.circular(20),
                    borderWidth: 1,
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.Male;
                      });
                    },
                    borderColor: kDefaultBorderColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    color: selectedSex == Sex.Male
                        ? kActiveMCardColor
                        : kInActiveCardColor,
                  ),
                ),
                Expanded(
                  child: new GlassCard(
                    padding: EdgeInsets.all(kDefaultPadding),
                    borderRadius: BorderRadius.circular(20),
                    borderWidth: 1,
                    borderColor: kDefaultBorderColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.Female;
                      });
                    },
                    color: selectedSex == Sex.Female
                        ? kActiveFCardColor
                        : kInActiveCardColor,
                  ),
                ),
              ],
            ),
          );
  }
}
