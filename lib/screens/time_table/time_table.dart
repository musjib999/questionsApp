import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/shared/widgets/cards/day_card.dart';
import 'package:pastq/shared/widgets/cards/lecture_schedule_card.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  String currentDay =
      pastQservice.timerService.getCurrentDay().substring(0, 3).toUpperCase();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              'Today',
              style: TextStyle(fontSize: 17, color: Colors.white54),
            ),
            SizedBox(height: 5),
            Text(
              '${pastQservice.timerService.getTodaysDate()}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              child: ListView.builder(
                itemCount: days.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return DateTile(
                    weekDay: days[index],
                    isSelected: currentDay == days[index] ? true : false,
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Lectures',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            LecturesScheduleCard(
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            SizedBox(height: 15),
            LecturesScheduleCard(
              color: Colors.blueAccent,
              backgroundColor: Colors.blue.shade100,
            ),
            SizedBox(height: 15),
            LecturesScheduleCard(
              color: Colors.orange,
              backgroundColor: Colors.orange.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
