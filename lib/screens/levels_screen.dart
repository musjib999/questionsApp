import 'package:flutter/material.dart';
import 'package:questions_app/screens/semester_screen.dart';
import 'package:questions_app/screens/unavailableCourses_screen.dart';
// import 'package:questions_app/services/level.dart';
import 'package:questions_app/services/courses.dart';
import 'package:questions_app/services/depertment.dart';

class LevelPage extends StatefulWidget {
  static String id = 'level';

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(depertment),
        backgroundColor: Color(0xff445B83),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              contentPadding: EdgeInsets.all(9.0),
              title: Text('Level 1'),
              onTap: () {
                Navigator.pushNamed(context, SemesterPage.id);
                level = 'Level 1';
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(15.0),
              title: Text('Level 2'),
              onTap: () {
                level = 'Level 2';
                if (depertment == depertments[0]) {
                  Navigator.pushNamed(context, SemesterPage.id);
                } else {
                  Navigator.pushNamed(context, NoCoursesPage.id);
                }
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(15.0),
              title: Text('Level 3'),
              onTap: () {
                level = 'Level 3';
                Navigator.pushNamed(context, NoCoursesPage.id);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(15.0),
              title: Text('Level 4'),
              onTap: () {
                level = 'Level 4';
                Navigator.pushNamed(context, NoCoursesPage.id);
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
