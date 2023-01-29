// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:habit_tracker/Data/habit_dataset.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _WaterCounterState();
}

class _WaterCounterState extends State<ProfilePage> {
  HabitDatabase db = HabitDatabase();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
