// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final int position;
  final Function() onPressed;
  const MyFab({super.key, required this.onPressed, required this.position});

  @override
  Widget build(BuildContext context) {
    return (position == 1)
        ? FloatingActionButton(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.stop,
              size: 32,
              color: Colors.white,
            ),
            onPressed: null)
        : FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.black,
            ),
            onPressed: onPressed);
  }
}
