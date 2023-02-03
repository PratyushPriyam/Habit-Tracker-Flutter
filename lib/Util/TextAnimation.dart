import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyAge extends StatefulWidget {
  const MyAge({super.key});

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: TextLiquidFill(
        text: '21',
        waveColor: Color.fromARGB(255, 46, 146, 139),
        boxBackgroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 90.0,
      )),
    );
  }
}
