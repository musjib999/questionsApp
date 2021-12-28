import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pastq/screens/splash_screen.dart';
import 'package:pastq/shared/themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xff445B83),
              // ignore: deprecated_member_use
              accentColor: AppColors.primaryDarkAsh,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Color(0xff445B83)),
            ),
            home: SplashScreen(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
