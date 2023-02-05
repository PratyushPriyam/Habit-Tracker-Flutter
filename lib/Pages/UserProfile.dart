import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Data/habit_dataset.dart';
import '../Util/HeatMap.dart';
import '../Util/PercentageIndicator.dart';
import '../Util/TextAnimation.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 195,
                decoration: BoxDecoration(
                    color: Color(0xFFffcb00),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 70.0,
                      minRadius: 70.0,
                      backgroundImage:
                          AssetImage('assets/habit_tracker_icon.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        "Pratham Chikara",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                // heat map implementation
                child: Heat_Map(
              datasets: db.heatMapDataSet,
              startDate: _myBox.get("START_DATE"),
            )),
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 15,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFFffcb00), width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Text("Progress",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          SizedBox(height: 20),
                          Container(
                            child: Percent_indicator(
                              percentageToday: db.strengthAsPercentage,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFFffcb00), width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Text("Age",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: MyAge(),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Color(0xFFffcb00),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
