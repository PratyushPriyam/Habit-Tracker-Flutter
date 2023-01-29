import 'package:hive_flutter/hive_flutter.dart';

import 'DateTime/date_time.dart';

// Reference of our box.
final _myBox = Hive.box("habit_Database");

class HabitDatabase {
  List habitsList = [];

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
  }
}
