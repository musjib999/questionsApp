import 'package:flutter/material.dart';
import 'package:pastq/screens/courses_screen.dart';
// import 'package:questions_app/services/level.dart';
import 'package:pastq/services/courses.dart';
import 'package:pastq/widgets/semester_card.dart';

class SemesterPage extends StatefulWidget {
  static String id = 'semester';

  @override
  _SemesterPageState createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level'),
        backgroundColor: Color(0xff445B83),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: SemesterCard(title: 'First Semester'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CoursesPage();
              }));
              semester = 'First Semester';
            },
          ),
          GestureDetector(
            child: SemesterCard(title: 'Second Semester'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CoursesPage();
              }));
              semester = 'Second Semester';
            },
          ),
        ],
      ),
    );
  }
}
