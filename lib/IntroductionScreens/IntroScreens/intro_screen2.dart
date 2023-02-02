import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_kzfpndct.json")),
          ],
        ),
      ),
    );
  }
}
