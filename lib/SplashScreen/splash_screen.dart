import 'package:flutter/material.dart';
import 'package:habit_tracker/OnBoardingScreen/onBoarding_screen.dart';
import 'package:habit_tracker/Pages/HomePage.dart';
import 'package:lottie/lottie.dart';

class splash_screen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<splash_screen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => OnBoardingScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_qzvumybq.json'),
          ),
          Text(
            "Habit Tracker App",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
