import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Percent_indicator extends StatelessWidget {
  final double percentageToday;
  const Percent_indicator({super.key, required this.percentageToday});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: CircularPercentIndicator(
        radius: 60,
        animation: true,
        animationDuration: 1000,
        lineWidth: 15,
        percent: percentageToday,
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
