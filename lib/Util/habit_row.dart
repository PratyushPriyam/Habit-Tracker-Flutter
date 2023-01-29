// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class habit_row extends StatelessWidget {
  final String HabitName;
  final bool HabitCompleted;
  final Function(bool?)? isCompleted;
  final Function(BuildContext)? deletePressed;
  final Function(BuildContext)? settingsPressed;
  const habit_row(
      {super.key,
      required this.HabitName,
      required this.HabitCompleted,
      required this.isCompleted,
      required this.deletePressed,
      required this.settingsPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(
              onPressed: settingsPressed,
              backgroundColor: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10),
              icon: Icons.settings,
            ),
            SlidableAction(
              onPressed: deletePressed,
              backgroundColor: Colors.red.shade600,
              borderRadius: BorderRadius.circular(10),
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: HabitCompleted,
                      onChanged: isCompleted),
                  Text(
                    HabitName,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Icon(Icons.arrow_back_ios)
            ],
          ),
        ),
      ),
    );
  }
}
