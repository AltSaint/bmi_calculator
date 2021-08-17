import 'package:bmi_calculator/models/glass_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderColor: kDefaultBorderColor,
      borderWidth: 0.7,
      borderRadius: BorderRadius.circular(50),
      color: kActiveCardColor,
      child: RawMaterialButton(
        child: Icon(icon),
        onPressed: () {
          onPressed();
        },
        shape: CircleBorder(),
        fillColor: Colors.transparent,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        elevation: 0,
      ),
    );
  }
}
