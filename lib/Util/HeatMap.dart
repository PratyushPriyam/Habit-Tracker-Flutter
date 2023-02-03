import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Heat_map extends StatelessWidget {
  const Heat_map({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 305,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: HeatMap(
        datasets: {
          DateTime(2023, 1, 31): 3,
          DateTime(2023, 2, 1): 7,
          DateTime(2023, 2, 2): 10,
          DateTime(2023, 2, 3): 6,
          DateTime(2023, 2, 4): 9,
        },
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 60)),
        size: 30,
        textColor: Colors.black,
        borderRadius: 12,
        colorMode: ColorMode.opacity,
        showText: true,
        scrollable: true,
        colorsets: {
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(40, 2, 179, 8),
          3: Color.fromARGB(60, 2, 179, 8),
          4: Color.fromARGB(80, 2, 179, 8),
          5: Color.fromARGB(100, 2, 179, 8),
          6: Color.fromARGB(120, 2, 179, 8),
          7: Color.fromARGB(140, 2, 179, 8),
          8: Color.fromARGB(160, 2, 179, 8),
          9: Color.fromARGB(180, 2, 179, 8),
          10: Color.fromARGB(200, 2, 179, 8),
        },
      ),
    );
    ;
  }
}
