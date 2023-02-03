import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Percent_indicator extends StatefulWidget {
  const Percent_indicator({super.key});

  @override
  State<Percent_indicator> createState() => _Percent_indicatorState();
}

class _Percent_indicatorState extends State<Percent_indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: CircularPercentIndicator(
        radius: 60,
        animation: true,
        animationDuration: 1000,
        lineWidth: 15,
        percent: 0.3,
        progressColor: Color.fromARGB(255, 46, 146, 139),
        backgroundColor: Color.fromARGB(255, 180, 236, 233),
        circularStrokeCap: CircularStrokeCap.round,
        center: Text("30%",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    ));
  }
}
