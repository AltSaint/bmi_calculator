import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kBottomContainerColor = Color(0xFFEB1555);
final kActiveCardColor = Colors.white.withOpacity(0.115);
final kActiveMCardColor = Colors.blue.withOpacity(0.3);
final kActiveFCardColor = Colors.pink.withOpacity(0.3);
final kInActiveCardColor = Colors.white.withOpacity(0.05);
final kDefaultBorderColor = Colors.white.withOpacity(0.2);
const bg = DecorationImage(
    image: AssetImage('assets/images/bg_red.jpg'), fit: BoxFit.cover);
const kDefaultPadding = 15.0;

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFAFAFA),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
