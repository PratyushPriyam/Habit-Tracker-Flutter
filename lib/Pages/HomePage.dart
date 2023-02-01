// ignore_for_file: file_names, non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/Pages/ProfilePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Data/habit_dataset.dart';
import '../Util/my_alert_dialog_box.dart';
import '../Util/my_fab.dart';
import 'ListViewMain.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    });
    controller.clear();
    // Poping the alertDialogBox
    Navigator.of(context).pop();
    db.updateDatabase();
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

  int CurvedNavigationindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 50.0,
            backgroundColor: Colors.black,
            items: const [
              Icon(Icons.home),
              Icon(Icons.person),
            ],
            index: CurvedNavigationindex,
            onTap: (index) {
              setState(() {
                CurvedNavigationindex = index;
              });
            },
          ),
          appBar: AppBar(
            title: const Text("Habit Tracker"),
          ),
          floatingActionButton: MyFab(
            onPressed: createNewHabit,
            position: CurvedNavigationindex,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: getSelectedWidget(index: CurvedNavigationindex)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    widget = ListViewMain();
    setState(() {
      switch (index) {
        case 0:
          widget = ListViewMain();

          db.loadData();
          db.updateDatabase();
          db.loadData();
          break;
        case 1:
          widget = ProfilePage();
          db.loadData();

          break;
        default:
          key:
          UniqueKey();
          widget = ListViewMain();
          setState(() {
            db.updateDatabase();
            db.loadData();
          });
          break;
      }
    });

    return widget;
  }
}
