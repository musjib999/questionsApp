import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';

import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () async {
        bool? isOnboarding = await pastQservice.persistenceStorageservice
            .getBoolValuesSF('isViewOnboardingScreen');
        pastQservice.routerService.popUntil(
          context,
          isOnboarding == true ? HomePage() : OnboardingScreen(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Image.asset('assets/images/logo2.png', width: 70),
                ),
              ),
              // Expanded(child: Container()),
              SizedBox(height: 10),
              Text(
                'PastQ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff445B83),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
