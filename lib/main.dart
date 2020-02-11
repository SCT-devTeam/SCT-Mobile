import 'package:flutter/material.dart';
import 'package:sct_mobile/screens/onboarding_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new SCT(),
  ));
}

class SCT extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<SCT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
