import 'package:flutter/material.dart';
import 'package:questions_app/screens/courses_screen.dart';
import 'package:questions_app/screens/levels_screen.dart';
import 'package:questions_app/screens/semester_screen.dart';
import 'package:questions_app/screens/unavailableCourses_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        HomePage.id: (BuildContext context) => HomePage(),
        LevelPage.id: (BuildContext context) => LevelPage(),
        CoursesPage.id: (BuildContext context) => CoursesPage(),
        SemesterPage.id: (BuildContext context) => SemesterPage(),
        NoCoursesPage.id: (BuildContext context) => NoCoursesPage(),
      },
    );
  }
}
