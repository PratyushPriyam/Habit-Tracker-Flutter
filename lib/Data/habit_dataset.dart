import 'package:hive_flutter/hive_flutter.dart';

import 'DateTime/date_time.dart';

// Reference of our box.
final _myBox = Hive.box("habit_Database");

class HabitDatabase {
  List habitsList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // Initial default data.
  void createDefaultData() {
    habitsList = [
      ["Workout", false],
      ["Read", false],
    ];
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // Loading data if already present.
  void loadData() {
    // If new day, get habit list from database.
    if (_myBox.get(todaysDateFormatted()) == null) {
      habitsList = _myBox.get("CURRENT_HABIT_LIST");
      // Set all habits to false since it's a new day.
      for (int i = 0; i < habitsList.length; i++) {
        habitsList[i][1] = false;
      }
    }
    // If not new day, load today's list.
    else {
      habitsList = _myBox.get(todaysDateFormatted());
    }
  }

  // Updating database.
  void updateDatabase() {
    // Update today's entry
    _myBox.put(todaysDateFormatted(), habitsList);

    // Update Universal habit list incase it ever changed.
    _myBox.put("CURRENT_HABIT_LIST", habitsList);

    // Calculating habit completed percentage for each day.
    habitCompletedPercentage();
    // load heat map
    loadHeatMap();
  }

  void habitCompletedPercentage() {
    int countCompleted = 0;
    for (int i = 0; i < habitsList.length; i++) {
      if (habitsList[i][1] == true) {
        countCompleted++;
      }
    }
    // 1 signifies 1 decimal place.
    String percentage = habitsList.isEmpty
        ? "0.0"
        : (countCompleted / habitsList.length).toStringAsFixed(1);

    // key: "PERCENTAGE_SUMMARY_yyyymmdd"
    // value: String of 1 decimal number between 0.0 and 1.0 inclusive.
    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percentage);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    // Count number of days in between.
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // Going from start date to today and add percentage to dataset.
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercentage =
          double.parse(_myBox.get("PERCENTAGE_SUMMARY_${yyyymmdd}") ?? "0.0");

      // Splitting dateTime object inty yyyy, mm, dd.

      //Year
      int year = startDate.add(Duration(days: i)).year;

      //Month
      int month = startDate.add(Duration(days: i)).month;

      //Day
      int day = startDate.add(Duration(days: i)).day;

      final percentageOfEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercentage).toInt(),
      };

      heatMapDataSet.addEntries(percentageOfEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
