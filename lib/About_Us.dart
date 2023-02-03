import 'package:flutter/material.dart';


class About_Us extends StatelessWidget {
  const About_Us({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Color(0xFFffcb00), elevation: 0),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
      
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(

                color: Color(0xFFd6d529),
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
                border: Border.all(color: Colors.black, width: 4),
                image: DecorationImage(image: AssetImage("asset/meditate.png"),alignment:Alignment.topCenter),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
