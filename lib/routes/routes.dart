import 'package:flutter/material.dart';
import 'package:pastq/screens/courses_screen.dart';
import 'package:pastq/screens/levels_screen.dart';
import 'package:pastq/screens/semester_screen.dart';
import 'package:pastq/screens/splash_screen.dart';
import 'package:pastq/screens/unavailableCourses_screen.dart';
import 'package:pastq/screens/upload_screen.dart';

Map<String, WidgetBuilder> myRoutes = {
  SplashScreen.id: (BuildContext context) => SplashScreen(),
  LevelPage.id: (BuildContext context) => LevelPage(),
  CoursesPage.id: (BuildContext context) => CoursesPage(),
  SemesterPage.id: (BuildContext context) => SemesterPage(),
  Upload.id: (BuildContext context) => Upload(),
  NoCoursesPage.id: (BuildContext context) => NoCoursesPage(),
};
