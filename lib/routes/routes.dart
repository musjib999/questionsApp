import 'package:flutter/material.dart';
import 'package:pastq/screens/splash_screen.dart';
import 'package:pastq/screens/unavailableCourses_screen.dart';

Map<String, WidgetBuilder> myRoutes = {
  SplashScreen.id: (BuildContext context) => SplashScreen(),
  NoCoursesPage.id: (BuildContext context) => NoCoursesPage(),
};
