import 'package:flutter/material.dart';

class MyReport_Screen extends StatelessWidget {
  const MyReport_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        body: SafeArea(
      child: Container(
        child: Center(
            child: Text(
                "To report a bug kindly contact our development\n team at Developer@gmail.com")),
      ),
    ));
  }
}
