// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Data/habit_dataset.dart';
import '../Util/habit_row.dart';
import '../Util/my_alert_dialog_box.dart';

class ListViewMain extends StatefulWidget {
  const ListViewMain({super.key});

  @override
  State<ListViewMain> createState() => _ListViewMainState();
}

class _ListViewMainState extends State<ListViewMain> {
  TextEditingController controller = TextEditingController();

  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // if there is no data in the database.
    // then create database.
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    } else {
      // means there is already some data inside database.
      db.loadData();
    }

    // Updating database.
    db.updateDatabase();

    super.initState();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.habitsList[index][1] = value;
    });
    db.updateDatabase();
  }

  // For alert dialogBox
  void onSave() {
    // Saving data inside the habitsList list.
    // setState is necessary if you want to display data on screen.
    setState(() {
      db.habitsList.add([controller.text, false]);
      // Poping the alertDialogBox
      Navigator.of(context).pop();
      db.updateDatabase();
      db.loadData();
    });

    // Clearing the controller so that the discarded data does not come again.
    controller.clear();
  }

  // For editing habit and saving it.
  void onEditedSave(int index) {
    setState(() {
      db.habitsList[index][0] = controller.text;
      controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  // For alert dialogBox
  void onCancel() {
    // Poping the alertDialogBox
    Navigator.of(context).pop();

    // Clearing the controller so that the discarded data does not come again.
    controller.clear();
  }

  void createNewHabit() {
    // showing alert dialog to user to create new habit
    showDialog(
        context: context,
        builder: (context) {
          return EnterHabitBox(
            controller: controller,
            hintText: "Create a new habit",
            onCancel: onCancel,
            onSave: onSave,
          );
        });
  }

  // For slidable row option -> delete
  void deletePressed(int index) {
    setState(() {
      db.habitsList.removeAt(index);
    });
    db.updateDatabase();
  }

  // For slidable row option -> settings
  void settingsPressed(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return EnterHabitBox(
              controller: controller,
              hintText: db.habitsList[index][0],
              onSave: () => onEditedSave(index),
              onCancel: onCancel);
        });
  }

  @override
  Widget build(BuildContext context) {
    db.updateDatabase();
    db.loadData();
    return ListView.builder(
        key: UniqueKey(),
        itemCount: db.habitsList.length,
        itemBuilder: (context, index) {
          return habit_row(
              HabitName: db.habitsList[index][0],
              HabitCompleted: db.habitsList[index][1],
              isCompleted: (value) => checkBoxTapped(value, index),
              deletePressed: (context) => deletePressed(index),
              settingsPressed: (context) => settingsPressed(index));
        });
  }
}
