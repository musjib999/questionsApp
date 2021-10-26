import 'package:flutter/material.dart';
// import 'package:questions_app/services/level.dart';
// import 'package:questions_app/services/courses.dart';

class NoCoursesPage extends StatelessWidget {
  static String id = 'noCourses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unavailable'),
        backgroundColor: Color(0xff445B83),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            'Courses are not yet available',
            style: TextStyle(
              color: Colors.red,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
