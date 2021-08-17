import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/models/glass_card.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result =
        ModalRoute.of(context)?.settings.arguments as CalculatorBrain;
    final bmiResult = result.calculateBMI();
    final resultText = result.getResult();
    final interpretation = result.getInterpretation();
    return Container(
      decoration: BoxDecoration(image: bg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GlassCard(
                padding: EdgeInsets.all(kDefaultPadding),
                borderRadius: BorderRadius.circular(20),
                borderWidth: 1,
                borderColor: kDefaultBorderColor,
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          resultText,
                          style: kResultTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RE - CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
