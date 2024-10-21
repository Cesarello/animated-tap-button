import 'package:animated_tap_button/animated_tap_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool buttonValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Tap Button Example'),
        ),
        body: Center(
          child: AnimatedTapButton(
            iconSize: 50.0,
            initialValue: buttonValue,
            onValueChanged: (bool newValue) {
              buttonValue = !buttonValue;
              setState(() {});
            },
            selectedIcon: Icons.thumb_up,
            unselectedIcon: Icons.thumb_up_off_alt,
            iconColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
