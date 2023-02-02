import 'package:flutter/material.dart';
import 'package:habit_tracker/IntroductionScreens/OnBoardingScreen/onBoarding_screen.dart';
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
      body: Container(
        color: Colors.amber.shade500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset("assets/habit_tracker_icon.png")),
            Center(
              child: Text(
                "Habit Tracker App",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
