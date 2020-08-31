import 'package:flutter/material.dart';
// import 'package:questions_app/services/level.dart';
import 'package:questions_app/services/courses.dart';

class NoCoursesPage extends StatelessWidget {
  static String id = 'noCourses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level'),
        backgroundColor: Color(0xff445B83),
      ),
      body: Center(
        child: Text(
          'Courses are not yet available',
          style: TextStyle(
            color: Colors.red,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
