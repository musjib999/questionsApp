import 'package:flutter/material.dart';
import 'package:pastQ/screens/courses_screen.dart';
import 'package:pastQ/screens/home_screen.dart';
import 'package:pastQ/screens/levels_screen.dart';
import 'package:pastQ/screens/semester_screen.dart';
import 'package:pastQ/screens/splash_screen.dart';
import 'package:pastQ/screens/unavailableCourses_screen.dart';

Map<String, WidgetBuilder> myRoutes = {
  SplashScreen.id: (BuildContext context) => SplashScreen(),
  HomePage.id: (BuildContext context) => HomePage(),
  LevelPage.id: (BuildContext context) => LevelPage(),
  CoursesPage.id: (BuildContext context) => CoursesPage(),
  SemesterPage.id: (BuildContext context) => SemesterPage(),
  NoCoursesPage.id: (BuildContext context) => NoCoursesPage(),
};
