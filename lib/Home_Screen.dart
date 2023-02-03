import 'package:flutter/material.dart';
import 'package:habit_tracking_app/Heat_map.dart';
import 'package:habit_tracking_app/My_Profile.dart';

class MYHome_Screen extends StatelessWidget {
  const MYHome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.amber,
        appBarTheme: AppBarTheme(color: Color(0xFFffcb00), elevation: 0),
      ),
      home: Scaffold(
        
        body: Container(child: Text("Home Screen")),
      ),
    );
  }
}
