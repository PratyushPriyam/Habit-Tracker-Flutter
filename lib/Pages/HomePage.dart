// ignore_for_file: file_names, non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/Pages/AboutUs.dart';
import 'package:habit_tracker/Pages/ReportScreen.dart';
import 'package:habit_tracker/Pages/UserProfile.dart';
import 'package:habit_tracker/Util/myDrawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
          drawer: MyDrawer(),
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
            title: Container(
              child: Center(
                  child: Text(
                "Habit Tracker", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            actions: [
              InkWell(
                onTap: () => {
                  QuickAlert.show(
                      context: context,
                      confirmBtnText: "Okay",
                      confirmBtnColor: Colors.black,
                      cancelBtnText: "Facing a problem",
                      cancelBtnTextStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      showCancelBtn: true,
                      onCancelBtnTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BugReport()));
                      },
                      borderRadius: 30,
                      title: "Hello 👋",
                      animType: QuickAlertAnimType.slideInUp,
                      text: "For any query, "
                          "Contact us at :  "
                          "habittracker04@gmail.com or write your "
                          "problems at our at our portal "
                          "by clicking on the red button",
                      type: QuickAlertType.warning)
                },
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      Icon(Icons.report_gmailerrorred_outlined),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Text("Report"),
                      ),
                    ],
                  ),
                ),
              )
            ],
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

          db.updateDatabase();
          break;
        case 1:
          widget = UserProfile();
          db.loadData();

          break;
        default:
          key:
          UniqueKey();
          widget = ListViewMain();
          setState(() {
            db.updateDatabase();
          });
          break;
      }
    });

    return widget;
  }
}
