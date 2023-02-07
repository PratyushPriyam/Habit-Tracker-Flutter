import 'package:flutter/material.dart';
import 'package:habit_tracking_app/About_Us.dart';
import 'package:habit_tracking_app/Heat_map.dart';
import 'package:habit_tracking_app/Report_screen.dart';
import 'package:habit_tracking_app/Text_animation.dart';
import 'package:habit_tracking_app/percent_indicator.dart';
import 'package:habit_tracking_app/My_Profile.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBarTheme: AppBarTheme(color: Color(0xFFffcb00), elevation: 0),
      ),
      home: Scaffold(
        
        body: Container(child:MyProfileScreen(),),
      )
    );
  }
}
