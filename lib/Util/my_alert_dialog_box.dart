// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class EnterHabitBox extends StatelessWidget {
  final controller;
  final String hintText;
  final Function() onSave;
  final Function() onCancel;
  const EnterHabitBox(
      {super.key,
      this.controller,
      required this.hintText,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        maxLength: 20,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder()),
      ),
      actions: [
        MaterialButton(
          onPressed: onCancel,
          color: Colors.black,
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
            onPressed: onSave,
            color: Colors.black,
            child: const Text("Save", style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
