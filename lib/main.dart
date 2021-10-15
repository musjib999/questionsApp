import 'package:flutter/material.dart';
import 'package:pastq/routes/routes.dart';
import 'package:pastq/screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: SplashScreen.id,
      theme: ThemeData(
        primaryColor: Color(0xff445B83),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xff445B83)),
      ),
      routes: myRoutes,
    );
  }
}
